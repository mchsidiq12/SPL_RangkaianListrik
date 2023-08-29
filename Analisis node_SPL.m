clc;
A=[3 -2 -1;-4 7 -1;2 -3 1] %meng-input nilai matriks A
C=[12;0;0] %meng-input nilai matriks C
N=length(C); %mendefiniskan banyak data pada matriks C
B=zeros(N,1); %membuat matrik B yang memiliki baris N dan kolom 1 dengan nilai awal 0 tiap baris
for i=1:N-1 %iterasi dilakukan dari i=1 sampai i=N-1
iterasi_1=i
[M,n]=max(abs(A(N:-1:i,i))); %rumus untuk mendapatkan nilai absolut terbesar pada matriks dan juga berada pada baris keberapa dimana M=nilai absolut terbesar pada kolom i dan n= letak baris dari nilai M
%%%%PENUKARAN BARIS%%%%%%
if n~=i %jika n tidak sama dengan i maka dilakukan penukaran baris agar terbentuk diagonal utama yg memiliki nilai absolut terbesar
p=A(i,:); %menyimpan nilai pada matrik A baris i dalam p
q=C(i); %menyimpan nilai pada matrik C baris i dalam q
A(i,:)=A(n,:); %mengubah nilai dari matriks A baris n menjadi = baris i
C(i)=C(n); %mengubah nilai dari matriks C baris n menjadi = baris i
A(n,:)=p; %%mengubah nilai dari matriks A baris n menjadi = nilai p
C(n)=q; %%mengubah nilai dari matriks C baris n menjadi = nilai q
end
%%%%%%%PROSES PENGE-NOL-AN KOLOM DIBAWAH DIAGONAL UTAMA%%%%%
for j=i+1:N %iterasi dilakukan dari j=i+1 sampai j=N
pengulangan_1=j;
d=A(j,i)/A(i,i); %mencari rasio nilai kolom dibawah diagonal utama
A(j,:)=A(j,:)-d*A(i,:); %proses OBE pada matriks A untuk menge-nolkan kolom dibawah diagonal utama
C(j)=C(j)-d*C(i); %proses OBE pada matriks C
end
disp(A)
disp (C)
end

%%%PROSES SUBTITUSI UNTUK MENDAPATKAN NILAI DARI MATRIKS B%%%%%%
for k=N:-1:1; %iterasi menurun dilakukan dari k=N sampai k=1
iterasi_2=k
u=0; %menginisiasikan u awal=0 untuk proses iterasi dibawah
for l=N:-1:k %iterasi menurun dilakukan dari l=N sampai l=k
pengulangan_2=l
u=u+A(k,l)*B(l); %rumus mendapatkan pola untuk subtitusi yang akan dilanjutkan pada rumus dibawah
end
B(k)=(C(k)-u)/A(k,k); %lanjutan rumus diatas ini merupakan bagian terakhir dari mencari nilai matriks B baris k
disp(A)
disp(B)
disp (C)
end

%%%%HASIL AKHIR DIDAPATKAN NILAI DARI MATRIKS B%%%%%%
disp ("A=")
disp(A)
disp("B=")
disp(B)
disp("C=")
disp(C)
disp("maka tegangan tiap node adalah")
disp("v1=")
disp(B(1))
disp("v2=")
disp(B(2))
disp("v3=")
disp(B(3))