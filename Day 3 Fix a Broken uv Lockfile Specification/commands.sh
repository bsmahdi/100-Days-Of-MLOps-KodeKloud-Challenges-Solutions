cd /root/code/fraud-detection

cat > requirements.in <<'EOF'
scikit-learn>=1.4
mlflow>=2.10
pandas>=2.0
numpy>=1.26
EOF

uv pip compile requirements.in -o requirements.txt

echo "===== requirements.in ====="
cat requirements.in

echo "===== top-level pins in requirements.txt ====="
grep -E '^(scikit-learn|mlflow|pandas|numpy)==' requirements.txt