######################################################
#            Created by Aldo Barrios                 #
#           Aldo.barrios@ericsson.com                #
#           Thursday, August 01 - 2013               #
######################################################
cd /opt/GNOC/DATORA/performance/CORE/
USER=ealdoba
HOST=127.0.0.1
PORT=9282
RUTA=20131025 #$(date --date=yesterday +%Y%m%d)
if [[ ! -e $RUTA ]]; then
    mkdir $RUTA
fi
NOMB_FILE=/opt/GNOC/DATORA/performance/CORE/$RUTA/Antel_CsCore.xml                    #$(date +%d_%m_%Y_%I_%M%p).xml;
echo "Date:    "$RUTA
/usr/local/bin/sshpass -p 'ealdoba' scp -P $PORT $USER@$HOST:/var/opt/BGw/ServerGroup1/Server1/mediation/out/otherImsi/gmsc/transit/$RUTA/GMCVOLAA_${RUTA}*.* $RUTA
gzip -d $RUTA/G*.* 
ls $RUTA/G* >> $RUTA/List.txt
    for y in $(cat $RUTA/List.txt)
    do
    cp $y $y.csv
    done
rm /opt/GNOC/DATORA/performance/CORE/$RUTA/List.txt
ls $RUTA/G*.csv >> $RUTA/List.txt
    for i in  $(cat $RUTA/List.txt)
    do
    /usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "COPY smp4cn FROM '/opt/GNOC/DATORA/performance/CORE/$i'  WITH DELIMITER ';' CSV HEADER;"
    done
##########################Query`s Section#####################################
#START SMP3
Query31=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute = 'BRMPCBO' or outgoingroute = 'BRMPCAO' and calledpartynumber = '24E8030211B333')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%') "`
 
Query32=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute = 'BRMPCBO' or outgoingroute = 'BRMPCAO' and calledpartynumber = '24E8030211B333')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%')and chargeableduration > 0"`

Query33=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute = 'BRMPCBO' or outgoingroute = 'BRMPCAO' and calledpartynumber = '24E8030211B333')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%')"`


Query34=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute = 'BRMPCBO' or outgoingroute = 'BRMPCAO' and calledpartynumber = '24E8030211B333')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%') " `

Query35=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute = 'BRMPCBO' or outgoingroute = 'BRMPCAO' and calledpartynumber = '24E8030211B333')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%')and chargeableduration > 0"`

Query36=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute = 'BRMPCBO' or outgoingroute = 'BRMPCAO' and calledpartynumber = '24E8030211B333')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%')"` 
R31=`echo $Query31 | awk -F"-------" '{print $2}'| awk '{print $1}'`
for ((cont=`echo $R31 | wc -c`; cont<19; cont++ )) ; 
do
    R31=0$R31
done
R32=`echo $Query32 | awk -F"-------" '{print $2}'| awk '{print $1}'`
for ((cont=`echo $R32 | wc -c`; cont<19; cont++ )) ; 
do
    R32=0$R32
done
R33=`echo $Query33 | awk -F"-------" '{print $2}'| awk '{print $1}'`
for ((cont=`echo $R33 | wc -c`; cont<19; cont++ )) ; 
do
    R33=0$R33
done
R34=`echo $Query34 | awk -F"-------" '{print $2}'| awk '{print $1}'`
for ((cont=`echo $R34 | wc -c`; cont<19; cont++ )) ; 
do
    R34=0$R34
done
R35=`echo $Query35 | awk -F"-------" '{print $2}'| awk '{print $1}'`
for ((cont=`echo $R35 | wc -c`; cont<19; cont++ )) ; 
do
    R35=0$R35
done
R36=`echo $Query36 | awk -F"-------" '{print $2}'| awk '{print $1}'`
for ((cont=`echo $R36 | wc -c`; cont<19; cont++ )) ; 
do
    R36=0$R36
done
#END SMP3



#START SMP4

for x in  $(cat /opt/GNOC/DATORA/performance/CORE/Series.txt)
do

Query41=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$x')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%')"`
R41=`echo $Query41 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re41+=R41


Query42=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$x')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%') and (chargeableduration > 0)"`
R42=`echo $Query42 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re42+=R42



Query43=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$x')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%')"`
R43=`echo $Query43 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re43+=R43



Query46=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$x')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%')"`
R46=`echo $Query46 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re46+=R46


Query47=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$x')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%') and (chargeableduration > 0)"`
R47=`echo $Query47 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re47+=R47


Query48=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$x')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%')"`
R48=`echo $Query48 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re48+=R48




done

Query44=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (calledpartynumber like '%55055%')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%') and (chargeableduration > 0)"`
R44=`echo $Query44 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re44+=R44
for ((cont=`echo $Re44 | wc -c`; cont<19; cont++ )) ;
do
    Re44=0$Re44
done
Query45=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (outgoingroute = 'PVMVO2O')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%') and (chargeableduration = 0)"`
R45=`echo $Query45 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re45+=R45
for ((cont=`echo $Re45 | wc -c`; cont<19; cont++ )) ; 
do
    Re45=0$Re45
done
Query49=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (calledpartynumber like '%55055%')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%') and (chargeableduration > 0)"`
R49=`echo $Query49 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re49+=R49
for ((cont=`echo $Re49 | wc -c`; cont<19; cont++ )) ; 
do
    Re49=0$Re49
done
Query50=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (outgoingroute = 'PVMVO2O')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%') and (chargeableduration = 0)"`
R50=`echo $Query50 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re50+=R50
for ((cont=`echo $Re50 | wc -c`; cont<19; cont++ )) ; 
do
    Re50=0$Re50
done
#END SMP4

#START SMP7

for y in $(cat /opt/GNOC/DATORA/performance/CORE/Series.txt)
do

Query73=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$y')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%') and (chargeableduration > 0)"`
R73=`echo $Query73 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re73+=R73

Query76=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$y')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%') and (chargeableduration > 0)"`
R76=`echo $Query76 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re76+=R76

Query71==`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$y')  and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%') and (chargeableduration > 0)"`
R71=`echo $Query71 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re71+=R71


Query74=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where (outgoingroute != 'SSFDJ1O') and (callingpartynumber like '$y')  and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%') and (chargeableduration > 0)"`
R74=`echo $Query74 | awk -F"-------" '{print $2}'| awk '{print $1}'`
let Re74+=R74

done

Query72=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where  (outgoingroute != 'SSFDJ1O') and (internalcauseandloc ~ '^[0-9 A-Z]{3}3' and (timeforstartofcharge like '10%' or timeforstartofcharge like '11%' or timeforstartofcharge like '12%' or timeforstartofcharge like '13%') and (chargeableduration = 0)"`



Query75=`/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "select COUNT(*) from smp4cn where  (outgoingroute != 'SSFDJ1O') and internalcauseandloc ~ '^[0-9 A-Z]{3}3' and (timeforstartofcharge like '18%' or timeforstartofcharge like '19%' or timeforstartofcharge like '20%' or timeforstartofcharge like '21%') and (chargeableduration = 0)"`




Re75=`echo $Query75 | awk -F"-------" '{print $2}'| awk '{print $1}'`
Re72=`echo $Query72 | awk -F"-------" '{print $2}'| awk '{print $1}'`

#END SMP7
##Convert to zeros
for ((cont=`echo $Re41 | wc -c`; cont<19; cont++ )) ;
do
    Re41=0$Re41
done
for ((cont=`echo $Re42 | wc -c`; cont<19; cont++ )) ;
do
    Re42=0$Re42
done
for ((cont=`echo $Re43 | wc -c`; cont<19; cont++ )) ;
do
    Re43=0$Re43
done
for ((cont=`echo $Re46 | wc -c`; cont<19; cont++ )) ;
do
    Re46=0$Re46
done
for ((cont=`echo $Re47 | wc -c`; cont<19; cont++ )) ;
do
    Re47=0$Re47
done
for ((cont=`echo $Re48 | wc -c`; cont<19; cont++ )) ;
do
    Re48=0$Re48
done
for ((cont=`echo $Re71 | wc -c`; cont<19; cont++ )) ;
do
    Re71=0$Re71
done
for ((cont=`echo $Re72 | wc -c`; cont<19; cont++ )) ;
do
    Re72=0$Re72
done
#for ((cont=`echo $Re73 | wc -c`; cont<19; cont++ )) ;
#do
#    Re73=0$Re73
#done
for ((cont=`echo $Re74 | wc -c`; cont<19; cont++ )) ;
do
    Re74=0$Re74
done
for ((cont=`echo $Re75 | wc -c`; cont<19; cont++ )) ;
do
    Re75=0$Re75
done
#for ((cont=`echo $Re76 | wc -c`; cont<19; cont++ )) ;
#do
#    Re76=0$Re76
#done
############################################ ... ::: PRINT REPORT::: ... ###################################
echo "<SMP3>                                                 "        > $NOMB_FILE;
echo "<Unidade Primaria=\"02203\">                               "        >> $NOMB_FILE;
echo "<Periodo Coleta=\"1\">                                   "        >> $NOMB_FILE;
echo "<Fator Ponderacao=\"016\" valor=\"$R31\"/>   "        >> $NOMB_FILE;
echo "<Conteudo indice=\"014\" valor=\"$R32\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"015\" valor=\"$R33\"/>          "        >> $NOMB_FILE;
echo "</Periodo>                                             "        >> $NOMB_FILE;
echo "<Periodo Coleta=\"2\">                                   "        >> $NOMB_FILE;
echo "<Fator Ponderacao=\"054\" valor=\"$R34\"/>         "        >> $NOMB_FILE;
echo "<Conteudo indice=\"014\" valor=\"$R35\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"015\" valor=\"$R36\"/>          "        >> $NOMB_FILE;
echo "</Periodo>                                             "        >> $NOMB_FILE;
echo "</Unidade>                                             "        >> $NOMB_FILE;
echo "</SMP3>                                                "        >> $NOMB_FILE;
echo "                                                       "        >> $NOMB_FILE;
echo "<SMP4>                                                 "        >> $NOMB_FILE;
echo "<Unidade Primaria=\"02203\">                       "        >> $NOMB_FILE;
echo "<Periodo Coleta=\"1\">                                   "        >> $NOMB_FILE;
echo "<Fator Ponderacao=\"021\" valor=\"$Re41\"/>         "        >> $NOMB_FILE;
echo "<Conteudo indice=\"017\" valor=\"$Re42\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"018\" valor=\"$Re43\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"019\" valor=\"$Re44\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"020\" valor=\"$Re45\"/>          "        >> $NOMB_FILE;
echo "</Periodo>                                             "        >> $NOMB_FILE;
echo "<Periodo Coleta=\"2\">                                   "        >> $NOMB_FILE;
echo "<Fator Ponderacao=\"055\" valor=\"$Re46\"/>         "        >> $NOMB_FILE;
echo "<Conteudo indice=\"017\" valor=\"$Re47\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"018\" valor=\"$Re48\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"019\" valor=\"$Re49\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"020\" valor=\"$Re50\"/>          "        >> $NOMB_FILE;
echo "</Periodo>                                             "        >> $NOMB_FILE;
echo "</Unidade>                                             "        >> $NOMB_FILE;
echo "</SMP4>                                                "        >> $NOMB_FILE;
echo "                                                       "        >> $NOMB_FILE;
echo "<SMP7>                                                 "        >> $NOMB_FILE;
echo "<Unidade Primaria=\"02203\">                           "        >> $NOMB_FILE;
echo "<Periodo Coleta=\"1\">                                   "        >> $NOMB_FILE;
echo "<Fator Ponderacao=\"032\" valor=\"$Re71\"/>         "        >> $NOMB_FILE;
echo "<Conteudo indice=\"030\" valor=\"$Re72\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"031\" valor=\"$Re71\"/>          "        >> $NOMB_FILE;
echo "</Periodo>                                             "        >> $NOMB_FILE;
echo "<Periodo Coleta=\"2\">                                   "        >> $NOMB_FILE;
echo "<Fator Ponderacao=\"057\" valor=\"$Re74\"/>         "        >> $NOMB_FILE;
echo "<Conteudo indice=\"030\" valor=\"$Re75\"/>          "        >> $NOMB_FILE;
echo "<Conteudo indice=\"031\" valor=\"$Re74\"/>          "        >> $NOMB_FILE;
echo "</Periodo>                                             "        >> $NOMB_FILE;
echo "</Unidade>                                             "        >> $NOMB_FILE;
echo "</SMP7>                                                "        >> $NOMB_FILE;

/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c " insert into report_month (r31, r32, r33, r34, r35, r36, r41, r42, r43, r44, r45, r46, r47, r48, r49, r410, r71, r72, r73, r74, r75, r76, dateofevent) VALUES ('$R31', '$R32', '$R33', '$R34', '$R35', '$R36', '$Re41', '$Re42', '$Re43', '$Re44', '$Re45', '$Re46', '$Re47', '$Re48', '$Re49', '$Re50', '$Re71', '$Re72', '$Re73', '$Re74', '$Re75', '$Re76', CURRENT_DATE)"
#rm /opt/GNOC/DATORA/performance/CORE/$RUTA/*
rmdir /opt/GNOC/DATORA/performance/CORE/$RUTA
/usr/lib/bin/psql -h localhost -p 5433 -U datora -d DATORAKPI_EMM -c "delete from smp4cn"
################### Sending file #########################
(echo "XML $RUTA"; echo ""; echo "";   echo "Te envio el xml ";  echo "";) | mail -a /opt/GNOC/DATORA/performance/CORE/$RUTA/*.xml -r "GNOC Mexico DATORA OPS<*****.ericsson.com>"  -s "Prototipo de XML " aldo.barrios@ericsson.com, *****lo@ericsson.com
