# Create the directory if it does not exist
#mkdir -p /root/code

# Create the virtual environment
python3 -m venv /root/code/ml-env

# Activate the virtual environment
source /root/code/ml-env/bin/activate

# Install required ML packages
pip install numpy pandas scikit-learn matplotlib

# Generate requirements.txt
pip freeze > /root/code/requirements.txt

# Optional verification
cat /root/code/requirements.txt