import csv 

files = ["./genetic/dp_0.csv", "./genetic/dp_1.csv", "./genetic/dp_2.csv", "./genetic/dp_3.csv", "./genetic/lt01_0.csv", "./genetic/lt01_1.csv", "./genetic/lt01_2.csv", "./genetic/lt01_3.csv", "./knn/dp_0.csv", "./knn/dp_1.csv", "./knn/dp_2.csv", "./knn/dp_3.csv", "./knn/lt01_0.csv", "./knn/lt01_1.csv", "./knn/lt01_2.csv", "./knn/lt01_3.csv",]
models = ["./parsed/genetic/dp0_ymodel.csv", "./parsed/genetic/dp1_ymodel.csv", "./parsed/genetic/dp2_ymodel.csv", "./parsed/genetic/dp3_ymodel.csv", "./parsed/genetic/lt01_0_ymodel.csv", "./parsed/genetic/lt01_1_ymodel.csv", "./parsed/genetic/lt01_2_ymodel.csv", "./parsed/genetic/lt01_3_ymodel.csv", "./parsed/knn/dp0_ymodel.csv", "./parsed/knn/dp1_ymodel.csv", "./parsed/knn/dp2_ymodel.csv", "./parsed/knn/dp3_ymodel.csv", "./parsed/knn/lt01_0_ymodel.csv", "./parsed/knn/lt01_1_ymodel.csv", "./parsed/knn/lt01_2_ymodel.csv", "./parsed/knn/lt01_3_ymodel.csv"]
verifs = ["./parsed/genetic/dp0_yverif.csv", "./parsed/genetic/dp1_yverif.csv", "./parsed/genetic/dp2_yverif.csv", "./parsed/genetic/dp3_yverif.csv", "./parsed/genetic/lt01_0_yverif.csv", "./parsed/genetic/lt01_1_yverif.csv", "./parsed/genetic/lt01_2_yverif.csv", "./parsed/genetic/lt01_3_yverif.csv", "./parsed/knn/dp0_yverif.csv", "./parsed/knn/dp1_yverif.csv", "./parsed/knn/dp2_yverif.csv", "./parsed/knn/dp3_yverif.csv", "./parsed/knn/lt01_0_yverif.csv", "./parsed/knn/lt01_1_yverif.csv", "./parsed/knn/lt01_2_yverif.csv", "./parsed/knn/lt01_3_yverif.csv"]

for (data, model_dest, verif_dest) in zip(files, models, verifs):
    with open(data) as csvfile:
        y_model = []
        y_verif = []

        reader = csv.reader(csvfile, delimiter=',')
        for idx, [yv, ym] in enumerate(reader):
            y_verif.append([idx*10, yv])
            y_model.append([idx*10, ym])

        with open(model_dest, "w") as cf:
            writer = csv.writer(cf, delimiter=' ')
            for r in y_model:
                writer.writerow(r)

        with open(verif_dest, "w") as cf:
            writer = csv.writer(cf, delimiter=' ')
            for r in y_verif:
                writer.writerow(r)
        