import numpy as np
import matplotlib.pyplot as plt
import vtk
from vtk.numpy_interface import dataset_adapter as dsa

# load a vtk file as input
reader = vtk.vtkUnstructuredGridReader()
reader.SetFileName('../data/fixed0.vtk')
reader.Update()
output = reader.GetOutput()

array_of_points = dsa.WrapDataObject(output).Points
x = array_of_points[:,0]
y = array_of_points[:,1]

array_of_cells = dsa.WrapDataObject(output).Cells
nElement = int(len(array_of_cells) / 4)
element = np.zeros([nElement, 3])
lo = 1
for i in range(nElement):
    element[i,:] = array_of_cells[lo:lo+3]
    lo = lo + 4

plt.figure()
plt.triplot(x, y, element, color='k')
plt.axis('off')
plt.tight_layout()
plt.savefig('../figs/fixed0.pdf', bbox_inches='tight', pad_inches=0)
plt.close()
