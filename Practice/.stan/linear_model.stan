data{
    int N;
    int N_2020;
    vector[N] logY;
    vector[N] T;
    vector[N_2020] T_2020;
}

parameters{
  real<lower=0> a;
  real<lower=0> b;
  real<lower=0> s_y;
}

transformed parameters{
  vector[N] mu;
  for (i in 1:N)
    mu[i] = a + b*T[i];
}

model {
  logY ~ normal(mu,s_y);
}

generated quantities {
  vector[N_2020] logY_2020;
  for (i in 1:N_2020){
    logY_2020[i] = normal_rng(a + b*T_2020[i],s_y);
  }
}
