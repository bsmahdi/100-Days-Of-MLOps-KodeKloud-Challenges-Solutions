cd /root/code/fraud-detection

# Create required directories
mkdir -p data/raw data/processed models notebooks src/data src/features src/models src/utils tests configs

# Move old wrongly named src dirs if present
if [ -d src/feature ]; then
  cp -a src/feature/. src/features/ 2>/dev/null || true
  rm -rf src/feature
fi

if [ -d src/util ]; then
  cp -a src/util/. src/utils/ 2>/dev/null || true
  rm -rf src/util
fi

# Ensure __init__.py exists in every src subdirectory
touch src/data/__init__.py src/features/__init__.py src/models/__init__.py src/utils/__init__.py

# Correct requirements.txt
cat > requirements.txt <<'EOF'
scikit-learn
pandas
numpy
mlflow
EOF

# Correct README heading
cat > README.md <<'EOF'
# fraud-detection

ML project for fraud detection at xFusionCorp Industries.
EOF

# Verify
echo "===== FINAL TREE ====="
find . -maxdepth 4 -print | sort

echo "===== REQUIREMENTS ====="
cat requirements.txt

echo "===== README FIRST LINE ====="
head -1 README.md