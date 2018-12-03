#include<stdio.h>
int main() {
  
  int i, j = 0, soma; 

  
	while(i<=256) {
		j = 1;
		while(j<=i) {
			if(i%j==0) soma = soma + i;
			j++;
		}
		i++;
	}
	printf("%d", soma);

  return 0;
  
}
