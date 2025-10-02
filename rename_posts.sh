#!/usr/bin/env bash
set -euo pipefail

# Déplace-toi dans le dossier _posts
cd /Users/Sami/mon-site/_posts

# Sous-dossier contenant les articles
BASE_DIR="posts"

# Dossier backup au cas où
BACKUP_DIR="../backup_posts_$(date +%s)"
mkdir -p "$BACKUP_DIR"

# Date par défaut si non trouvée
DEFAULT_DATE=$(date '+%Y-%m-%d')

shopt -s nullglob
for article_dir in "$BASE_DIR"/*/ ; do
  # Vérifie qu'il y a un index.md
  if [ -f "${article_dir}index.md" ]; then
    # Récupère le titre du dossier
    title=$(basename "$article_dir")
    
    # Date : on peut prendre la date actuelle ou à modifier manuellement
    date="$DEFAULT_DATE"
    
    # Slugify : tout en minuscules, lettres/nombres/hyphens
    slug=$(echo "$title" \
      | iconv -t ascii//TRANSLIT 2>/dev/null || echo "$title" \
      | tr '[:upper:]' '[:lower:]' \
      | sed 's/[^a-z0-9]/-/g' \
      | sed 's/-\+/-/g' \
      | sed 's/^-//; s/-$//')
    
    # Nouveau nom de fichier
    newfile="${POSTS_DIR}/${date}-${slug}.md"
    if [ -f "$newfile" ]; then
      i=1
      while [ -f "../${date}-${slug}-$i.md" ]; do
        i=$((i+1))
      done
      newfile="../${date}-${slug}-$i.md"
    fi

    # Backup du fichier original
    cp "${article_dir}index.md" "$BACKUP_DIR/"

    # Déplacer le index.md vers _posts avec le nouveau nom
    mv "${article_dir}index.md" "$newfile"
    
    echo "✅ Déplacé: ${article_dir}index.md → $newfile"
    
  else
    echo "⏭️ Pas d'index.md dans $article_dir, ignoré"
  fi
done

echo
echo "✅ Tous les fichiers index.md ont été renommés pour Jekyll."
echo "Backup des fichiers originaux dans $BACKUP_DIR"


