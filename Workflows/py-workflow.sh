# create conda environments
conda create --name <myenv> python=<ver> <pkg>
conda activate <myenv>
conda env export >  <myenv>.yaml
