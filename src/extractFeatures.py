import pandas as pd
import numpy as np
from scipy.stats import skew, kurtosis
from scipy.fftpack import fft
from scipy.signal import find_peaks
from scipy.stats import entropy


def extract_features(signal):
    features = {}

    # Convert the column to numeric, handling non-numeric values
    signal_numeric = pd.to_numeric(signal, errors='coerce')

    # Replace or remove specific non-numeric values
    signal_numeric.replace('ALIGNED', np.nan, inplace=True)

    # Remove NaN values or use interpolation as needed
    signal_numeric.dropna(inplace=True)

    # Convert to NumPy array
    signal_array = signal_numeric.to_numpy()

    # Check if the array is not empty
    if len(signal_array) > 0:
        # Time-domain features
        features['mean'] = np.mean(signal_array)
        features['std_dev'] = np.std(signal_array)
        features['rms'] = np.sqrt(np.mean(np.square(signal_array)))
        features['skewness'] = skew(signal_array)
        features['kurtosis'] = kurtosis(signal_array)
        features['max_value'] = np.max(signal_array)
        features['min_value'] = np.min(signal_array)
        features['median'] = np.median(signal_array)
        features['iqr'] = np.percentile(
            signal_array, 75) - np.percentile(signal_array, 25)
        features['zero_crossing_rate'] = np.sum(
            np.diff(np.sign(signal_array)) != 0) / len(signal_array)

        # Frequency-domain features using FFT
        try:
            fft_result = fft(signal_array)
            magnitude_spectrum = np.abs(fft_result)

            features['dominant_frequency'] = np.argmax(magnitude_spectrum)
            features['max_frequency_magnitude'] = np.max(magnitude_spectrum)

            # Statistical measures
            # features['auto_correlation'] = np.correlate(
            #     signal_array, signal_array, mode='full')

            # Frequency-domain features
            features['power_spectral_density'] = np.mean(
                np.square(magnitude_spectrum))
            features['total_power'] = np.sum(np.square(signal_array))
            features['spectral_entropy'] = entropy(magnitude_spectrum)
            features['centroid_frequency'] = np.sum(np.arange(
                len(magnitude_spectrum)) * magnitude_spectrum) / np.sum(magnitude_spectrum)

            # Time-frequency features
            # Add your wavelet transform code here
            # Example using FFT for STFT
            # features['wavelet_coefficients'] = []
            # features['stft'] = np.abs(np.fft.fftshift(
            # np.fft.fft(signal_array)))

            # Other features
            # features['peaks_count'], _ = find_peaks(signal_array)

        except ValueError as e:
            print(f"Error in FFT calculation: {e}")

    return features