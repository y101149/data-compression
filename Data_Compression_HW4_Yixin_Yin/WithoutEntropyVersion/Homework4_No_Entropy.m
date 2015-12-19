clear;
% [I,map] = imread('River.gif');
[I,map] = imread('Lena.gif');
G = ind2gray(I,map);
scalar = 3;
quanMatrix = [
    16	11	10	16	24	40	51	61
    12	12	14	19	26	58	60	55
    14	13	16	24	40	57	69	56
    14	17	22	29	51	87	80	62
    18	22	37	56	68	109	103	77
    24	35	55	64	81	104	113	92
    49	64	78	87	103	121	120	101
    72	92	95	98	112	100	103	99];
blocksize = [8,8];
%First Convert the Image to Double
image = double(G);
%sub 128 for each elements
sub128 = image - 128;
%apply dct on each 8*8 block
applydct = blkproc(sub128, blocksize, @dct2);
%apply quantize on each block
applyquan = blkproc(applydct,blocksize,@No_Entropy_Quantize,scalar*quanMatrix);

%----------------------------------------------------------
%apply dequantize on each block
convertquan = blkproc(applyquan,blocksize,@No_Entropy_Dequantize,scalar*quanMatrix);
%apply idct on each block
convertidct = blkproc(convertquan,blocksize,@idct2);
%add 128 for each element
rebuildImage = convertidct + 128;
imagesc(rebuildImage);
colormap(gray);
SNR = snr(image,rebuildImage);

