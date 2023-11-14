# import torch
# x = torch.rand(5, 3)
# print(x)
# import torch
# cuda = torch.cuda.is_available()
# print(cuda)
from extractFeatures import extract_features
import pandas as pd


dfs = []

# Assuming 'smcAC' is the column you are interested in
selected_columns = ['smcAC', 'smcDC', 'vib_table',
                    'vib_spindle', 'AE_table', 'AE_spindle']

# Loop through each CSV file
# assuming we have files named 1.csv, 2.csv, ..., 167.csv
for file_number in range(1, 168):
    file_path = f'../machineData/{file_number}.csv'

    # Read the CSV file into a DataFrame
    machine_data = pd.read_csv(file_path, skiprows=0)

    # Dictionary to store features for each column
    features_dict = {}

    # Loop through specific signal columns and extract features
    for column in selected_columns:
        selected_data = machine_data[column]
        features_column = extract_features(selected_data)
        features_dict[column] = features_column

    # Flatten the nested structure and convert to a DataFrame
    flattened_features = {}
    for column, feature_dict in features_dict.items():
        for key, value in feature_dict.items():
            flattened_features[f'{column}_{key}'] = value

    flattened_df = pd.DataFrame([flattened_features])

    # Append the DataFrame to the list
    dfs.append(flattened_df)

# Concatenate all DataFrames into a single DataFrame
result_df = pd.concat(dfs, ignore_index=True)

# Export the result to a CSV file
result_df.to_csv('combined_features.csv', index=False)
