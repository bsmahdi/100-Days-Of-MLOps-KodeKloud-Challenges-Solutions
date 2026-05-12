# First you have to fix the JupyterLab config to match the requirements, then run the server
cd /root/code

cat > /root/code/jupyter_lab_config.py <<'EOF'
# Jupyter configuration file for the xFusionCorp Industries data science team

# --- xFusionCorp team overrides (review before starting the server) ---
c.ServerApp.token = ''
c.ServerApp.password = ''
c.ServerApp.disable_check_xsrf = True
c.ServerApp.notebook_dir = '/root/notebooks/'
c.ServerApp.port = 8888
c.ServerApp.ip = '0.0.0.0'
EOF

mkdir -p /root/notebooks

source /root/code/ml-env/bin/activate

# Stop any old Jupyter process if present
pkill -f "jupyter-lab|jupyter lab" || true

jupyter lab --config=/root/code/jupyter_lab_config.py --allow-root --no-browser > /tmp/jupyterlab.log 2>&1 &

sleep 5

ss -lntp | grep ':8888' || true
ps aux | grep -i '[j]upyter' || true
tail -40 /tmp/jupyterlab.log