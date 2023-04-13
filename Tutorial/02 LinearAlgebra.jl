using LinearAlgebra
using SparseArrays
using Images
using MAT

A = rand(10,10);
Atranspose = A'
A = A*Atranspose;


#@show A[11] == A[1,2]

b=rand(10);
x = A\b;
@show norm(A*x-b)

@show typeof(A)
@show typeof(b)
@show typeof(rand(1,10))
@show typeof(Atranspose)
;

luA = lu(A)

qrA = qr(A)

cholA = cholesky(A)

factorize(A)

S = sprand(5,5,2/5)

@show S.colptr
@show S.m

X1 = load("Tutorial/Images/khiam-small.jpg")
Xgray = Gray.(X1)

XgrayValues = Float64.(Xgray)

SVD_V = svd(XgrayValues)

# use the top 4 singular vectors/values to form a new image
u1 = SVD_V.U[:,1]
v1 = SVD_V.V[:,1]
img1 = SVD_V.S[1]*u1*v1'

i = 2
u1 = SVD_V.U[:,i]
v1 = SVD_V.V[:,i]
img1 += SVD_V.S[i]*u1*v1'

i = 3
u1 = SVD_V.U[:,i]
v1 = SVD_V.V[:,i]
img1 += SVD_V.S[i]*u1*v1'

i = 4
u1 = SVD_V.U[:,i]
v1 = SVD_V.V[:,i]
img1 += SVD_V.S[i]*u1*v1'

Gray.(img1)

i = 1:50
u1 = SVD_V.U[:,i]
v1 = SVD_V.V[:,i]
img1 = u1*spdiagm(0=>SVD_V.S[i])*v1'
Gray.(img1)

M = matread("Images/face_recog_qr.mat")
q = reshape(M["V2"][:,1],192,168)
Gray.(q)



b = q[:];
A = M["V2"][:,2:end]
x = A\b #Ax=b
Gray.(reshape(A*x,192,168))