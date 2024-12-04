with open("./input.txt") as f:
    lines = f.read().splitlines()

total = 0
for line in lines:

    count = 1
    line = [int(x) for x in line.split(' ')]
    sign = 1 if line[1] > line[0] else 0

    opt = 0

    for i in range(len(line) - 1):

        if opt == 1:
            pass

        diff = line[i + 1] - line[i]
        tmp_sign = 1 if diff > 0 else 0

        if sign != tmp_sign or not(1 <= abs(diff) <= 3):
            if opt == 0:
                if i == 0:
                    bruh_1 = line[2] - line[1]
                    bruh_2 = line[2] - line[0]
                    sign1 = 1 if bruh1 > 0 else 0
                    sign2 = 1 if bruh2 > 0 else 0
                    if sign1 == sign and sign2 == sign:
                        tmp = 1 if line[3] > line[2] else 0
                        if sign == tmp:
                            opt = 1
                    if sign1 == sign and sign2 != sign:
                        sign = sign1

                    if sign1 != sign and sign2 == sign:
                        sign = sign2

                    opt = 1
                elif 1 <= i <= len(line) - 2:
                    tmp_sign_1 = 1 if line[i + 1] > line[i - 1] else 0
                    if (sign == tmp_sign_1) and (1 <= abs(line[i + 1] - line[i - 1]) <= 3):
                        opt = 1
                    else:
                        count = 0
                        break
            else:
                break

    if count == 1:
        total += 1

print(total)
