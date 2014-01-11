BEGIN{
	FS="[><()\"]";	
	}
$0 ~/^<table/{
	while(1){
	
		if($0 ~/^<table/){
			getline;
		}else{ 
				if($0 ~/.*<\/table>.*/){
						getline;
						continue;
					}
				getline;
				if($0 ~/<th.*/){
					i=$11;

					}
				if($0 ~/<td rowspan.*/){
						b=$NF;
					
					}

				if($0 ~/<td.*title=".*".*/){
					c=$5","$7;
						
					}
				if($0 ~/<td>[^ a-z0-9].*/){
					a[i","b","c","$3]=$3;	
					
					}
						
					
					
			}
		if(NR>=1405) break;
		}
	}
END{
	for(h in a){
		print h  
		}
	}
