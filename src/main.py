# import torch
# x = torch.rand(5, 3)
# print(x)
import torch
cuda = torch.cuda.is_available()
print(cuda)
