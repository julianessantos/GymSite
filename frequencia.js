
            window.onload = function () {
                criarCalendario();

                var contadorCliques = {};

                function criarCalendario() {
                    var calendario = document.getElementById("calendario");

                    // Obter data atual
                    var dataAtual = new Date();
                    var ano = dataAtual.getFullYear();
                    var mes = dataAtual.getMonth();

                    // Obter o número de dias no mês
                    var diasNoMes = new Date(ano, mes + 1, 0).getDate();

                    // Obter o dia da semana do primeiro dia do mês
                    var primeiroDiaSemana = new Date(ano, mes, 1).getDay();

                    // Cabeçalho do Calendário
                    var diasSemana = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"];
                    for (var i = 0; i < 7; i++) {
                        var diaSemana = document.createElement("div");
                        diaSemana.innerHTML = diasSemana[i];
                        diaSemana.className = "day";
                        calendario.appendChild(diaSemana);
                    }

                    // Preencher os dias do mês
                    for (var i = 0; i < primeiroDiaSemana; i++) {
                        calendario.appendChild(document.createElement("div"));
                    }

                    for (var dia = 1; dia <= diasNoMes; dia++) {
                        var diaElemento = document.createElement("div");
                        diaElemento.className = "dia";
                        diaElemento.innerHTML = dia;
                        diaElemento.onclick = function () {
                            toggleFrequencia(this);
                        };
                        calendario.appendChild(diaElemento);
                    }
                }

                function toggleFrequencia(elemento) {
                    var chave = elemento.innerHTML;

                    if (contadorCliques[chave] === undefined) {
                        contadorCliques[chave] = 1;
                    } else {
                        contadorCliques[chave]++;
                    }

                    if (contadorCliques[chave] === 1) {
                        elemento.classList.remove("vermelho");
                        elemento.classList.add("verde");
                    } else {
                        elemento.classList.remove("verde");
                        elemento.classList.add("vermelho");
                        contadorCliques[chave] = 0; // Reinicia o contador
                    }
                }
            };

