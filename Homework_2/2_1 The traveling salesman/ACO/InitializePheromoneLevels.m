function tau = InitializePheromoneLevels(nrOfCities, tau0)

tau = ones(nrOfCities, nrOfCities);
tau = tau0.* tau;

end