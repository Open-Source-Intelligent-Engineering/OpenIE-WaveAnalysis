% һ���ű�����ÿһ�������źŵ�ͼ��ѭ���������ͼ��
%%
clc;clear;

%%
clear;clc;
load('./DATA/data.mat');
for n = 1:145
%%
    smcAC = data(n).smcAC;
    smcDC = data(n).smcDC;
    vib_table = data(n).vib_table;
    vib_spindle = data(n).vib_spindle;
    AE_table = data(n).AE_table;
    AE_spindle = data(n).AE_spindle;
    title("�����ź�");
    subplot(2,3,1), plot(smcAC), xlabel('���������������ź�');
    subplot(2,3,2), plot(smcDC), xlabel('ֱ�������������ź�');
    subplot(2,3,3), plot(vib_table), xlabel('����̨���ź�');
    subplot(2,3,4), plot(vib_spindle), xlabel('�������ź�');
    subplot(2,3,5), plot(AE_table), xlabel('����̨�����ź�');
    subplot(2,3,6), plot(AE_spindle), xlabel('���������ź�');

    %%
    number = num2str(n); % ����ת��Ϊ�ַ���
    filename = ['picture', number]; % �ַ���ƴ��
    saveas(gcf,['./PIC/',filename,'.fig']);

    %%
    close all;
end