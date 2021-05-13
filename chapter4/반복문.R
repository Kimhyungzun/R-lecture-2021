# 반복문
# 1. repeat
i <- 1
sum <- 0
repeat {
    if (i > 10) {
        break
    }
    sum <- sum + i
    i <- i + 1
}

print(sum)

# while
i <- 1
sum <- 0

while(i <= 10) {
    sum <- sum +i
    i <- i + 1
}
print(sum)

#for
sum <- 0
for (i in 1:10) {
    sum <- sum + i
}
print(sum)

# 10 factorial
fac_i <- 1
for (i in 1:10) {
    fac_i <- fac_i * i
}
print(fac_i)

# 1~100 홀수의 합
odd_sum <- 0
for (j in 1:100) {
    if (j%%2 == 1){
        odd_sum <- odd_sum + j
    }
}
print(odd_sum)

odd_sum <- 0
for (k in seq(1,100,by = 2)) {
    odd_sum <- odd_sum + k
}
print(odd_sum)

# 구구단 만들기
for (k in 1:9) {
    print(paste('2', 'x', k, '=', 2*k))
}

for (k in 2:9) {
    print(paste0(k,'단 =================='))
    for (j in 1:9) {
        print(paste(k, 'x', j, '=', k*j))
    }
}

#답
mat <- matrix(1:12, nrow=3)
nrow <- 3
ncol <- 4
sum1 <- 0
sum2 <- 0
sum3 <- 0
for (i in 1:nrow) {
    for (j in 1:ncol) {
        sum1 <- mat[i,j] + sum1
        sum2 <- mat[i,j]**2 + sum2
        sum3 <- mat[i,j]**i + sum3
    }
}
print(paste(sum1,sum2,sum3))

# 별
for (i in 1:5) {
    star <- ''
    for (j in 1:i) {
        star <- paste0(star, '+')
    }
    print(star)
}

# list 만들기
lst = list()
lst <- append(lst,3)
lst <- append(lst,5)
lst <- append(lst,7)
lst
length(lst)
lst[1]
lst[2]
lst[3]

lst <- list()
for (i in 1:5) {
    lst <- append(lst,i)
}
lst

for (element in lst) {
    print(element)
}

vec <- c(1,7,8)
for (element in vec) {
    print(element)
}

for (element in mat) {
    print(element)
}

# 약수
N <- 6
for (num in 1:N) {
    if (N %% num == 0) {
        print(num)
    }
}

# 약수의 합
sum <- 0
for (num in 1:N) {
    if (N %% num == 0) {
        sum <- sum + num
    }
}
print(sum)

# 완전수

for (N in 2:10000) {
    sum <- 0
    for (num in 1:(N-1)) {
        if (N %% num == 0) {
            sum <- sum + num
        }
    }
    if (sum == N) {
        print(N)
    }
}


for (x in 2:2000) {
    sum <- 0
    for(num in 1:(x-1)) {
        if(x %% num == 0) {
            sum <- sum + num
        }
    }
    if (sum == x) {
        print(x)
    }
}












