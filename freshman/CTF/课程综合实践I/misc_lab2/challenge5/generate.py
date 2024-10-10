from array2gif import write_gif  # version: 1.0.4
import librosa  # version: 0.8.1
import numpy  # version: 1.19.5


num_freqs = 32
quantize = 2
min_db = -60 #z最大音量
max_db = 30 #最小音量
fft_window_size = 2048 #窗口大小
frame_step_size = 512
window_function_type = 'hann'
red_pixel = [255, 0, 0] #红色
white_pixel = [255, 255, 255] #白色
y, sample_rate = librosa.load(input("Input your music name:"))  # sample rate is 22050 Hz #读取音频，y为音频数组，sample_rate为采样频率22050Hz

spectrogram = numpy.around( # 四舍五入 #频谱图
    librosa.power_to_db( # 将功率谱转换为分贝（dB）单位
        librosa.feature.melspectrogram( # 创建一个滤波器组矩阵以将FFT合成Mel频率
            y, sample_rate, n_mels=num_freqs,
            n_fft=fft_window_size, 
            hop_length=frame_step_size, 
            window=window_function_type
        )
    ) / quantize
) * quantize

gif_data = [
    numpy.kron( #克罗内克积
        numpy.array([
            [
                red_pixel if freq % 2 and round(frame[freq // 2]) > threshold else white_pixel 
                for threshold in list(range(min_db, max_db + 1, quantize))[::-1] #从最大音量到最小音量，步长为2
            ] 
            for freq in range(num_freqs * 2 + 1) #0~64
        ]), 
        numpy.ones([quantize, quantize, 1])
    ) 
    for frame in spectrogram.transpose() #转置
]

write_gif(gif_data, 'out.gif', fps=sample_rate/frame_step_size)
