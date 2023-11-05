% time_domain_analysis ʱ���źŷ���
%%
clear;clc;
load('./DATA/data.mat');

%%
for n = 1:145
    % smcAC, smcDC, vib_table, vib_spindle, AE_table, AE_spindle
    % ʱ������ ���Ծ�ֵ�� ��ֵ�� ������ֵ�� ������ֵ�� ���ֵ�� �Ͷ�ֵ�� �������ӣ� �������ӣ� ƫ�����ӣ� ��ֵ���ӣ� ԣ������
    %% smcAC
    data(n).smcAC_ma = mean(abs(data(n).smcAC)); % ���Ծ�ֵ
    data(n).smcAC_peak = max(abs(data(n).smcAC)); % ��ֵ
    data(n).smcAC_rms = rms(data(n).smcAC); % ������ֵ
    data(n).smcAC_ra = mean(sqrt(abs(data(n).smcAC))).^2; % ������ֵ
    % data(n).smcAC_skewness =  % ���ֵ�����̫�����ˣ�Ҫ�Լ�����һ������
    data(n).smcAC_kurtosis = mean(data(n).smcAC.^4); % �Ͷ�ֵ
    data(n).smcAC_shape = data(n).smcAC_rms ./ data(n).smcAC_ma; % ��������
    data(n).smcAC_pulse = data(n).smcAC_rms ./ data(n).smcAC_ma; % ��������
    % data(n).smcAC_fshape = data(n).smcAC_skewness ./ (data(n).smcAC_rms).^3; % ƫ������
    data(n).smcAC_crest = data(n).smcAC_peak ./ data(n).smcAC_rms; % ��ֵ����
    data(n).smcAC_clearance = data(n).smcAC_peak ./ data(n).smcAC_ra; % ԣ������

    %% smcDC
    data(n).smcDC_ma = mean(abs(data(n).smcDC)); % ���Ծ�ֵ
    data(n).smcDC_peak = max(abs(data(n).smcDC)); % ��ֵ
    data(n).smcDC_rms = rms(data(n).smcDC); % ������ֵ
    data(n).smcDC_ra = mean(sqrt(abs(data(n).smcDC))).^2; % ������ֵ
    % data(n).smcDC_skewness =  % ���ֵ�����̫�����ˣ�Ҫ�Լ�����һ������
    data(n).smcDC_kurtosis = mean(data(n).smcDC.^4); % �Ͷ�ֵ
    data(n).smcDC_shape = data(n).smcDC_rms ./ data(n).smcDC_ma; % ��������
    data(n).smcDC_pulse = data(n).smcDC_rms ./ data(n).smcDC_ma; % ��������
    % data(n).smcDC_fshape = data(n).smcDC_skewness ./ (data(n).smcDC_rms).^3; % ƫ������
    data(n).smcDC_crest = data(n).smcDC_peak ./ data(n).smcDC_rms; % ��ֵ����
    data(n).smcDC_clearance = data(n).smcDC_peak ./ data(n).smcDC_ra; % ԣ������

    %% vib_table
    data(n).vib_table_ma = mean(abs(data(n).vib_table)); % ���Ծ�ֵ
    data(n).vib_table_peak = max(abs(data(n).vib_table)); % ��ֵ
    data(n).vib_table_rms = rms(data(n).vib_table); % ������ֵ
    data(n).vib_table_ra = mean(sqrt(abs(data(n).vib_table))).^2; % ������ֵ
    % data(n).vib_table_skewness =  % ���ֵ�����̫�����ˣ�Ҫ�Լ�����һ������
    data(n).vib_table_kurtosis = mean(data(n).vib_table.^4); % �Ͷ�ֵ
    data(n).vib_table_shape = data(n).vib_table_rms ./ data(n).vib_table_ma; % ��������
    data(n).vib_table_pulse = data(n).vib_table_rms ./ data(n).vib_table_ma; % ��������
    % data(n).vib_table_fshape = data(n).vib_table_skewness ./ (data(n).vib_table_rms).^3; % ƫ������
    data(n).vib_table_crest = data(n).vib_table_peak ./ data(n).vib_table_rms; % ��ֵ����
    data(n).vib_table_clearance = data(n).vib_table_peak ./ data(n).vib_table_ra; % ԣ������

    %% vib_spindle
    data(n).vib_spindle_ma = mean(abs(data(n).vib_spindle)); % ���Ծ�ֵ
    data(n).vib_spindle_peak = max(abs(data(n).vib_spindle)); % ��ֵ
    data(n).vib_spindle_rms = rms(data(n).vib_spindle); % ������ֵ
    data(n).vib_spindle_ra = mean(sqrt(abs(data(n).vib_spindle))).^2; % ������ֵ
    % data(n).vib_spindle_skewness =  % ���ֵ�����̫�����ˣ�Ҫ�Լ�����һ������
    data(n).vib_spindle_kurtosis = mean(data(n).vib_spindle.^4); % �Ͷ�ֵ
    data(n).vib_spindle_shape = data(n).vib_spindle_rms ./ data(n).vib_spindle_ma; % ��������
    data(n).vib_spindle_pulse = data(n).vib_spindle_rms ./ data(n).vib_spindle_ma; % ��������
    % data(n).vib_spindle_fshape = data(n).vib_spindle_skewness ./ (data(n).vib_spindle_rms).^3; % ƫ������
    data(n).vib_spindle_crest = data(n).vib_spindle_peak ./ data(n).vib_spindle_rms; % ��ֵ����
    data(n).vib_spindle_clearance = data(n).vib_spindle_peak ./ data(n).vib_spindle_ra; % ԣ������

    %% AE_table
    data(n).AE_table_ma = mean(abs(data(n).AE_table)); % ���Ծ�ֵ
    data(n).AE_table_peak = max(abs(data(n).AE_table)); % ��ֵ
    data(n).AE_table_rms = rms(data(n).AE_table); % ������ֵ
    data(n).AE_table_ra = mean(sqrt(abs(data(n).AE_table))).^2; % ������ֵ
    % data(n).AE_table_skewness =  % ���ֵ�����̫�����ˣ�Ҫ�Լ�����һ������
    data(n).AE_table_kurtosis = mean(data(n).AE_table.^4); % �Ͷ�ֵ
    data(n).AE_table_shape = data(n).AE_table_rms ./ data(n).AE_table_ma; % ��������
    data(n).AE_table_pulse = data(n).AE_table_rms ./ data(n).AE_table_ma; % ��������
    % data(n).AE_table_fshape = data(n).AE_table_skewness ./ (data(n).AE_table_rms).^3; % ƫ������
    data(n).AE_table_crest = data(n).AE_table_peak ./ data(n).AE_table_rms; % ��ֵ����
    data(n).AE_table_clearance = data(n).AE_table_peak ./ data(n).AE_table_ra; % ԣ������

    %% AE_spindle
    data(n).AE_spindle_ma = mean(abs(data(n).AE_spindle)); % ���Ծ�ֵ
    data(n).AE_spindle_peak = max(abs(data(n).AE_spindle)); % ��ֵ
    data(n).AE_spindle_rms = rms(data(n).AE_spindle); % ������ֵ
    data(n).AE_spindle_ra = mean(sqrt(abs(data(n).AE_spindle))).^2; % ������ֵ
    % data(n).AE_spindle_skewness =  % ���ֵ�����̫�����ˣ�Ҫ�Լ�����һ������
    data(n).AE_spindle_kurtosis = mean(data(n).AE_spindle.^4); % �Ͷ�ֵ
    data(n).AE_spindle_shape = data(n).AE_spindle_rms ./ data(n).AE_spindle_ma; % ��������
    data(n).AE_spindle_pulse = data(n).AE_spindle_rms ./ data(n).AE_spindle_ma; % ��������
    % data(n).AE_spindle_fshape = data(n).AE_spindle_skewness ./ (data(n).AE_spindle_rms).^3; % ƫ������
    data(n).AE_spindle_crest = data(n).AE_spindle_peak ./ data(n).AE_spindle_rms; % ��ֵ����
    data(n).AE_spindle_clearance = data(n).AE_spindle_peak ./ data(n).AE_spindle_ra; % ԣ������

end

%%
% ɾ��6���ź�
data = rmfield(data, {'smcAC', 'AE_spindle', 'smcDC', 'vib_table', 'vib_spindle', 'AE_table'});
% ��������
save time_domain_analysis;
