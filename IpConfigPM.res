� �� 0M  d    e   x  DhcpIPy  RocnoIp�  Timer�  IpVredu�  	IpNiVredu�  NiDhcp�  NiKarticz   �   �   �   �   �   �   �  Load{  BoxName}  	MacNaslov 
 IzberiKartico�  Mtu�  Hitrost�   �  IP�  IP_2�  IP_3�  IP_4�  Maska�  Maska_2�  Maska_3�  Maska_4�  Prehod�  Prehod_2�  Prehod_3�  Prehod_4�  Save�  Osvezi�   �   �   �   �  Domena�   �  Dns1�  Dns1_2�  Dns1_3�  Dns1_4�   �  Dns2�  Dns2_2�  Dns2_3�  Dns2_4�   �  Dns3�  Dns3_2�  Dns3_3�  Dns3_4�  Izvedi�  Konec�  Route�   �  Okvir�   �   �   ��� 04:  Napaka�/* podprogram za nadzor napake in konec dela */

  Call Load.Hide
  Call Save.Hide
  Call Izvedi.Hide
  Call Route.Hide
  Call IzberiKartico.Disable
  Call NiKartic.Show

IF MreznaKartica > SteviloKartic Then Do
  SteviloKarticPrevisoko = 1
  Call NiKartic.Text('ERROR lan'MreznaKartica-1 '?')
  Call Load.Show
End

IF SteviloKartic = 0 Then Do
  Prikaz = NiKartic.Text()
  Call NiKartic.Text(Prikaz)
End

  Call Beep 250,300
  Call Beep 200,300
  Call Beep 150,300
OdpriKonfiguracijo �DO WHILE LINES(IzbranaDatoteka) > 0
    vrsta = LineIn(IzbranaDatoteka)
    IF LEFT(vrsta,1) = ';' Then Iterate
    Parse Value vrsta With arg1 '=' arg2
    arg2 = Space(arg2)

    Select
      When arg1 = 'interface' Then 
        Do
          MreznaKartica = Right(arg2,1)+1
          IF MreznaKartica > SteviloKartic Then 
            Do
              Call Napaka
              Signal Return
            End
        End
      When arg1 = 'ip' Then 
        NovIpNaslov.MreznaKartica = arg2
      When arg1 = 'mask' Then 
        NovaMaska.MreznaKartica = arg2
      When arg1 = 'gw' Then
        NovPrehod = arg2
      When arg1 = 'mtu' Then
        NovMtu.MreznaKartica = arg2
      When arg1 = 'domain' Then
        NovaDomena = arg2
      When arg1 = 'dns1' Then
        NovDns1 = arg2
      When arg1 = 'dns2' Then
        NovDns2 = arg2
      When arg1 = 'dns3' Then
        NovDns3 = arg2
    End
END

Call LineOut IzbranaDatoteka

IzbranaKartica = MreznaKartica

IF Kartica.MreznaKartica <> Kartica.IzbranaKartica Then 
  Do
    SpremembaIP.IzbranaKartica = 1
    Kartica.IzbranaKartica = Kartica.MreznaKartica  
  End

IF NovIpNaslov.MreznaKartica <> IpNaslov.IzbranaKartica Then 
  Do
    SpremembaIP.IzbranaKartica = 1
    IpNaslov.IzbranaKartica = NovIpNaslov.MreznaKartica
    Call ip.Color     "+", "#255 0 0"
    Call ip_2.Color "+", "#255 0 0"
    Call ip_3.Color "+", "#255 0 0"
    Call ip_4.Color "+", "#255 0 0" 
  End

IF NovaMaska.MreznaKartica <> Maska.IzbranaKartica Then 
  Do
    SpremembaIP.IzbranaKartica = 1
    SpremembaMaske.IzbranaKartica = 1
    Maska.IzbranaKartica = NovaMaska.MreznaKartica
    Call Maska.Color     "+", "#255 0 0"
    Call Maska_2.Color "+", "#255 0 0"
    Call Maska_3.Color "+", "#255 0 0"
    Call Maska_4.Color "+", "#255 0 0"
  End

IF NovPrehod <> Prehod Then 
  Do
    Prehod = NovPrehod
    Sprememba_Prehoda = 1
    Call Prehod.Color "+","#255 0 0"
    Call Prehod_2.Color "+","#255 0 0"
    Call Prehod_3.Color "+","#255 0 0"
    Call Prehod_4.Color "+","#255 0 0"
  End

IF NovMtu.MreznaKartica <> Mtu.IzbranaKartica Then 
  Do
    Mtu.IzbranaKartica = NovMtu.MreznaKartica
    SpremembaMtu.IzbranaKartica = 1
    Sprememba_IP = 1
    Call Mtu.Color "+", "#255 0 0"
  End

IF NovaDomena <> Domena Then 
  Do
    Domena = NovaDomena
    Sprememba_DNS = 1
    Call Domena.Color "+", "#255 0 0"
    Call Domena.Text(Domena)
  End

IF NovDns1 <> Dns1 Then 
  Do
    Dns1 = NovDns1
    Sprememba_DNS = 1
    Call Dns1.Color "+", "#255 0 0"
    Call Dns1_2.Color "+", "#255 0 0"
    Call Dns1_3.Color "+", "#255 0 0"
    Call Dns1_4.Color "+", "#255 0 0"
  End

IF NovDns2 <> Dns2 Then 
  Do
    Dns2 = NovDns2
    Sprememba_DNS = 1
    Call Dns2.Color "+", "#255 0 0"
    Call Dns2_2.Color "+", "#255 0 0"
    Call Dns2_3.Color "+", "#255 0 0"
    Call Dns2_4.Color "+", "#255 0 0"
  End

IF NovDns3 <> Dns3 Then 
  Do
    Dns3 = NovDns3
    Sprememba_DNS = 1
    Call Dns3.Color "+", "#255 0 0"
    Call Dns3_2.Color "+", "#255 0 0"
    Call Dns3_3.Color "+", "#255 0 0"
    Call Dns3_4.Color "+", "#255 0 0"
  End

PrikaziDNS�/* Prikaz DNS stre�nikov */

  Parse Value DNS1 With Ime1 '.' Ime2 '.' Ime3 '.' Ime4
  
  call Dns1.text(Ime1)
  call Dns1_2.text(Ime2)
  call Dns1_3.text(Ime3)
  call Dns1_4.text(Ime4)
  
  If DNS2 \= '' Then
  Do
    Parse Value DNS2 With Ime1 '.' Ime2 '.' Ime3 '.' Ime4
    call Dns2.text(Ime1)
    call Dns2_2.text(Ime2)
    call Dns2_3.text(Ime3)
    call Dns2_4.text(Ime4)
  End
  
  If DNS3 \= '' Then
  Do
    Parse Value DNS3 With Ime1 '.' Ime2 '.' Ime3 '.' Ime4
    call Dns3.text(Ime1)
    call Dns3_2.text(Ime2)
    call Dns3_3.text(Ime3)
    call Dns3_4.text(Ime4)
  End
NajdiPrehod�NajdiPrehod:
      /*  zapi�em rutanje v route.txt'*/
      /* pogledam kateri je trenutno privzet prehod */
      
        'netstat -r > route.txt'
      
        prehod = ''
          Do WHILE lines(route.txt)
            line = LineIn(route.txt)
              DO
                PARSE VAR line net gw garbage
                IF net='default' THEN
                  prehod = gw
              END
          END
      
        Call LineOut('route.txt')
        Call SysFileDelete('route.txt')
PrikaziNovIp�Call IpNiVredu.Show

  DO Stevec = 1 To 8
    Call Sleep 5000
    Call Timer.text(Stevec * 5)
    Call OsveziPrikaz
    IF IpNaslov.IzbranaKartica=0.0.0.0 | Left(IpNaslov.IzbranaKartica,3)=169 THEN Iterate
    ELSE Leave
  END

  IF Stevec = 9 THEN
    DO
      Call IpNiVredu.Hide
      Call NiDhcp.Show
    END
  ELSE
    DO
      Call IpNiVredu.Hide
      Call IpVredu.Show
    END OsveziPrikazQCall PregledKartic
Call PrikaziKartico
Call NajdiPrehod
Call PrikaziPrehod

PrikaziPrehod�Parse Value Prehod With gw1 '.' gw2 '.' gw3 '.' gw4

  Call Prehod.text(gw1)
  Call Prehod_2.text(gw2)
  Call Prehod_3.text(gw3)
  Call Prehod_4.text(gw4)
  
IpRocno�/* ugasnem DHCP gumb in pri�gem ro�no */

Call DhcpIp.Select 0
Call RocnoIp.Select 1
Call Load.Enable
Call Save.Enable

/* omogo�im vnos v polja */
Call IP.Enable
Call IP_2.Enable
Call IP_3.Enable
Call IP_4.Enable

Call Maska.Enable
Call Maska_2.Enable
Call Maska_3.Enable
Call Maska_4.Enable

Call Prehod.Enable
Call Prehod_2.Enable
Call Prehod_3.Enable
Call Prehod_4.Enable

Call Mtu.EnableUporabiDHCP�/* */
Call DhcpIp.Select 1
Call RocnoIp.Select 0
Call Load.Disable
Call Save.Disable

Call IP.Disable
Call IP_2.Disable
Call IP_3.Disable
Call IP_4.Disable

Call Maska.Disable
Call Maska_2.Disable
Call Maska_3.Disable
Call Maska_4.Disable

Call Prehod.Disable
Call Prehod_2.Disable
Call Prehod_3.Disable
Call Prehod_4.Disable

Call Mtu.DisableNajdiKartice�'netstat -nr > mac.txt'

SteviloKartic= 0
Prehod = ''
Vrsta = 0
NovaVrsta = 0
KonecMac = 0

Do WHILE lines(mac.txt)
  line = LineIn(mac.txt)
  IF line = '' & Vrsta = 0 THEN Iterate
  Vrsta = Vrsta +1
    PARSE upper VAR line Kartica Stevilka garbage
      IF Vrsta = 3 & NovaVrsta = 0 Then 
        DO
          NovaVrsta = 1
/*          PARSE Var line 'faut' Stevilka garbage*/
          Prehod = Stevilka
         END

    IF Kartica \= 'INTERFACE' & KonecMac = 0 THEN ITERATE
    IF Kartica='INTERFACE' THEN
      DO
        Vrsta = 1
        KonecMac = 1
        SteviloKartic= SteviloKartic + 1
        Kartica.SteviloKartic= 'lan'Stevilka
        IF Stevilka = 9 Then Kartica.SteviloKartic= 'lo'
      END
        IF Vrsta = 2 THEN
          DO
            Parse VAR line a b mac c mtu 
            Mac.SteviloKartic = Substr(mac,1,2)||':'||Substr(mac,3,2)||':'||,
                         Substr(mac,5,2)||':'||Substr(mac,7,2)||':'||,
                         Substr(mac,9,2)||':'||Substr(mac,11,2)
            mtu.SteviloKartic = mtu
          END
        IF Vrsta = 4 & NovaVrsta > 0 THEN Hitrost.SteviloKartic = Stevilka/1000000
  IF Vrsta = 16 Then Vrsta = 0
END

  Call LineOut('mac.txt')
  Call SysFileDelete('mac.txt')

/* pogledam katero kartico konfigurira DHCP */

  fname = SysBootDrive()'\mptn\bin\setup.cmd'
  fchars=CharIn(fname, 1, Chars(fname))
  Parse VAR fchars '-i ' DhcpLan
  DhcpLan = LEFT(DhcpLan,4)
  Call LineOut(SysBootDrive()'\mptn\bin\setup.cmd')

PreveriVnos�  Rc = Verify(vnos,'0123456789','N')
  If vnos > 255 Then Rc = 1
  If Rc \= 0 Then 
    Do
      Call Beep 200,300  
      Return
    End

  IF Vnos \= '' THEN
  DO
    temp = d2c(vnos)
    Vnos = c2d(temp)
  END
PrikaziKartico�  Parse Value IpNaslov.IzbranaKartica With ip1 '.' ip2 '.' ip3 '.' ip4
  Call Hitrost.Text(Hitrost.IzbranaKartica)
  
  Call IP.text(Ip1)
  Call IP_2.text(Ip2)
  Call IP_3.text(Ip3)
  Call IP_4.text(Ip4)
    
  Parse Value Maska.IzbranaKartica With mask1 '.' mask2 '.' mask3 '.' mask4
  
  Call Maska.text(Mask1)
  Call Maska_2.text(Mask2)
  Call Maska_3.text(Mask3)
  Call Maska_4.text(Mask4)

  Call Mtu.text(Mtu.IzbranaKartica)
LoadLang�/* tukaj poi�em datotek z jeziki in jih nalo�im
   glede na spremenljivko LANG */

CALL SysFileTree workdir||'\*.LNG', 'lnglst', 'FO'

  IF lnglst.0 > 0 THEN 
  DO
    DO i = 1 TO lnglst.0
      lngfile = SUBSTR(lnglst.i,LASTPOS('\',lnglst.i)+1)
      lngfile = workdir||'\'||lngfile
      IF POS(jezik,lngfile) > 0 then
        DO
          dummy=STREAM(lngfile,'c','open read')
          DO WHILE LINES(lngfile) > 0
            PARSE VALUE LINEIN(lngFile) WITH lngid lngtxt
            INTERPRET 'CALL C'||lngid||'.Text lngtxt'
          END
            dummy = STREAM(lngFile,'C','CLOSE')
          LEAVE
        END
    END
  END
Display�    /* Begin display sub */
  mask = SUBSTR(mask, 3, 8)
  DecMask = x2D(Substr(mask, 1, 2))||.||x2D(Substr(mask, 3, 2))||.||,
                x2D(Substr(mask, 5, 2))||.||x2D(Substr(mask, 7, 2))
Izvedi�/* Pri spremembi IP naslovov izvedem ifconfig */

Call IpVredu.Hide
Call NiDhcp.Hide
Call IpNiVredu.Show

IF C120.Select() = 1 THEN
  DO
    IF Kartica.IzbranaKartica=DhcpLan THEN 
      DO
/* ustavim DhcpMon in prika�em IP 0.0.0.0 */
        'DhcpMon -t' 
        Call IP.text('0')
        Call IP_2.text('0')
        Call IP_3.text('0')
        Call IP_4.text('0')
/* Startam Dhcp client */
        'DhcpStrt -d 0 -i' Kartica.IzbranaKartica
        Call PrikaziNovIp
        Call NajdiDNS
        Call PrikaziDNS
        Call Beep 500,50; Call Beep 750,60; Call Beep 1000,70
      END
  ELSE
     'dhcpstrt -d 10 -i' Kartica.IzbranaKartica
END

/*say Kartica.IzbranaKartica
say IpNaslov.IzbranaKartica
say Maska.IzbranaKartica
say Mtu.IzbranaKartica */

signal Konec

IF Sprememba_IP = 1 Then
  DO
    ifconfig Kartica.IzbranaKartica down
    ifconfig Kartica.IzbranaKartica delete
    IfConfig Kartica.IzbranaKartica IpNaslov.IzbranaKartica 'netmask' Maska.IzbranaKartica 'MTU ' Mtu.IzbranaKartica up
  
    SpremembaIP.IzbranaKartica = 0
    SpremembaMaske.IzbranaKartica = 0
    SpremembaMtu.IzbranaKartica = 0
    Sprememba_IP = 0
  
    Call ip.Color "+", "#0 0 0"
    Call ip_2.Color "+", "#0 0 0"
    Call ip_3.Color "+", "#0 0 0"
    Call ip_4.Color "+", "#0 0 0"
  
    Call Maska.Color "+","#0 0 0"
    Call Maska_2.Color "+","#0 0 0"
    Call Maska_3.Color "+","#0 0 0"
    Call Maska_4.Color "+","#0 0 0"
  
    Call Mtu.Color "+","#0 0 0"

    Call IpNiVredu.Hide
    Call IpVredu.Show
    Call Beep 500,50; Call Beep 750,60; Call Beep 1000,70
  END

IF Sprememba_Prehoda = 1 Then
  DO
    'route -fh'
    'arp -f'
    Route add default Prehod
    Call Prehod.Color "+", "#0 0 0"
    Call Prehod_2.Color "+", "#0 0 0"
    Call Prehod_3.Color "+", "#0 0 0"
    Call Prehod_4.Color "+", "#0 0 0"
    Sprememba_Prehoda = 0
    Call IpNiVredu.Hide
    Call IpVredu.Show
  END
    
    /* Tu zapi�em novo datoteko RESOLV2 */
    
  If Sprememba_DNS = 1 Then
    Do
  /* napravim Resolv2.bak datoteko */
      '@Copy'  SysBootDrive()'\mptn\etc\Resolv2' SysBootDrive()'\mptn\etc\Resolv2.bak'
  
  /* Pobri�em datotkeo Resolv2 */
      Call SysFileDelete SysBootDrive()'\mptn\etc\resolv2'

  /* Zapi�em novo Resolv2 datpteko */
      Call LineOut SysBootDrive()'\mptn\etc\Resolv2', 'domain' Domena.Text(),1
  
    Call Domena.Color "+","#0 0 0"

    Call Dns1.Color "+", "#0 0 0"
    Call Dns1_2.Color "+", "#0 0 0"
    Call Dns1_3.Color "+", "#0 0 0"
    Call Dns1_4.Color "+", "#0 0 0"

    Call Dns2.Color "+", "#0 0 0"
    Call Dns2_2.Color "+", "#0 0 0"
    Call Dns2_3.Color "+", "#0 0 0"
    Call Dns2_4.Color "+", "#0 0 0"

    Call Dns3.Color "+", "#0 0 0"
    Call Dns3_2.Color "+", "#0 0 0"
    Call Dns3_3.Color "+", "#0 0 0"
    Call Dns3_4.Color "+", "#0 0 0"

    If Dns1 \= " " Then
      Do
        Dns1 = Strip(dns1)
        Call LineOut SysBootDrive()'\mptn\etc\resolv2', 'nameserver' Dns1
      End
    
    If Dns2 \= " " Then
      Do
        Dns2 = Strip(Dns2)
        Call LineOut SysBootDrive()'\mptn\etc\resolv2', 'nameserver' Dns2
      End
    
    If Dns3 \=  ' ' Then
      Do
        Dns3 = Strip(Dns3)
        Call LineOut SysBootDrive()'\mptn\etc\resolv2', 'nameserver' Dns3
      End
    
      Call LineOut SysBootDrive()'\mptn\etc\resolv2'
      Sprememba_DNS = 0
      Call Beep 1000,70; Call Beep 750,60; Call Beep 500,50
    End

Call Save.Enable

Konec:PregledKartic�    /*  zapi�em nastavitve kartic v lan.txt' */
    /* berem datoteko lan.txt in izlu�im IP naslove mre�nih kartic  */
     
  Do i = 1 to SteviloKartic
  IF Kartica.i = 'lan10' THEN
    DO 
      IpNaslov.i = 0.0.0.0
      Maska.i = 0.0.0.0
      Leave
    END
    'ifconfig 'Kartica.i' > lan.txt'
    fname='lan.txt'
    fchars=CharIn(fname, 1, Chars(fname))
    Parse VAR fchars 'inet ' ip '  netmask ' mask ' broadcast'
/*    Parse VAR fchars . . ip . mask */
    Call Display mask
    IpNaslov.i = ip
    Maska.i = DecMask
    Call LineOut('lan.txt') 
  End
    
  Call LineOut('lan.txt')
  Call SysFileDelete('lan.txt')
NajdiDNS�    /* Preberem naslov domene in naslove DNS stre�nikov */
    i = 0
    Dns1 = ' '
    Dns2 = ' '
    Dns3 = ' '
     
      Do WHILE lines(SysBootDrive()'\mptn\etc\resolv2')
        line = LineIn(SysBootDrive()'\mptn\etc\resolv2')
        If line = '' Then Leave
        If i > 4 Then Leave
        Parse VAR line a b
        IF a = 'domain' THEN Domena = b
        IF a = 'nameserver' THEN
          DO
            i = i + 1
            Select
              When i = 1 Then Dns1 = b
              When i = 2 Then Dns2 = b
              When i = 3 Then Dns3 = b
            End
          END
      END
      Call LineOut SysBootDrive()'\mptn\etc\resolv2'
Init�/*  */
  '@echo off'
    
  CALL RxFuncAdd "SysLoadFuncs", "RexxUtil", "SysLoadFuncs"
  Call SysLoadFuncs
  Call SysCls
    
  /* Direktorij v katerem je program pognan */
  PARSE SOURCE . . workfull .
  workdir = SUBSTR(workfull,1,LASTPOS('\',workfull)-1)
  env = 'OS2ENVIRONMENT'    
  Jezik = LEFT(VALUE('lang',,env),2)
  HostID = VALUE('hostname',,env)
  
  Call NajdiKartice

  Call NajdiDns
  Call PregledKartic
  Sprememba_IP = 0
  Sprememba_DNS = 0
  Sprememba_Prehoda = 0
�� �d 0o  o  �  ��    @      �� �� w y � d ���        �� � t  e ���        [ � � P  x d��        � � | P  y ���         ��X  
 	 � ���    
 
	 	   �h }   � 	��    
 y	 �	   �h }   � �	��    
 �	 �	   �h }   � �	��        W
E  i p  � r
��       
 �
 � q <  z �
��        �
 � i <  � �
��       
 ? � a <  � J��        � � Y <  � ���        � � Q <  � ���        # � I <  � 4��        t � A <  � y��        �  � 8    � ���         � �B q 0  { ���        - �B i 0  } ?��         s �B Q    t��         � �C B   � ��         � �V a   � ���         �f a   � ��         S �C Z 
  � T�         � �O Z 
  � ��         � �[ Z 
  � �         
 �g Z 
  � ?         G �C R 
  � H|         � �O R 
  � ��         � �[ R 
  � ��         � �g R 
  � �3         ; �C J 
  � <p         x �O J 
  � y�         � �[ J 
  � ��         � �g J 
  � �'        /  �, 8    � 4��        t  �P 8    � |��         �   @ X 4 	 � ���         �   @ Q 4 	 � ���         [   @ I 4  � \��        �� - <  � ���         * �C . .  � +��        _ � % <  � f��         � �C & 
  � ��         � �O & 
  � �           �[ & 
  � !U         ] �g & 
  � ^�        ��  <  � ���         � �C  
  � �          �O  
  � S         [ �[  
  � \�         � �g  
  � ��        ��  <  � ���          �C  
  � Q         Y �O  
  � Z�         � �[  
  � ��         � �g  
  � �          � 	    � ��        h  �, 	    � m��        �  �T 	    � ���         �  p  � 3��         �  � 6 t H � ���         �   @ % 4  � ���         k   @  4  � l��         �   @  4  � ���IP ConfigPM 1.4    Configure Network Interfaces z               f   12.Times New Roman                                                                                    Use DHCP 0      (   9.WarpSans                              Set IP manually 0      (   9.WarpSans                               )      !   9.WarpSans                       ICONBUTTON ikone:#2 W      O   9.WarpSans                                                                     ICONBUTTON ikone:#1 W      O   9.WarpSans                                                                     ICONBUTTON Ikone:#3 W      O   9.WarpSans                                                                     No interfaces to configure 1                  12.Times New Roman Bold      Host Name  <               (   9.WarpSans                              MAC Address  <               (   9.WarpSans                              Interface  <               (   9.WarpSans                              IP address  <               (   9.WarpSans                              Subnet Mask  <               (   9.WarpSans                              Default Gateway  <               (   9.WarpSans                              MTU  <               (   9.WarpSans                              Open 9                           9.WarpSans                -      %   9.WarpSans                           00:00:00:00:00:00 0      (   9.WarpSans                               0      (   9.WarpSans                               0      (   9.WarpSans                                     0      (   9.WarpSans                              Mb/s 0      (   9.WarpSans                               0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                    Save <               (   9.WarpSans                              Refresh -                           9.WarpSans    '         9.WarpSans                      }      u   9.WarpSans                                                                                                            }      u   9.WarpSans                                                                                                           Domain Name  <               (   9.WarpSans                               0      (   9.WarpSans                              DNS 1  <               (   9.WarpSans                               0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                    DNS 2  <               (   9.WarpSans                               0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                    DNS 3  <               (   9.WarpSans                               0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                     0      (   9.WarpSans                                    Apply N               :   9.WarpSans                                                Exit N               :   9.WarpSans                                                Route N               :   9.WarpSans                                                Copyright (c) Dusan Golubic }      u   9.WarpSans                                                                                                            0      (   9.WarpSans                               }      u   9.WarpSans                                                                                                            }      u   9.WarpSans                                                                                                            }      u   9.WarpSans                                                                                                           ���d 0�>  �d Init�/* Center a window on the screen: */
PARSE VALUE Position() WITH x y cx cy
PARSE VALUE ScreenSize() WITH dx dy
CALL Position (dx - cx)%2, (dy - cy)%2, 310, 435
Call Color "-", "#190 220 255"
Call LoadLang  

  If SteviloKartic = 0 Then Do
    Call Napaka
    Signal return
  End

  Call BoxName.text(HostID)

  DO i = 1 To SteviloKartic
    Call IzberiKartico.add(Kartica.i)
  End
  Call IzberiKartico.Select(1)
    
  Call PrikaziKartico
  Call PrikaziPrehod
  Call Domena.text(Domena)
  Call PrikaziDNS
�� InitCall Position 165, 62, 170, 28�� InitCall Position 235, 84, 130, 22�� InitCall Position 235, 106, 170, 22�� InitCall Position 10, 152, 290, 198�� InitCall Position 15, 6, 280, 14�� InitCall Position 215, 30, 80, 22Clicke'netstat -r > route.txt'
'e route.txt'
Call LineOut('route.txt')
Call SysFileDelete('route.txt')
�� InitCall Position 115, 30, 80, 22Clickexit�� InitCall Position 15, 30, 80, 22ClickCall Izvedi�� InitCall Position 260, 62, 30, 22	LoseFocus� Vnos = Dns3_4.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns3_4.Focus
  Call Dns3_4.text(Vnos)
  
    Nov_Dns3 = Dns3.Text()'.'Dns3_2.Text()'.'Dns3_3.Text()'.'Dns3_4.Text()
    If Nov_Dns3 \= Dns3 Then
      Do
        Dns3 = Nov_Dns3
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns3 = '' Then Dns3 = ' '
      End
�� InitCall Position 230, 62, 30, 22	LoseFocus� Vnos = Dns3_3.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns3_3.Focus
  Call Dns3_3.text(Vnos)
  
    Nov_Dns3 = Dns3.Text()'.'Dns3_2.Text()'.'Dns3_3.Text()'.'Dns3_4.Text()
    If Nov_Dns3 \= Dns3 Then
      Do
        Dns3 = Nov_Dns3
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns3 = '' Then Dns3 = ' '
      End
�� InitCall Position 200, 62, 30, 22	LoseFocus� Vnos = Dns3_2.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns3_2.Focus
  Call Dns3_2.text(Vnos)
  
    Nov_Dns3 = Dns3.Text()'.'Dns3_2.Text()'.'Dns3_3.Text()'.'Dns3_4.Text()
    If Nov_Dns3 \= Dns3 Then
      Do
        Dns3 = Nov_Dns3
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns3 = '' Then Dns3 = ' '
      End
�� InitCall Position 170, 62, 30, 22	LoseFocus�  Vnos = Dns3.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns3.Focus
  Call Dns3.text(Vnos)
  
    Nov_Dns3 = Dns3.Text()'.'Dns3_2.Text()'.'Dns3_3.Text()'.'Dns3_4.Text()
    If Nov_Dns3 \= Dns3 Then
      Do
        Dns3 = Nov_Dns3
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns3 = '' Then Dns3 = ' '
      End
�� InitCall Position 15, 62, 150, 20�� InitCall Position 260, 84, 30, 22	LoseFocus�  Vnos = Dns2_4.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns2_4.Focus
  Call Dns2_4.text(Vnos)
  
    Nov_Dns2 = Dns2.Text()'.'Dns2_2.Text()'.'Dns2_3.Text()'.'Dns2_4.Text()
    If Nov_Dns2 \= Dns2 Then
      Do
        Dns2 = Nov_Dns2
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns2 = '' Then Dns2 = ' '
      End
�� InitCall Position 230, 84, 30, 22	LoseFocus�  Vnos = Dns2_3.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns2_3.Focus
  Call Dns2_3.text(Vnos)
  
    Nov_Dns2 = Dns2.Text()'.'Dns2_2.Text()'.'Dns2_3.Text()'.'Dns2_4.Text()
    If Nov_Dns2 \= Dns2 Then
      Do
        Dns2 = Nov_Dns2
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns2 = '' Then Dns2 = ' '
      End
�� InitCall Position 200, 84, 30, 22	LoseFocus�  Vnos = Dns2_2.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns2_2.Focus
  Call Dns2_2.text(Vnos)
  
    Nov_Dns2 = Dns2.Text()'.'Dns2_2.Text()'.'Dns2_3.Text()'.'Dns2_4.Text()
    If Nov_Dns2 \= Dns2 Then
      Do
        Dns2 = Nov_Dns2
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns2 = '' Then Dns2 = ' '
      End
�� InitCall Position 170, 84, 30, 22	LoseFocus�  Vnos = Dns2.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns2.Focus
  Call Dns2.text(Vnos)
  
    Nov_Dns2 = Dns2.Text()'.'Dns2_2.Text()'.'Dns2_3.Text()'.'Dns2_4.Text()
    If Nov_Dns2 \= Dns2 Then
      Do
        Dns2 = Nov_Dns2
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns2 = '' Then Dns2 = ' '
      End
�� InitCall Position 15, 84, 150, 22�� InitCall Position 260, 106, 30, 22	LoseFocus�  Vnos = Dns1_4.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns1_4.Focus
  Call Dns1_4.text(Vnos)
  
    Nov_Dns1 = Dns1.Text()'.'Dns1_2.Text()'.'Dns1_3.Text()'.'Dns1_4.Text()
    If Nov_Dns1 \= Dns1 Then
      Do
        Dns1 = Nov_Dns1
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns1 = '' Then Dns1 = ' '
      End
�� InitCall Position 230, 106, 30, 22	LoseFocus�  Vnos = Dns1_3.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns1_3.Focus
  Call Dns1_3.text(Vnos)
  
    Nov_Dns1 = Dns1.Text()'.'Dns1_2.Text()'.'Dns1_3.Text()'.'Dns1_4.Text()
    If Nov_Dns1 \= Dns1 Then
      Do
        Dns1 = Nov_Dns1
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns1 = '' Then Dns1 = ' '
      End
�� InitCall Position 200, 106, 30, 22	LoseFocus�  Vnos = Dns1_2.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns1_2.Focus
  Call Dns1_2.text(Vnos)
  
    Nov_Dns1 = Dns1.Text()'.'Dns1_2.Text()'.'Dns1_3.Text()'.'Dns1_4.Text()
    If Nov_Dns1 \= Dns1 Then
      Do
        Dns1 = Nov_Dns1
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns1 = '' Then Dns1 = ' '
      End
�� InitCall Position 170, 106, 30, 22	LoseFocus�  Vnos = Dns1.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Dns1.Focus
  Call Dns1.text(Vnos)
  
    Nov_Dns1 = Dns1.Text()'.'Dns1_2.Text()'.'Dns1_3.Text()'.'Dns1_4.Text()
    If Nov_Dns1 \= Dns1 Then
      Do
        Dns1 = Nov_Dns1
        Call Color "+", "#255 0 0"
        Sprememba_DNS = 1
        If Dns1 = '' Then Dns1 = ' '
      End
�� InitCall Position 15, 106, 150, 22�� InitCall Position 170, 128, 120, 22	LoseFocus�    Nova_Domena = Domena.Text()
    If Nova_Domena \= Domena Then
      Do
        Domena = Nova_Domena
        Call Domena.Color "+", "#255 0 0"
        Sprememba_DNS = 1
      End
�� InitCall Position 15, 128, 150, 22�� InitCall Position 165, 205, 130, 22�� InitCall Position 165, 270, 130, 25�� InitCall Position 165, 249, 130, 22�� InitCall Position 204, 158, 80, 22ClickCall OsveziPrikaz�� InitCall Position 114, 158, 80, 22Click�ShraniDatoteko=FilePrompt("*.cfg", "Save config file as", ,"S")

IF ShraniDatoteko = '' Then Signal NeShrani

Call LineOut  ShraniDatoteko, '; this is comment', 1
Call LineOut  ShraniDatoteko, 'interface =' Kartica.IzbranaKartica
Call LineOut  ShraniDatoteko, 'ip =' IpNaslov.IzbranaKartica
Call LineOut  ShraniDatoteko, 'mask =' Maska.IzbranaKartica
Call LineOut  ShraniDatoteko, 'gw =' Prehod
Call LineOut  ShraniDatoteko, 'mtu =' Mtu.IzbranaKartica
Call LineOut  ShraniDatoteko, 'domain =' Domena
Call LineOut  ShraniDatoteko, 'dns1 =' Dns1
Call LineOut  ShraniDatoteko, 'dns2 =' Dns2
Call LineOut  ShraniDatoteko, 'dns3 =' Dns3
Call LineOut  ShraniDatoteko

NeShrani:�� InitCall Position 260, 205, 30, 22	LoseFocus�  Vnos = Prehod_4.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Prehod_4.Focus
  Call Prehod_4.text(Vnos)
  
    Nov_Prehod = Prehod.Text()'.'Prehod_2.Text()'.'Prehod_3.Text()'.'Prehod_4.Text()
  
    If Nov_Prehod \= Prehod Then
      Do
        Prehod = Nov_Prehod
        Call Color "+", "#255 0 0"
       Sprememba_Prehoda = 1
      End
�� InitCall Position 230, 205, 30, 22	LoseFocus�  Vnos = Prehod_3.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Prehod_3.Focus
  Call Prehod_3.text(Vnos)
  
    Nov_Prehod = Prehod.Text()'.'Prehod_2.Text()'.'Prehod_3.Text()'.'Prehod_4.Text()
  
    If Nov_Prehod \= Prehod Then
      Do
        Prehod = Nov_Prehod
        Call Color "+", "#255 0 0"
        Sprememba_Prehoda = 1
      End
�� InitCall Position 200, 205, 30, 22	LoseFocus�  Vnos = Prehod_2.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Prehod_2.Focus
  Call Prehod_2.text(Vnos)
  
    Nov_Prehod = Prehod.Text()'.'Prehod_2.Text()'.'Prehod_3.Text()'.'Prehod_4.Text()
  
    If Nov_Prehod \= Prehod Then
      Do
        Prehod = Nov_Prehod
        Call Color "+", "#255 0 0"
        Sprememba_Prehoda = 1
      End
�� InitCall Position 170, 205, 30, 22	LoseFocus�  Vnos = Prehod.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Prehod.Focus
  Call Prehod.text(Vnos) 
  
    Nov_Prehod = Prehod.Text()'.'Prehod_2.Text()'.'Prehod_3.Text()'.'Prehod_4.Text()
  
    If Nov_Prehod \= Prehod Then
      Do
        Prehod = Nov_Prehod
        Call Color "+", "#255 0 0"
        Sprememba_Prehoda = 1
      End
�� InitCall Position 260, 227, 30, 22	LoseFocus�  Vnos = Maska_4.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Maska_4.Focus
  Call Maska_4.text(Vnos) 
  
    Nova_Maska = Maska.Text()'.'Maska_2.Text()'.'Maska_3.Text()'.'Maska_4.Text()
  
    If Nova_Maska \= Maska.IzbranaKartica Then
      Do
        Maska.IzbranaKartica = Nova_Maska
        Call Color "+", "#255 0 0"
        SpremembaMaske.IzbranaKartica = 1
        Sprememba_IP = 1
      End
�� InitCall Position 230, 227, 30, 22	LoseFocus�  Vnos = Maska_3.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Maska_3.Focus
  Call Maska_3.text(Vnos) 
  
    Nova_Maska = Maska.Text()'.'Maska_2.Text()'.'Maska_3.Text()'.'Maska_4.Text()
  
    If Nova_Maska \= Maska.IzbranaKartica Then
      Do
        Maska.IzbranaKartica = Nova_Maska
        Call Color "+", "#255 0 0"
        SpremembaMaske.IzbranaKartica = 1
        Sprememba_IP = 1
      End
�� InitCall Position 200, 227, 30, 22	LoseFocus�  Vnos = Maska_2.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Maska_2.Focus
  Call Maska_2.text(Vnos) 
  
    Nova_Maska = Maska.Text()'.'Maska_2.Text()'.'Maska_3.Text()'.'Maska_4.Text()
  
    If Nova_Maska \= Maska.IzbranaKartica Then
      Do
        Maska.IzbranaKartica = Nova_Maska
        Call Color "+", "#255 0 0"
        SpremembaMaske.IzbranaKartica = 1
        Sprememba_IP = 1
      End
�� InitCall Position 170, 227, 30, 22	LoseFocus�  Vnos = Maska.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call Maska.Focus
  Call Maska.text(Vnos) 

    Nova_Maska = Maska.Text()'.'Maska_2.Text()'.'Maska_3.Text()'.'Maska_4.Text()
  
    If Nova_Maska \= Maska.IzbranaKartica Then
      Do
        Maska.IzbranaKartica = Nova_Maska
        Call Color "+", "#255 0 0"
        SpremembaMaske.IzbranaKartica = 1
        Sprememba_IP = 1
      End
�� InitCall Position 260, 249, 30, 22	LoseFocus�  Vnos = ip_4.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call ip_4.Focus
  Call ip_4.text(Vnos)

  Nov_IP = ip.text()'.'ip_2.text()'.'ip_3.text()'.'ip_4.text()
  
  If Nov_IP \= IpNaslov.IzbranaKartica Then
    Do
      IpNaslov.IzbranaKartica = Nov_IP
      Call Color "+", "#255 0 0"
      SpremembaIP.IzbranaKartica = 1
      Sprememba_IP = 1
    End
�� InitCall Position 230, 249, 30, 22	LoseFocus�  Vnos = ip_3.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call ip_3.Focus
  Call ip_3.text(Vnos) 

  Nov_IP = ip.text()'.'ip_2.text()'.'ip_3.text()'.'ip_4.text()
  
  If Nov_IP \= IpNaslov.IzbranaKartica Then
    Do
      IpNaslov.IzbranaKartica = Nov_IP
      Call Color "+", "#255 0 0"
      SpremembaIP.IzbranaKartica = 1
      Sprememba_IP = 1
    End
�� InitCall Position 200, 249, 30, 22	LoseFocus�  Vnos = ip_2.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call ip_2.Focus
  Call ip_2.text(Vnos)

  Nov_IP = ip.text()'.'ip_2.text()'.'ip_3.text()'.'ip_4.text()
  
  If Nov_IP \= IpNaslov.IzbranaKartica Then
    Do
      IpNaslov.IzbranaKartica = Nov_IP
      Call Color "+", "#255 0 0"
      SpremembaIP.IzbranaKartica = 1
      Sprememba_IP = 1
    End
�� InitCall Position 170, 249, 30, 22	LoseFocus�Vnos = ip.text()
  Call PreveriVnos Vnos Rc
  If Rc \= 0 Then Call ip.Focus
  Call ip.text(Vnos) 
 
  Nov_IP = ip.text()'.'ip_2.text()'.'ip_3.text()'.'ip_4.text()
  
  If Nov_IP \= IpNaslov.IzbranaKartica Then
    Do
      IpNaslov.IzbranaKartica = Nov_IP
      Call Color "+", "#255 0 0"
      SpremembaIP.IzbranaKartica = 1
      Sprememba_IP = 1
    End
�� InitCall Position 260, 271, 35, 22�� InitCall Position 220, 271, 35, 22�� InitCall Position 170, 183, 40, 22	LoseFocus�  Rc = Verify(Mtu.text(),'0123456789','n')
  If Rc \= 0 Then 
    Do
      Call Beep 200,300
      Call Mtu.Focus
    End
  
  Nov_Mtu = Mtu.text()
  
  If Nov_Mtu \= Mtu.IzbranaKartica Then
    Do
      Mtu.IzbranaKartica = Nov_Mtu
      Call Color "+", "#255 0 0"
      SpremembaMtu.IzbranaKartica = 1
      Sprememba_IP = 1
    End
� InitCall Position 170, 227, 50, 66Select�    IzbranaKartica = IzberiKartico.Select()

/* pri�igam DHCP gumb ali gumb za ro�no nastavitev */
IF Kartica.IzbranaKartica=DhcpLan THEN 
    Call UporabiDHCP
  ELSE 
    Call IpRocno

/* izberem kartico */
      Call MacNaslov.Text(Mac.IzbranaKartica)
        If SpremembaIP.IzbranaKartica = 1 Then
          Do
            Call Ip.Color "+", "#255 0 0"
            Call Ip_2.Color "+", "#255 0 0"
            Call Ip_3.Color "+", "#255 0 0"
            Call Ip_4.Color "+", "#255 0 0"
            Call PrikaziKartico
          End
          Else
          Do
            Call Ip.Color "+", "#0 0 0"
            Call Ip_2.Color "+", "#0 0 0"
            Call Ip_3.Color "+", "#0 0 0"
            Call Ip_4.Color "+", "#0 0 0"
            Call PrikaziKartico
          End
    
      If SpremembaMaske.IzbranaKartica = 1 Then
        Do
          Call Maska.Color "+", "#255 0 0"
          Call Maska_2.Color "+", "#255 0 0"
          Call Maska_3.Color "+", "#255 0 0"
          Call Maska_4.Color "+", "#255 0 0"
          Call PrikaziKartico
        End
        Else
        Do
          Call Maska.Color "+", "#0 0 0"
          Call Maska_2.Color "+", "#0 0 0"
          Call Maska_3.Color "+", "#0 0 0"
          Call Maska_4.Color "+", "#0 0 0"
          Call PrikaziKartico
        End
  
      If SpremembaMtu.IzbranaKartica = 1 Then
        Do
          Call Mtu.Color "+", "#255 0 0"
          Call PrikaziKartico
        End
        Else
        Do
          Call Mtu.Color "+", "#0 0 0"
          Call PrikaziKartico
        End
�} InitCall Position 170, 293, 120, 22�{ InitCall Position 170, 315, 120, 22�� InitCall Position 23, 158, 80, 22Click�If SteviloKarticPrevisoko = 1 Then
  Do
say sem tukaj
      Call NiKartic.Hide
      Call Save.Show
      Call Izvedi.Show
      Call Route.Show
      Call IzberiKartico.Enable
  End

IzbranaDatoteka=FilePrompt("*.cfg", "Load config file", ok, "O")

IF IzbranaDatoteka = '' Then Signal PrekiniOdpiranje
IF stevilokartic = 0 Then signal PrekiniOdpiranje
Call OdpriKonfiguracijo

Call IzberiKartico.Select(MreznaKartica)
Call PrikaziKartico
Call PrikaziPrehod
Call PrikaziDNS

PrekiniOdpiranje:
�� InitCall Position 15, 183, 150, 22�� InitCall Position 15, 205, 150, 22�� InitCall Position 15, 227, 150, 22�� InitCall Position 15, 249, 150, 22�� InitCall Position 15, 271, 150, 22�� InitCall Position 15, 293, 150, 22�z InitCall Position 15, 315, 150, 22�� InitCall Position 14, 292, 280, 44�� Init)Call Position 265, 349, 35, 35
Call Hide�� InitCall Position 265, 349, 35, 35�� Init)Call Position 265, 349, 35, 35
Call Hide�� InitCall Position 225, 354, 25, 25�y InitCall Position 25, 344, 200, 22ClickCall IpRocno�x ClickCall UporabiDHCPInitrCall Position 25, 366, 200, 22
Izbrana=IzberiKartico.Select()
If Kartica.Izbrana=DhcpLan Then Call UporabiDHCP
�e InitCall Position  10, 387, 290, 22�