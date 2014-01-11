BEGIN{
	FS="[<>]"
	n1=n2=n3=n4=0
	}
	{
		if($0 ~/<h1.*firstHeading.*/){
				a=$3;		
			}
		if($0 ~/^<h2.*/){
				n1++;
				b=$5;

				if($0 ~/^<h2.*HTTP.*/){
					hp=$5
					n=NR;
				}
		}
		if($0 ~/^<p>.*href.*>.*/){
				n2++;
				for(i=1;i<=NF;i++){
						if($i ~/^https.*/  &&  n1==n2)

								c=b","$i;
					}
			}
		if(b ~/.*参数/){
			if ($0 ~/^<tr.*/){
				n4++;
				if(n4>2)
					e=e"\n"
				}
			if(n4>=2){
				if($0 ~/^<td.*/){
						e=e"	"$NF;
					
					}
				
				}
		
				
			}
		if($0 ~/<pre.*/){
			ar[a","c","d"\n"e]=""		
			}

		
		
		
		}
		NR==n+1{
			
					for(i=1;i<=NF;i++){
						if($i ~/(GET|POST).*/)
							d=hp","$i;

					}
			
			}
END{
	for (i in ar)
		print i
	print e

	}

