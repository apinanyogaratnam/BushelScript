FasdUAS 1.101.10   ��   ��    k             l      ��  ��    H B Web -- commands for manipulating URLs and sending HTTP requests

     � 	 	 �   W e b   - -   c o m m a n d s   f o r   m a n i p u l a t i n g   U R L s   a n d   s e n d i n g   H T T P   r e q u e s t s 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t     !   l     ��������  ��  ��   !  " # " l      $ % & $ j    �� '�� 0 _support   ' N     ( ( 4    �� )
�� 
scpt ) m     * * � + +  T y p e S u p p o r t % "  used for parameter checking    & � , , 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g #  - . - l     ��������  ��  ��   .  / 0 / l     ��������  ��  ��   0  1 2 1 i    3 4 3 I      �� 5���� 
0 _error   5  6 7 6 o      ���� 0 handlername handlerName 7  8 9 8 o      ���� 0 etext eText 9  : ; : o      ���� 0 enumber eNumber ;  < = < o      ���� 0 efrom eFrom =  >�� > o      ���� 
0 eto eTo��  ��   4 n     ? @ ? I    �� A���� &0 throwcommanderror throwCommandError A  B C B m     D D � E E  W e b C  F G F o    ���� 0 handlername handlerName G  H I H o    ���� 0 etext eText I  J K J o    	���� 0 enumber eNumber K  L M L o   	 
���� 0 efrom eFrom M  N�� N o   
 ���� 
0 eto eTo��  ��   @ o     ���� 0 _support   2  O P O l     ��������  ��  ��   P  Q R Q l     ��������  ��  ��   R  S T S l     �� U V��   U J D--------------------------------------------------------------------    V � W W � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - T  X Y X l     �� Z [��   Z   URL conversion    [ � \ \    U R L   c o n v e r s i o n Y  ] ^ ] l     ��������  ��  ��   ^  _ ` _ l     �� a b��   a copied from Python's urllib.parse module (hardcoded blacklists/whitelists are always problematic as they need to be manually maintained and updated as new protocols arise, but this one seems unavoidable); used to determine when `join URL` should insert "//"    b � c c   c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e   ( h a r d c o d e d   b l a c k l i s t s / w h i t e l i s t s   a r e   a l w a y s   p r o b l e m a t i c   a s   t h e y   n e e d   t o   b e   m a n u a l l y   m a i n t a i n e d   a n d   u p d a t e d   a s   n e w   p r o t o c o l s   a r i s e ,   b u t   t h i s   o n e   s e e m s   u n a v o i d a b l e ) ;   u s e d   t o   d e t e r m i n e   w h e n   ` j o i n   U R L `   s h o u l d   i n s e r t   " / / " `  d e d j    N�� f�� 0 _usesnetloc _usesNetLoc f J    M g g  h i h m     j j � k k  f t p i  l m l m     n n � o o  h t t p m  p q p m     r r � s s  g o p h e r q  t u t m     v v � w w  n n t p u  x y x m     z z � { {  t e l n e t y  | } | m     ~ ~ �    i m a p }  � � � m     � � � � �  w a i s �  � � � m     � � � � �  f i l e �  � � � m     � � � � �  m m s �  � � � m    " � � � � � 
 h t t p s �  � � � m   " % � � � � � 
 s h t t p �  � � � m   % ( � � � � � 
 s n e w s �  � � � m   ( + � � � � �  p r o s p e r o �  � � � m   + . � � � � �  r t s p �  � � � m   . 1 � � � � � 
 r t s p u �  � � � m   1 4 � � � � � 
 r s y n c �  � � � m   4 7 � � � � �   �  � � � m   7 : � � � � �  s v n �  � � � m   : = � � � � �  s v n + s s h �  � � � m   = @ � � � � �  s f t p �  � � � m   @ C � � � � �  n f s �  � � � m   C F � � � � �  g i t �  ��� � m   F I � � � � �  g i t + s s h��   e  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  O R � � � I      �� ����� 0 _ascomponent _asComponent �  ��� � o      ���� 0 
asocstring 
asocString��  ��   � k      � �  � � � Z     � ����� � =     � � � o     ���� 0 
asocstring 
asocString � m    ��
�� 
msng � L     � � m     � � � � �  ��  ��   �  ��� � L     � � c     � � � o    ���� 0 
asocstring 
asocString � m    ��
�� 
ctxt��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  S V � � � I      �� ����� ,0 _joinnetworklocation _joinNetworkLocation �  ��� � o      ���� .0 networklocationrecord networkLocationRecord��  ��   � k    $ � �  � � � r      � � � n     � � � I    �� ����� 60 asoptionalrecordparameter asOptionalRecordParameter �  � � � o    ���� .0 networklocationrecord networkLocationRecord �  � � � K     � � �� � ��� 0 username userName � m     � � � � �   � �� � ��� 0 userpassword userPassword � m   	 
 � � � � �   � �� � ��� 0 hostname hostName � m     � � � � �   � �� ����� 0 
portnumber 
portNumber � m     � � �    ��   � �� m     �  ��  ��   � o     ���� 0 _support   � o      ���� $0 fullnetlocrecord fullNetLocRecord �  r    . n    ,	 J    ,

  o    ���� 0 username userName  o     ���� 0 userpassword userPassword  o   " $���� 0 hostname hostName �� o   & (���� 0 
portnumber 
portNumber��  	 o    ���� $0 fullnetlocrecord fullNetLocRecord o      ���� 0 urlcomponents urlComponents  X   / ��� Q   ? � r   B M c   B I n  B E 1   C E��
�� 
pcnt o   B C���� 0 aref aRef m   E H��
�� 
ctxt n       1   J L��
�� 
pcnt  o   I J���� 0 aref aRef R      ����!
�� .ascrerr ****      � ****��  ! ��"��
�� 
errn" d      ## m      �������   R   U ���$%
�� .ascrerr ****      � ****$ b   a �&'& b   a |()( m   a d** �++ D I n v a l i d   n e t w o r k   l o c a t i o n   r e c o r d   ( ) l  d {,����, n   d {-.- 4   r {��/
�� 
cobj/ l  s z0����0 [   s z121 l  s x3����3 n   s x454 1   t x��
�� 
leng5 o   s t���� 0 urlcomponents urlComponents��  ��  2 m   x y���� ��  ��  . J   d r66 787 m   d g99 �::  u s e r N a m e8 ;<; m   g j== �>>  u s e r P a s s w o r d< ?@? m   j mAA �BB  h o s t N a m e@ C��C m   m pDD �EE  p o r t N u m b e r��  ��  ��  ' m   | FF �GG 0    p r o p e r t y   i s   n o t   t e x t ) .% ��HI
�� 
errnH m   Y \�����YI �J�~
� 
erobJ o   _ `�}�} 0 	urlrecord 	urlRecord�~  �� 0 aref aRef o   2 3�|�| 0 urlcomponents urlComponents KLK r   � �MNM o   � ��{�{ 0 urlcomponents urlComponentsN J      OO PQP o      �z�z 0 username userNameQ RSR o      �y�y 0 userpassword userPasswordS TUT o      �x�x 0 hostname hostNameU V�wV o      �v�v 0 
portnumber 
portNumber�w  L WXW Z  � �YZ�u�tY >  � �[\[ o   � ��s�s 0 userpassword userPassword\ m   � �]] �^^  Z r   � �_`_ b   � �aba b   � �cdc o   � ��r�r 0 username userNamed m   � �ee �ff  :b o   � ��q�q 0 userpassword userPassword` o      �p�p 0 username userName�u  �t  X ghg Z  � �ij�o�ni >  � �klk o   � ��m�m 0 username userNamel m   � �mm �nn  j r   � �opo b   � �qrq o   � ��l�l 0 username userNamer m   � �ss �tt  @p o      �k�k 0 username userName�o  �n  h uvu Z  �wx�j�iw F   � �yzy =  � �{|{ o   � ��h�h 0 hostname hostName| m   � �}} �~~  z H   � � l  � ���g�f� F   � ���� =  � ���� o   � ��e�e 0 username userName� m   � ��� ���  � =  � ���� o   � ��d�d 0 
portnumber 
portNumber� m   � ��� ���  �g  �f  x R   ��c��
�c .ascrerr ****      � ****� m   � �� ��� | I n v a l i d   n e t w o r k   l o c a t i o n   r e c o r d   ( m i s s i n g    h o s t N a m e    p r o p e r t y ) .� �b��
�b 
errn� m   � ��a�a�Y� �`��_
�` 
erob� o   � ��^�^ 0 	urlrecord 	urlRecord�_  �j  �i  v ��� r  ��� b  	��� o  �]�] 0 username userName� o  �\�\ 0 hostname hostName� o      �[�[ 0 hostname hostName� ��� Z !���Z�Y� > ��� o  �X�X 0 
portnumber 
portNumber� m  �� ���  � r  ��� b  ��� b  ��� o  �W�W 0 hostname hostName� m  �� ���  :� o  �V�V 0 
portnumber 
portNumber� o      �U�U 0 hostname hostName�Z  �Y  � ��T� L  "$�� o  "#�S�S 0 hostname hostName�T   � ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O�N�M�O  �N  �M  � ��� l     �L���L  �  -----   � ��� 
 - - - - -� ��� l     �K�J�I�K  �J  �I  � ��� i  W Z��� I     �H��
�H .Web:SplUnull���     ctxt� o      �G�G 0 urltext urlText� �F��E
�F 
NeLo� |�D�C��B��D  �C  � o      �A�A ,0 splitnetworklocation splitNetworkLocation�B  � l     ��@�?� m      �>
�> boovfals�@  �?  �E  � Q     ����� k    ��� ��� r    ��� n   ��� I    �=��<�= $0 asnsurlparameter asNSURLParameter� ��� o    	�;�; 0 urltext urlText� ��:� m   	 
�� ���  �:  �<  � o    �9�9 0 _support  � o      �8�8 0 asocurl asocURL� ��� l   �7���7  �+% TO DO: NSURL doesn't seem to support newer RFC2396 which allows parameters on all path components, so probably have to rework this to re-join resourcePath with parameterString (eliminating parameterString property), or else replace with vanilla URL parser (which might be simpler in practice)   � ���J   T O   D O :   N S U R L   d o e s n ' t   s e e m   t o   s u p p o r t   n e w e r   R F C 2 3 9 6   w h i c h   a l l o w s   p a r a m e t e r s   o n   a l l   p a t h   c o m p o n e n t s ,   s o   p r o b a b l y   h a v e   t o   r e w o r k   t h i s   t o   r e - j o i n   r e s o u r c e P a t h   w i t h   p a r a m e t e r S t r i n g   ( e l i m i n a t i n g   p a r a m e t e r S t r i n g   p r o p e r t y ) ,   o r   e l s e   r e p l a c e   w i t h   v a n i l l a   U R L   p a r s e r   ( w h i c h   m i g h t   b e   s i m p l e r   i n   p r a c t i c e )� ��� r    A��� K    ?�� �6���6 0 username userName� I    �5��4�5 0 _ascomponent _asComponent� ��3� n   ��� I    �2�1�0�2 0 user  �1  �0  � o    �/�/ 0 asocurl asocURL�3  �4  � �.���. 0 userpassword userPassword� I    '�-��,�- 0 _ascomponent _asComponent� ��+� n   #��� I    #�*�)�(�* 0 password  �)  �(  � o    �'�' 0 asocurl asocURL�+  �,  � �&���& 0 hostname hostName� I   ( 2�%��$�% 0 _ascomponent _asComponent� ��#� n  ) .��� I   * .�"�!� �" 0 host  �!  �   � o   ) *�� 0 asocurl asocURL�#  �$  � ���� 0 
portnumber 
portNumber� I   3 =���� 0 _ascomponent _asComponent� ��� n  4 9��� I   5 9���� 0 port  �  �  � o   4 5�� 0 asocurl asocURL�  �  �  � o      �� "0 networklocation networkLocation� ��� Z   B ]����� H   B N�� n  B M��� I   G M���� (0 asbooleanparameter asBooleanParameter� ��� o   G H�� ,0 splitnetworklocation splitNetworkLocation� ��� m   H I�� ��� . n e t w o r k   l o c a t i o n   r e c o r d�  �  � o   B G�� 0 _support  � r   Q Y��� I   Q W���� ,0 _joinnetworklocation _joinNetworkLocation�  �  o   R S�
�
 "0 networklocation networkLocation�  �  � o      �	�	 "0 networklocation networkLocation�  �  � � L   ^ � K   ^ � �� 0 	urlscheme 	urlScheme I   _ i��� 0 _ascomponent _asComponent � n  ` e	 I   a e���� 
0 scheme  �  �  	 o   ` a� �  0 asocurl asocURL�  �   ��
�� "0 networklocation networkLocation
 o   l m���� "0 networklocation networkLocation ���� 0 resourcepath resourcePath I   p z������ 0 _ascomponent _asComponent �� n  q v I   r v�������� 0 path  ��  ��   o   q r���� 0 asocurl asocURL��  ��   ���� "0 parameterstring parameterString I   } ������� 0 _ascomponent _asComponent �� n  ~ � I    ��������� "0 parameterstring parameterString��  ��   o   ~ ���� 0 asocurl asocURL��  ��   ���� 0 querystring queryString I   � ������� 0 _ascomponent _asComponent �� n  � � I   � ��������� 	0 query  ��  ��   o   � ����� 0 asocurl asocURL��  ��   ������ (0 fragmentidentifier fragmentIdentifier I   � ������� 0 _ascomponent _asComponent  ��  n  � �!"! I   � ��������� 0 fragment  ��  ��  " o   � ����� 0 asocurl asocURL��  ��  ��  �  � R      ��#$
�� .ascrerr ****      � ****# o      ���� 0 etext eText$ ��%&
�� 
errn% o      ���� 0 enumber eNumber& ��'(
�� 
erob' o      ���� 0 efrom eFrom( ��)��
�� 
errt) o      ���� 
0 eto eTo��  � I   � ���*���� 
0 _error  * +,+ m   � �-- �..  s p l i t   U R L, /0/ o   � ����� 0 etext eText0 121 o   � ����� 0 enumber eNumber2 343 o   � ����� 0 efrom eFrom4 5��5 o   � ����� 
0 eto eTo��  ��  � 676 l     ��������  ��  ��  7 898 l     ��������  ��  ��  9 :;: l     ��������  ��  ��  ; <=< i  [ ^>?> I     ��@A
�� .Web:JoiUnull���     WebC@ o      ���� 0 	urlrecord 	urlRecordA ��B��
�� 
BaseB |����C��D��  ��  C o      ���� 0 baseurl baseURL��  D l     E����E m      FF �GG  ��  ��  ��  ? l   |HIJH Q    |KLMK P   dNOPN k   cQQ RSR Z   TU��VT >    WXW l   Y����Y I   ��Z[
�� .corecnte****       ****Z J    \\ ]��] o    	���� 0 	urlrecord 	urlRecord��  [ ��^��
�� 
kocl^ m    ��
�� 
reco��  ��  ��  X m    ����  U k   �__ `a` l   ��bc��  b 0 * TO DO: see above TODO re. parameterString   c �dd T   T O   D O :   s e e   a b o v e   T O D O   r e .   p a r a m e t e r S t r i n ga efe r    7ghg n   5iji I    5��k���� 60 asoptionalrecordparameter asOptionalRecordParameterk lml o    ���� 0 	urlrecord 	urlRecordm non K    .pp ��qr�� 0 	urlscheme 	urlSchemeq m    ss �tt  r ��uv�� "0 networklocation networkLocationu m     ww �xx  v ��yz�� 0 resourcepath resourcePathy m   ! "{{ �||  z ��}~�� "0 parameterstring parameterString} m   # $ ���  ~ ������ 0 querystring queryString� m   % &�� ���  � ������� (0 fragmentidentifier fragmentIdentifier� m   ' *�� ���  ��  o ���� m   . 1�� ���  ��  ��  j o    ���� 0 _support  h o      ���� 0 fullurlrecord fullURLRecordf ��� r   8 T��� n   8 R��� J   9 R�� ��� o   : <���� 0 	urlscheme 	urlScheme� ��� o   > @���� 0 resourcepath resourcePath� ��� o   B D���� "0 parameterstring parameterString� ��� o   F H���� 0 querystring queryString� ���� o   J L���� (0 fragmentidentifier fragmentIdentifier��  � o   8 9���� 0 fullurlrecord fullURLRecord� o      ���� 0 urlcomponents urlComponents� ��� X   U ������ Q   g ����� r   j y��� c   j s��� n  j o��� 1   k o��
�� 
pcnt� o   j k���� 0 aref aRef� m   o r��
�� 
ctxt� n     ��� 1   t x��
�� 
pcnt� o   s t���� 0 aref aRef� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � n  � ���� I   � �������� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ����� 0 	urlrecord 	urlRecord� ��� m   � ��� ���  � ��� m   � ���
�� 
reco� ���� b   � ���� b   � ���� m   � ��� ��� 2 U R L   c o m p o n e n t s   r e c o r d  s   � l  � ������� n   � ���� 4   � ����
�� 
cobj� l  � ������� [   � ���� l  � ������� n   � ���� 1   � ���
�� 
leng� o   � ����� 0 urlcomponents urlComponents��  ��  � m   � ����� ��  ��  � J   � ��� ��� m   � ��� ���  u r l S c h e m e� ��� m   � ��� ���  r e s o u r c e P a t h� ��� m   � ��� ���  p a r a m e t e r S t r i n g� ��� m   � ��� ���  q u e r y S t r i n g� ��� m   � ��� ��� $ f r a g m e n t I d e n t i f i e r�  ��  ��  � m   � ��� ��� .    p r o p e r t y   i s   n o t   t e x t .��  ��  � o   � ��~�~ 0 _support  �� 0 aref aRef� o   X Y�}�} 0 urlcomponents urlComponents� ��� r   � ���� o   � ��|�| 0 urlcomponents urlComponents� J      �� ��� o      �{�{ 0 	urlscheme 	urlScheme� ��� o      �z�z 0 resourcepath resourcePath� ��� o      �y�y "0 parameterstring parameterString� ��� o      �x�x 0 querystring queryString� ��w� o      �v�v (0 fragmentidentifier fragmentIdentifier�w  � ��� Z   �5���u�� >   � ���� l  � ���t�s� I  � ��r��
�r .corecnte****       ****� J   � ��� ��q� n  � ���� o   � ��p�p "0 networklocation networkLocation� o   � ��o�o 0 fullurlrecord fullURLRecord�q  � �n��m
�n 
kocl� m   � ��l
�l 
reco�m  �t  �s  � m   � ��k�k  � r  ��� I  	�j��i�j ,0 _joinnetworklocation _joinNetworkLocation� ��h� n    o  �g�g "0 networklocation networkLocation o  �f�f 0 fullurlrecord fullURLRecord�h  �i  � o      �e�e "0 networklocation networkLocation�u  � Q  5 r   c   n 	
	 o  �d�d "0 networklocation networkLocation
 o  �c�c 0 fullurlrecord fullURLRecord m  �b
�b 
ctxt o      �a�a "0 networklocation networkLocation R      �`�_
�` .ascrerr ****      � ****�_   �^�]
�^ 
errn d       m      �\�\��]   n "5 I  '5�[�Z�[ .0 throwinvalidparameter throwInvalidParameter  o  '(�Y�Y 0 	urlrecord 	urlRecord  m  (+ �    m  +,�X
�X 
reco �W m  ,/ � ~ U R L   c o m p o n e n t s   r e c o r d  s    n e t w o r k L o c a t i o n    p r o p e r t y   i s   n o t   t e x t .�W  �Z   o  "'�V�V 0 _support  �  l 6C  r  6C!"! I 6A�U#$
�U .Web:EscUnull���     ctxt# o  67�T�T 0 resourcepath resourcePath$ �S%�R
�S 
Safe% m  :=&& �''  /�R  " o      �Q�Q 0 resourcepath resourcePath s m `split URL` (i.e. NSURL) automatically decodes % escapes in resource path, so automatically encode them here     �(( �   ` s p l i t   U R L `   ( i . e .   N S U R L )   a u t o m a t i c a l l y   d e c o d e s   %   e s c a p e s   i n   r e s o u r c e   p a t h ,   s o   a u t o m a t i c a l l y   e n c o d e   t h e m   h e r e )*) Z  D�+,�P-+ G  Dp./. > DI010 o  DE�O�O "0 networklocation networkLocation1 m  EH22 �33  / l Ll4�N�M4 F  Ll565 F  L_787 > LQ9:9 o  LM�L�L 0 	urlscheme 	urlScheme: m  MP;; �<<  8 E T[=>= o  TY�K�K 0 _usesnetloc _usesNetLoc> o  YZ�J�J 0 	urlscheme 	urlScheme6 H  bh?? C  bg@A@ o  bc�I�I 0 resourcepath resourcePathA m  cfBB �CC  / /�N  �M  , l s�DEFD k  s�GG HIH Z s�JK�H�GJ F  s�LML > sxNON o  st�F�F 0 resourcepath resourcePathO m  twPP �QQ  M H  {�RR C  {�STS o  {|�E�E 0 resourcepath resourcePathT m  |UU �VV  /K r  ��WXW b  ��YZY m  ��[[ �\\  /Z o  ���D�D 0 resourcepath resourcePathX o      �C�C 0 resourcepath resourcePath�H  �G  I ]�B] r  ��^_^ b  ��`a` b  ��bcb m  ��dd �ee  / /c o  ���A�A "0 networklocation networkLocationa o  ���@�@ 0 resourcepath resourcePath_ o      �?�? 0 urltext urlText�B  E / ) copied from Python's urllib.parse module   F �ff R   c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e�P  - r  ��ghg o  ���>�> 0 resourcepath resourcePathh o      �=�= 0 urltext urlText* iji Z ��kl�<�;k > ��mnm o  ���:�: 0 	urlscheme 	urlSchemen m  ��oo �pp  l r  ��qrq b  ��sts b  ��uvu o  ���9�9 0 	urlscheme 	urlSchemev m  ��ww �xx  :t o  ���8�8 0 urltext urlTextr o      �7�7 0 urltext urlText�<  �;  j yzy Z ��{|�6�5{ > ��}~} o  ���4�4 "0 parameterstring parameterString~ m  �� ���  | r  ����� b  ����� b  ����� o  ���3�3 0 urltext urlText� m  ���� ���  ;� o  ���2�2 "0 parameterstring parameterString� o      �1�1 0 urltext urlText�6  �5  z ��� Z �����0�/� > ����� o  ���.�. 0 querystring queryString� m  ���� ���  � r  ����� b  ����� b  ����� o  ���-�- 0 urltext urlText� m  ���� ���  ?� o  ���,�, 0 querystring queryString� o      �+�+ 0 urltext urlText�0  �/  � ��*� Z �����)�(� > ����� o  ���'�' (0 fragmentidentifier fragmentIdentifier� m  ���� ���  � r  ����� b  ����� b  ����� o  ���&�& 0 urltext urlText� m  ���� ���  #� o  ���%�% (0 fragmentidentifier fragmentIdentifier� o      �$�$ 0 urltext urlText�)  �(  �*  ��  V l ����� r  ���� n ���� I  �#��"�# "0 astextparameter asTextParameter� ��� o  �!�! 0 	urlrecord 	urlRecord� �� � m  �� ���  �   �"  � o  ��� 0 _support  � o      �� 0 urltext urlText� M G assume it's a relative URL string that's going to be joined to baseURL   � ��� �   a s s u m e   i t ' s   a   r e l a t i v e   U R L   s t r i n g   t h a t ' s   g o i n g   t o   b e   j o i n e d   t o   b a s e U R LS ��� Z  `����� > ��� o  �� 0 baseurl baseURL� m  �� ���  � k  \�� ��� r  %��� n #��� I  #���� $0 asnsurlparameter asNSURLParameter� ��� o  �� 0 baseurl baseURL� ��� m  �� ���  u s i n g   b a s e   U R L�  �  � o  �� 0 _support  � o      �� 0 baseurl baseURL� ��� r  &5��� n &3��� I  -3���� <0 urlwithstring_relativetourl_ URLWithString_relativeToURL_� ��� o  -.�� 0 urltext urlText� ��� o  ./�� 0 baseurl baseURL�  �  � n &-��� o  )-�� 0 nsurl NSURL� m  &)�
� misccura� o      �� 0 asocurl asocURL� ��� Z 6T����� = 6;��� o  67�
�
 0 asocurl asocURL� m  7:�	
�	 
msng� R  >P���
� .ascrerr ****      � ****� m  LO�� ���   N o t   a   v a l i d   U R L .� ���
� 
errn� m  BE���Y� ���
� 
erob� o  HI�� 0 urltext urlText�  �  �  � ��� r  U\��� c  UZ��� o  UV�� 0 asocurl asocURL� m  VY� 
�  
ctxt� o      ���� 0 urltext urlText�  �  �  � ���� L  ac�� o  ab���� 0 urltext urlText��  O ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  P ����
�� consnume��  L R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  M I  l|������� 
0 _error  � ��� m  mp�� ���  j o i n   U R L� ��� o  pq���� 0 etext eText� ��� o  qr���� 0 enumber eNumber� � � o  rs���� 0 efrom eFrom  �� o  sv���� 
0 eto eTo��  ��  I S M TO DO: if baseURL is given, direct parameter should be either record or text   J � �   T O   D O :   i f   b a s e U R L   i s   g i v e n ,   d i r e c t   p a r a m e t e r   s h o u l d   b e   e i t h e r   r e c o r d   o r   t e x t=  l     ��������  ��  ��    l     ��������  ��  ��    l     ��	
��  	 J D--------------------------------------------------------------------   
 � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����   7 1 encode/decode '%XX' escapes (UTF8 encoding only)    � b   e n c o d e / d e c o d e   ' % X X '   e s c a p e s   ( U T F 8   e n c o d i n g   o n l y )  l     ��������  ��  ��    l      ����  `Z From RFC2396:
	
   2.3. Unreserved Characters

   Data characters that are allowed in a URI but do not have a reserved
   purpose are called unreserved.  These include upper and lower case
   letters, decimal digits, and a limited set of punctuation marks and
   symbols.

      --unreserved  = alphanum | mark

      --mark        = "-" | "_" | "." | "!" | "~" | "*" | "'" | "(" | ")"

   Unreserved characters can be escaped without changing the semantics
   of the URI, but this should not be done unless the URI is being used
   in a context that does not allow the unescaped character to appear.
    ��   F r o m   R F C 2 3 9 6 : 
 	 
       2 . 3 .   U n r e s e r v e d   C h a r a c t e r s 
 
       D a t a   c h a r a c t e r s   t h a t   a r e   a l l o w e d   i n   a   U R I   b u t   d o   n o t   h a v e   a   r e s e r v e d 
       p u r p o s e   a r e   c a l l e d   u n r e s e r v e d .     T h e s e   i n c l u d e   u p p e r   a n d   l o w e r   c a s e 
       l e t t e r s ,   d e c i m a l   d i g i t s ,   a n d   a   l i m i t e d   s e t   o f   p u n c t u a t i o n   m a r k s   a n d 
       s y m b o l s . 
 
             - - u n r e s e r v e d     =   a l p h a n u m   |   m a r k 
 
             - - m a r k                 =   " - "   |   " _ "   |   " . "   |   " ! "   |   " ~ "   |   " * "   |   " ' "   |   " ( "   |   " ) " 
 
       U n r e s e r v e d   c h a r a c t e r s   c a n   b e   e s c a p e d   w i t h o u t   c h a n g i n g   t h e   s e m a n t i c s 
       o f   t h e   U R I ,   b u t   t h i s   s h o u l d   n o t   b e   d o n e   u n l e s s   t h e   U R I   i s   b e i n g   u s e d 
       i n   a   c o n t e x t   t h a t   d o e s   n o t   a l l o w   t h e   u n e s c a p e d   c h a r a c t e r   t o   a p p e a r . 
  l     ��������  ��  ��    l     ����   � � set of characters that never need encoded (copied from Python's urllib.parse module); used by escape URL characters as base character set -- TO DO: any reason why urllib doesn't allow all of the above punctuation chars    ��   s e t   o f   c h a r a c t e r s   t h a t   n e v e r   n e e d   e n c o d e d   ( c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e ) ;   u s e d   b y   e s c a p e   U R L   c h a r a c t e r s   a s   b a s e   c h a r a c t e r   s e t   - -   T O   D O :   a n y   r e a s o n   w h y   u r l l i b   d o e s n ' t   a l l o w   a l l   o f   t h e   a b o v e   p u n c t u a t i o n   c h a r s   j   _ c��!�� "0 _safecharacters _safeCharacters! m   _ b"" �## � a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 - _ .  $%$ l     ��������  ��  ��  % &'& l     ��������  ��  ��  ' ()( i  d g*+* I      ��,���� 0 _replacetext _replaceText, -.- o      ���� 0 thetext theText. /0/ o      ���� 0 fromtext fromText0 1��1 o      ���� 0 totext toText��  ��  + k     22 343 r     565 o     ���� 0 fromtext fromText6 n     787 1    ��
�� 
txdl8 1    ��
�� 
ascr4 9:9 r    ;<; n   	=>= 2   	��
�� 
citm> o    ���� 0 thetext theText< o      ���� 0 thelist theList: ?@? r    ABA o    ���� 0 totext toTextB n     CDC 1    ��
�� 
txdlD 1    ��
�� 
ascr@ E��E L    FF c    GHG o    ���� 0 thelist theListH m    ��
�� 
ctxt��  ) IJI l     ��������  ��  ��  J KLK l     ��������  ��  ��  L MNM l     ��OP��  O  -----   P �QQ 
 - - - - -N RSR l     ��������  ��  ��  S TUT i  h kVWV I     ��XY
�� .Web:EscUnull���     ctxtX o      ���� 0 thetext theTextY ��Z��
�� 
SafeZ |����[��\��  ��  [ o      ���� &0 allowedcharacters allowedCharacters��  \ l     ]����] m      ^^ �__  ��  ��  ��  W Q     o`ab` k    Ycc ded r    fgf n   hih I    ��j���� "0 astextparameter asTextParameterj klk o    	���� 0 thetext theTextl m��m m   	 
nn �oo  ��  ��  i o    ���� 0 _support  g o      ���� 0 thetext theTexte pqp r    $rsr b    "tut o    ���� "0 _safecharacters _safeCharactersu n   !vwv I    !��x���� "0 astextparameter asTextParameterx yzy o    ���� &0 allowedcharacters allowedCharactersz {��{ m    || �}}  p r e s e r v i n g��  ��  w o    ���� 0 _support  s o      ���� &0 allowedcharacters allowedCharactersq ~~ r   % /��� n  % -��� I   ( -������� J0 #charactersetwithcharactersinstring_ #characterSetWithCharactersInString_� ���� o   ( )���� &0 allowedcharacters allowedCharacters��  ��  � n  % (��� o   & (����  0 nscharacterset NSCharacterSet� m   % &��
�� misccura� o      ���� $0 asocallowedchars asocAllowedChars ��� l  0 A���� r   0 A��� n  0 ?��� I   : ?������� j0 3stringbyaddingpercentencodingwithallowedcharacters_ 3stringByAddingPercentEncodingWithAllowedCharacters_� ���� o   : ;���� $0 asocallowedchars asocAllowedChars��  ��  � n  0 :��� I   5 :������� 0 
asnsstring 
asNSString� ���� o   5 6���� 0 thetext theText��  ��  � o   0 5���� 0 _support  � o      ���� 0 
asocresult 
asocResult��� Returns a new string made from the receiver by replacing all characters not in the allowedCharacters set with percent encoded characters. UTF-8 encoding is used to determine the correct percent encoded characters. Entire URL strings cannot be percent-encoded. This method is intended to percent-encode an URL component or subcomponent string, NOT the entire URL string. Any characters in allowedCharacters outside of the 7-bit ASCII range are ignored.   � ����   R e t u r n s   a   n e w   s t r i n g   m a d e   f r o m   t h e   r e c e i v e r   b y   r e p l a c i n g   a l l   c h a r a c t e r s   n o t   i n   t h e   a l l o w e d C h a r a c t e r s   s e t   w i t h   p e r c e n t   e n c o d e d   c h a r a c t e r s .   U T F - 8   e n c o d i n g   i s   u s e d   t o   d e t e r m i n e   t h e   c o r r e c t   p e r c e n t   e n c o d e d   c h a r a c t e r s .   E n t i r e   U R L   s t r i n g s   c a n n o t   b e   p e r c e n t - e n c o d e d .   T h i s   m e t h o d   i s   i n t e n d e d   t o   p e r c e n t - e n c o d e   a n   U R L   c o m p o n e n t   o r   s u b c o m p o n e n t   s t r i n g ,   N O T   t h e   e n t i r e   U R L   s t r i n g .   A n y   c h a r a c t e r s   i n   a l l o w e d C h a r a c t e r s   o u t s i d e   o f   t h e   7 - b i t   A S C I I   r a n g e   a r e   i g n o r e d .� ��� l  B T���� Z  B T������� =  B E��� o   B C���� 0 
asocresult 
asocResult� m   C D��
�� 
msng� R   H P����
�� .ascrerr ****      � ****� m   N O�� ��� ^ C o u l d n ' t   c o n v e r t   c h a r a c t e r s   t o   p e r c e n t   e s c a p e s .� ����
�� 
errn� m   J K�����Y� �����
�� 
erob� o   L M���� 0 thetext theText��  ��  ��  � , & NSString docs are hopeless on details   � ��� L   N S S t r i n g   d o c s   a r e   h o p e l e s s   o n   d e t a i l s� ��� L   U Y�� c   U X��� o   U V�~�~ 0 
asocresult 
asocResult� m   V W�}
�} 
ctxt�  a R      �|��
�| .ascrerr ****      � ****� o      �{�{ 0 etext eText� �z��
�z 
errn� o      �y�y 0 enumber eNumber� �x��
�x 
erob� o      �w�w 0 efrom eFrom� �v��u
�v 
errt� o      �t�t 
0 eto eTo�u  b I   a o�s��r�s 
0 _error  � ��� m   b e�� ��� * e n c o d e   U R L   c h a r a c t e r s� ��� o   e f�q�q 0 etext eText� ��� o   f g�p�p 0 enumber eNumber� ��� o   g h�o�o 0 efrom eFrom� ��n� o   h i�m�m 
0 eto eTo�n  �r  U ��� l     �l�k�j�l  �k  �j  � ��� l     �i�h�g�i  �h  �g  � ��� i  l o��� I     �f��e
�f .Web:UneUnull���     ctxt� o      �d�d 0 thetext theText�e  � Q     K���� k    9�� ��� r    ��� n   ��� I    �c��b�c "0 astextparameter asTextParameter� ��� o    	�a�a 0 thetext theText� ��`� m   	 
�� ���  �`  �b  � o    �_�_ 0 _support  � o      �^�^ 0 thetext theText� ��� l   !���� r    !��� n   ��� I    �]�\�[�] B0 stringbyremovingpercentencoding stringByRemovingPercentEncoding�\  �[  � n   ��� I    �Z��Y�Z 0 
asnsstring 
asNSString� ��X� o    �W�W 0 thetext theText�X  �Y  � o    �V�V 0 _support  � o      �U�U 0 
asocresult 
asocResult� � � Returns a new string made from the receiver by replacing all percent encoded sequences with the matching UTF-8 characters. (NSURLUtilites, 10.9+)   � ���$   R e t u r n s   a   n e w   s t r i n g   m a d e   f r o m   t h e   r e c e i v e r   b y   r e p l a c i n g   a l l   p e r c e n t   e n c o d e d   s e q u e n c e s   w i t h   t h e   m a t c h i n g   U T F - 8   c h a r a c t e r s .   ( N S U R L U t i l i t e s ,   1 0 . 9 + )� ��� Z  " 4���T�S� =  " %��� o   " #�R�R 0 
asocresult 
asocResult� m   # $�Q
�Q 
msng� R   ( 0�P��
�P .ascrerr ****      � ****� m   . /�� ��� � C o u l d n ' t   c o n v e r t   p e r c e n t   e s c a p e s   t o   c h a r a c t e r s   ( e . g .   n o t   v a l i d   U T F 8 ) .� �O��
�O 
errn� m   * +�N�N�Y� �M��L
�M 
erob� o   , -�K�K 0 thetext theText�L  �T  �S  � ��J� L   5 9�� c   5 8��� o   5 6�I�I 0 
asocresult 
asocResult� m   6 7�H
�H 
ctxt�J  � R      �G��
�G .ascrerr ****      � ****� o      �F�F 0 etext eText� �E��
�E 
errn� o      �D�D 0 enumber eNumber� �C��
�C 
erob� o      �B�B 0 efrom eFrom� �A��@
�A 
errt� o      �?�? 
0 eto eTo�@  � I   A K�>��=�> 
0 _error  �    m   B C � * d e c o d e   U R L   c h a r a c t e r s  o   C D�<�< 0 etext eText  o   D E�;�; 0 enumber eNumber 	 o   E F�:�: 0 efrom eFrom	 
�9
 o   F G�8�8 
0 eto eTo�9  �=  �  l     �7�6�5�7  �6  �5    l     �4�3�2�4  �3  �2    l     �1�1   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �0�0   � � parse and format "key1=value1&key2=value2&..." query strings or 'application/x-www-form-urlencoded' data as {{"KEY","VALUE"},...} list    �   p a r s e   a n d   f o r m a t   " k e y 1 = v a l u e 1 & k e y 2 = v a l u e 2 & . . . "   q u e r y   s t r i n g s   o r   ' a p p l i c a t i o n / x - w w w - f o r m - u r l e n c o d e d '   d a t a   a s   { { " K E Y " , " V A L U E " } , . . . }   l i s t  l     �/�.�-�/  �.  �-    i  p s I     �,�+
�, .Web:SplQnull���     ctxt o      �*�* 0 	querytext 	queryText�+   P     � !"  k    �## $%$ r    
&'& n   ()( 1    �)
�) 
txdl) 1    �(
�( 
ascr' o      �'�' 0 oldtids oldTIDs% *�&* Q    �+,-+ k    �.. /0/ r    "121 I     �%3�$�% 0 _replacetext _replaceText3 454 n   676 I    �#8�"�# "0 astextparameter asTextParameter8 9:9 o    �!�! 0 	querytext 	queryText: ;� ; m    << �==  �   �"  7 o    �� 0 _support  5 >?> m    @@ �AA  +? B�B 1    �
� 
spac�  �$  2 o      �� 0 	querytext 	queryText0 CDC r   # (EFE m   # $GG �HH  &F n     IJI 1   % '�
� 
txdlJ 1   $ %�
� 
ascrD KLK r   ) .MNM n  ) ,OPO 2  * ,�
� 
citmP o   ) *�� 0 	querytext 	queryTextN o      �� 0 	querylist 	queryListL QRQ r   / 4STS m   / 0UU �VV  =T n     WXW 1   1 3�
� 
txdlX 1   0 1�
� 
ascrR YZY X   5 �[�\[ k   E �]] ^_^ r   E M`a` n   E Kbcb 2  I K�
� 
citmc l  E Id��d e   E Iee n  E Ifgf 1   F H�
� 
pcntg o   E F�� 0 aref aRef�  �  a o      �� 0 
queryparts 
queryParts_ hih l  N njklj Z  N nmn��m >   N Uopo n   N Sqrq 1   O S�
� 
lengr o   N O�
�
 0 
queryparts 
queryPartsp m   S T�	�	 n R   X j�st
� .ascrerr ****      � ****s m   f iuu �vv * I n v a l i d   q u e r y   s t r i n g .t �wx
� 
errnw m   \ _���Yx �y�
� 
eroby o   b c�� 0 	querytext 	queryText�  �  �  k h b TO DO: implement 'without strict parsing' option, in which case missing `=` wouldn't throw error?   l �zz �   T O   D O :   i m p l e m e n t   ' w i t h o u t   s t r i c t   p a r s i n g '   o p t i o n ,   i n   w h i c h   c a s e   m i s s i n g   ` = `   w o u l d n ' t   t h r o w   e r r o r ?i {|{ l  o o�}~�  } N H TO DO: what if key is empty string? error here, or leave it for caller?   ~ � �   T O   D O :   w h a t   i f   k e y   i s   e m p t y   s t r i n g ?   e r r o r   h e r e ,   o r   l e a v e   i t   f o r   c a l l e r ?| ��� r   o ���� J   o ��� ��� I  o w� ���
�  .Web:UneUnull���     ctxt� l  o s������ n   o s��� 4   p s���
�� 
cobj� m   q r���� � o   o p���� 0 
queryparts 
queryParts��  ��  ��  � ���� I  w �����
�� .Web:UneUnull���     ctxt� l  w {������ n   w {��� 4   x {���
�� 
cobj� m   y z���� � o   w x���� 0 
queryparts 
queryParts��  ��  ��  ��  � n     ��� 1   � ���
�� 
pcnt� o   � ����� 0 aref aRef�  � 0 aref aRef\ o   8 9���� 0 	querylist 	queryListZ ��� r   � ���� o   � ����� 0 oldtids oldTIDs� n     ��� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr� ���� L   � ��� o   � ����� 0 	querylist 	queryList��  , R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  - k   � ��� ��� r   � ���� o   � ����� 0 oldtids oldTIDs� n     ��� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr� ���� I   � �������� 
0 _error  � ��� m   � ��� ��� , s p l i t   U R L   q u e r y   s t r i n g� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  ��  �&  ! ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  " ����
�� consnume��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  t w��� I     �����
�� .Web:JoiQnull���     ****� o      ���� 0 	querylist 	queryList��  � k     ��� ��� r     ��� n    ��� 1    ��
�� 
txdl� 1     ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ���� Q    ����� k   	 ��� ��� r   	 ��� n  	 ��� 2   ��
�� 
cobj� n  	 ��� I    ������� 0 aslist asList� ��� o    ���� 0 	querylist 	queryList� ���� m    �� ���  ��  ��  � o   	 ���� 0 _support  � o      ���� 0 	querylist 	queryList� ��� X    ������ k   ) ��� ��� r   ) .��� n  ) ,��� 1   * ,��
�� 
pcnt� o   ) *���� 0 aref aRef� o      ���� 0 kvpair kvPair� ��� Z  / T������� F   / E��� H   / ;�� =   / :��� l  / 8������ I  / 8����
�� .corecnte****       ****� J   / 2�� ���� o   / 0���� 0 kvpair kvPair��  � �����
�� 
kocl� m   3 4��
�� 
list��  ��  ��  � m   8 9���� � =   > C��� n  > A��� 1   ? A��
�� 
leng� o   > ?���� 0 kvpair kvPair� m   A B���� � R   H P����
�� .ascrerr ****      � ****� m   N O�� ��� l I n v a l i d   q u e r y   l i s t   ( n o t   a   l i s t   o f   k e y - v a l u e   s u b l i s t s ) .� ��� 
�� 
errn� m   J K�����Y  ����
�� 
erob o   L M���� 0 aref aRef��  ��  ��  �  Z   U r���� H   U a =   U ` l  U ^	����	 I  U ^��

�� .corecnte****       ****
 o   U V���� 0 kvpair kvPair ����
�� 
kocl m   W Z��
�� 
ctxt��  ��  ��   m   ^ _����  R   d n��
�� .ascrerr ****      � **** m   j m � d I n v a l i d   q u e r y   l i s t   ( k e y s   a n d   v a l u e s   m u s t   b e   t e x t ) . ��
�� 
errn m   f g�����Y ����
�� 
erob o   h i���� 0 aref aRef��  ��  ��   �� r   s � I   s ������� 0 _replacetext _replaceText  b   t � b   t � l  t ����� I  t ��� 
�� .Web:EscUnull���     ctxt l  t x!����! n  t x"#" 4   u x��$
�� 
cobj$ m   v w���� # o   t u���� 0 kvpair kvPair��  ��    ��%��
�� 
Safe% 1   { ~��
�� 
spac��  ��  ��   m   � �&& �''  = l  � �(����( I  � ���)*
�� .Web:EscUnull���     ctxt) l  � �+���+ n  � �,-, 4   � ��~.
�~ 
cobj. m   � ��}�} - o   � ��|�| 0 kvpair kvPair��  �  * �{/�z
�{ 
Safe/ 1   � ��y
�y 
spac�z  ��  ��   010 1   � ��x
�x 
spac1 2�w2 m   � �33 �44  +�w  ��   n     565 1   � ��v
�v 
pcnt6 o   � ��u�u 0 aref aRef��  �� 0 aref aRef� o    �t�t 0 	querylist 	queryList� 787 r   � �9:9 m   � �;; �<<  &: n     =>= 1   � ��s
�s 
txdl> 1   � ��r
�r 
ascr8 ?@? r   � �ABA c   � �CDC o   � ��q�q 0 	querylist 	queryListD m   � ��p
�p 
ctxtB o      �o�o 0 	querytext 	queryText@ EFE r   � �GHG o   � ��n�n 0 oldtids oldTIDsH n     IJI 1   � ��m
�m 
txdlJ 1   � ��l
�l 
ascrF K�kK L   � �LL o   � ��j�j 0 	querytext 	queryText�k  � R      �iMN
�i .ascrerr ****      � ****M o      �h�h 0 etext eTextN �gOP
�g 
errnO o      �f�f 0 enumber eNumberP �eQR
�e 
erobQ o      �d�d 0 efrom eFromR �cS�b
�c 
errtS o      �a�a 
0 eto eTo�b  � k   � �TT UVU r   � �WXW o   � ��`�` 0 oldtids oldTIDsX n     YZY 1   � ��_
�_ 
txdlZ 1   � ��^
�^ 
ascrV [�][ I   � ��\\�[�\ 
0 _error  \ ]^] m   � �__ �`` * j o i n   U R L   q u e r y   s t r i n g^ aba o   � ��Z�Z 0 etext eTextb cdc o   � ��Y�Y 0 enumber eNumberd efe o   � ��X�X 0 efrom eFromf g�Wg o   � ��V�V 
0 eto eTo�W  �[  �]  ��  � hih l     �U�T�S�U  �T  �S  i jkj l     �R�Q�P�R  �Q  �P  k lml l     �Ono�O  n J D--------------------------------------------------------------------   o �pp � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -m qrq l     �Nst�N  s , & encode/decode AS objects as JSON data   t �uu L   e n c o d e / d e c o d e   A S   o b j e c t s   a s   J S O N   d a t ar vwv l     �M�L�K�M  �L  �K  w xyx i  x {z{z I     �J|}
�J .Web:FJSNnull���     ****| o      �I�I 0 
jsonobject 
jsonObject} �H~�G
�H 
EWSp~ |�F�E�D��F  �E   o      �C�C "0 isprettyprinted isPrettyPrinted�D  � l     ��B�A� m      �@
�@ boovfals�B  �A  �G  { Q     ����� k    ��� ��� Z    ���?�� n   ��� I    �>��=�> (0 asbooleanparameter asBooleanParameter� ��� o    	�<�< "0 isprettyprinted isPrettyPrinted� ��;� m   	 
�� ��� " e x t r a   w h i t e   s p a c e�;  �=  � o    �:�: 0 _support  � r    ��� n   ��� o    �9�9 80 nsjsonwritingprettyprinted NSJSONWritingPrettyPrinted� m    �8
�8 misccura� o      �7�7 0 writeoptions writeOptions�?  � r    ��� m    �6�6  � o      �5�5 0 writeoptions writeOptions� ��� Z    5���4�3� H    &�� l   %��2�1� n   %��� I     %�0��/�0 (0 isvalidjsonobject_ isValidJSONObject_� ��.� o     !�-�- 0 
jsonobject 
jsonObject�.  �/  � n    ��� o     �,�, *0 nsjsonserialization NSJSONSerialization� m    �+
�+ misccura�2  �1  � R   ) 1�*��
�* .ascrerr ****      � ****� m   / 0�� ��� z C a n  t   c o n v e r t   o b j e c t   t o   J S O N   ( f o u n d   u n s u p p o r t e d   o b j e c t   t y p e ) .� �)��
�) 
errn� m   + ,�(�(�Y� �'��&
�' 
erob� o   - .�%�% 0 
jsonobject 
jsonObject�&  �4  �3  � ��� r   6 O��� n  6 @��� I   9 @�$��#�$ F0 !datawithjsonobject_options_error_ !dataWithJSONObject_options_error_� ��� o   9 :�"�" 0 
jsonobject 
jsonObject� ��� o   : ;�!�! 0 writeoptions writeOptions� �� � l  ; <���� m   ; <�
� 
obj �  �  �   �#  � n  6 9��� o   7 9�� *0 nsjsonserialization NSJSONSerialization� m   6 7�
� misccura� J      �� ��� o      �� 0 thedata theData� ��� o      �� 0 theerror theError�  � ��� Z  P l����� =  P S��� o   P Q�� 0 thedata theData� m   Q R�
� 
msng� R   V h���
� .ascrerr ****      � ****� b   \ g��� b   \ c��� m   \ ]�� ��� : C a n  t   c o n v e r t   o b j e c t   t o   J S O N (� n  ] b��� I   ^ b���� ,0 localizeddescription localizedDescription�  �  � o   ] ^�� 0 theerror theError� m   c f�� ���  ) .� ���
� 
errn� m   X Y���Y� ���
� 
erob� o   Z [�
�
 0 
jsonobject 
jsonObject�  �  �  � ��	� L   m ��� c   m ���� l  m ����� n  m ���� I   v ����� 00 initwithdata_encoding_ initWithData_encoding_� ��� o   v w�� 0 thedata theData� ��� l  w |���� n  w |��� o   x |� �  ,0 nsutf8stringencoding NSUTF8StringEncoding� m   w x��
�� misccura�  �  �  �  � n  m v��� I   r v�������� 	0 alloc  ��  ��  � n  m r��� o   n r���� 0 nsstring NSString� m   m n��
�� misccura�  �  � m   � ���
�� 
ctxt�	  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   � �������� 
0 _error  � ��� m   � ��� ���  e n c o d e   J S O N� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  y ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  | � � I     ��
�� .Web:PJSNnull���     ctxt o      ���� 0 jsontext jsonText ����
�� 
Frag |��������  ��   o      ���� *0 arefragmentsallowed areFragmentsAllowed��   l     ���� m      ��
�� boovfals��  ��  ��    Q     �	 k    �

  r     n    I    ������ "0 astextparameter asTextParameter  o    	���� 0 jsontext jsonText �� m   	 
 �  ��  ��   o    ���� 0 _support   o      ���� 0 jsontext jsonText  Z    *�� n    I    ������ (0 asbooleanparameter asBooleanParameter   o    ���� *0 arefragmentsallowed areFragmentsAllowed  !��! m    "" �## $ a l l o w i n g   f r a g m e n t s��  ��   o    ���� 0 _support   r    $$%$ n   "&'& o     "���� :0 nsjsonreadingallowfragments NSJSONReadingAllowFragments' m     ��
�� misccura% o      ���� 0 readoptions readOptions��   r   ' *()( m   ' (����  ) o      ���� 0 readoptions readOptions *+* r   + >,-, n  + <./. I   5 <��0���� (0 datausingencoding_ dataUsingEncoding_0 1��1 l  5 82����2 n  5 8343 o   6 8���� ,0 nsutf8stringencoding NSUTF8StringEncoding4 m   5 6��
�� misccura��  ��  ��  ��  / n  + 5565 I   0 5��7���� 0 
asnsstring 
asNSString7 8��8 o   0 1���� 0 jsontext jsonText��  ��  6 o   + 0���� 0 _support  - o      ���� 0 thedata theData+ 9:9 r   ? X;<; n  ? I=>= I   B I��?���� F0 !jsonobjectwithdata_options_error_ !JSONObjectWithData_options_error_? @A@ o   B C���� 0 thedata theDataA BCB o   C D���� 0 readoptions readOptionsC D��D l  D EE����E m   D E��
�� 
obj ��  ��  ��  ��  > n  ? BFGF o   @ B���� *0 nsjsonserialization NSJSONSerializationG m   ? @��
�� misccura< J      HH IJI o      ���� 0 
jsonobject 
jsonObjectJ K��K o      ���� 0 theerror theError��  : LML Z  Y {NO����N =  Y \PQP o   Y Z���� 0 
jsonobject 
jsonObjectQ m   Z [��
�� 
msngO R   _ w��RS
�� .ascrerr ****      � ****R b   i vTUT b   i rVWV m   i lXX �YY   N o t   v a l i d   J S O N   (W n  l qZ[Z I   m q�������� ,0 localizeddescription localizedDescription��  ��  [ o   l m���� 0 theerror theErrorU m   r u\\ �]]  ) .S ��^_
�� 
errn^ m   a b�����Y_ ��`��
�� 
erob` o   e f���� 0 jsontext jsonText��  ��  ��  M a��a L   | �bb c   | �cdc o   | }���� 0 
jsonobject 
jsonObjectd m   } ���
�� 
****��   R      ��ef
�� .ascrerr ****      � ****e o      ���� 0 etext eTextf ��gh
�� 
errng o      ���� 0 enumber eNumberh ��ij
�� 
erobi o      ���� 0 efrom eFromj ��k��
�� 
errtk o      ���� 
0 eto eTo��  	 I   � ���l���� 
0 _error  l mnm m   � �oo �pp  d e c o d e   J S O Nn qrq o   � ����� 0 etext eTextr sts o   � ����� 0 enumber eNumbert uvu o   � ����� 0 efrom eFromv w��w o   � ����� 
0 eto eTo��  ��  � xyx l     ��������  ��  ��  y z{z l     ��������  ��  ��  { |}| l     ��������  ��  ��  } ~~ i  � ���� I     �����
�� .Web:FB64null���     ctxt� o      ���� 0 thetext theText��  � Q     :���� k    (�� ��� r    ��� n   ��� I    ���~� 0 
asnsstring 
asNSString� ��}� n   ��� I    �|��{�| "0 astextparameter asTextParameter� ��� o    �z�z 0 thetext theText� ��y� m    �� ���  �y  �{  � o    �x�x 0 _support  �}  �~  � o    �w�w 0 _support  � o      �v�v 0 
asocstring 
asocString� ��u� L    (�� n   '��� I    '�t��s�t (0 datausingencoding_ dataUsingEncoding_� ��r� l   #��q�p� n   #��� I    #�o��n�o B0 base64encodedstringwithoptions_ base64EncodedStringWithOptions_� ��m� m    �l�l  �m  �n  � l   ��k�j� n   ��� o    �i�i ,0 nsutf8stringencoding NSUTF8StringEncoding� m    �h
�h misccura�k  �j  �q  �p  �r  �s  � o    �g�g 0 
asocstring 
asocString�u  � R      �f��
�f .ascrerr ****      � ****� o      �e�e 0 etext eText� �d��
�d 
errn� o      �c�c 0 enumber eNumber� �b��
�b 
erob� o      �a�a 0 efrom eFrom� �`��_
�` 
errt� o      �^�^ 
0 eto eTo�_  � I   0 :�]��\�] 
0 _error  � ��� m   1 2�� ���  e n c o d e   B a s e 6 4� ��� o   2 3�[�[ 0 etext eText� ��� o   3 4�Z�Z 0 enumber eNumber� ��� o   4 5�Y�Y 0 efrom eFrom� ��X� o   5 6�W�W 
0 eto eTo�X  �\   ��� l     �V�U�T�V  �U  �T  � ��� l     �S�R�Q�S  �R  �Q  � ��� i  � ���� I     �P��O
�P .Web:PB64null���     ctxt� o      �N�N 0 thetext theText�O  � Q     b���� k    L�� ��� r    ��� n   ��� I    �M��L�M "0 astextparameter asTextParameter� ��� o    	�K�K 0 thetext theText� ��J� m   	 
�� ���  �J  �L  � o    �I�I 0 _support  � o      �H�H 0 thetext theText� ��� l   "���� r    "��� n    ��� I     �G��F�G L0 $initwithbase64encodedstring_options_ $initWithBase64EncodedString_options_� ��� o    �E�E 0 thetext theText� ��D� l   ��C�B� n   ��� o    �A�A Z0 +nsdatabase64decodingignoreunknowncharacters +NSDataBase64DecodingIgnoreUnknownCharacters� m    �@
�@ misccura�C  �B  �D  �F  � n   ��� I    �?�>�=�? 	0 alloc  �>  �=  � n   ��� o    �<�< 0 nsdata NSData� m    �;
�; misccura� o      �:�: 0 asocdata asocData� � � ignores line breaks and other non-Base64 chars; TO DO: would it be better to strip white space chars separately, then fail if text contains any other non-Base64 chars   � ���N   i g n o r e s   l i n e   b r e a k s   a n d   o t h e r   n o n - B a s e 6 4   c h a r s ;   T O   D O :   w o u l d   i t   b e   b e t t e r   t o   s t r i p   w h i t e   s p a c e   c h a r s   s e p a r a t e l y ,   t h e n   f a i l   i f   t e x t   c o n t a i n s   a n y   o t h e r   n o n - B a s e 6 4   c h a r s� ��� r   # 4��� l  # 2��9�8� n  # 2��� I   * 2�7��6�7 00 initwithdata_encoding_ initWithData_encoding_� ��� o   * +�5�5 0 asocdata asocData� ��4� l  + .��3�2� n  + .��� o   , .�1�1 ,0 nsutf8stringencoding NSUTF8StringEncoding� m   + ,�0
�0 misccura�3  �2  �4  �6  � n  # *��� I   & *�/�.�-�/ 	0 alloc  �.  �-  � n  # &��� o   $ &�,�, 0 nsstring NSString� m   # $�+
�+ misccura�9  �8  � o      �*�* 0 
asocstring 
asocString� ��)� Z  5 L���(�'� =  5 8��� o   5 6�&�& 0 
asocstring 
asocString� m   6 7�%
�% 
msng� n  ; H��� I   @ H�$��#�$ .0 throwinvalidparameter throwInvalidParameter�    o   @ A�"�" 0 thetext theText  m   A B �    m   B C�!
�! 
ctxt �  m   C D		 �

 l B a s e 6 4 - e n c o d e d   d a t a   d o e s n ' t   c o n t a i n   U T F 8 - e n c o d e d   t e x t .�   �#  � o   ; @�� 0 _support  �(  �'  �)  � R      �
� .ascrerr ****      � **** o      �� 0 etext eText �
� 
errn o      �� 0 enumber eNumber �
� 
erob o      �� 0 efrom eFrom ��
� 
errt o      �� 
0 eto eTo�  � I   T b��� 
0 _error    m   U X �  d e c o d e   B a s e 6 4  o   X Y�� 0 etext eText  o   Y Z�� 0 enumber eNumber  o   Z [�� 0 efrom eFrom � o   [ \�� 
0 eto eTo�  �  �  l     ����  �  �    !  l     ��
�	�  �
  �	  ! "#" l     �$%�  $ J D--------------------------------------------------------------------   % �&& � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -# '(' l     �)*�  )   HTTP dispatch   * �++    H T T P   d i s p a t c h( ,-, l     ����  �  �  - ./. l     0120 j   � ��3� "0 _excludeheaders _excludeHeaders3 J   � �44 565 m   � �77 �88  A u t h o r i z a t i o n6 9:9 m   � �;; �<<  C o n n e c t i o n: =>= m   � �?? �@@  H o s t> ABA m   � �CC �DD $ P r o x y - A u t h e n t i c a t eB EFE m   � �GG �HH & P r o x y - A u t h o r i z a t i o nF IJI m   � �KK �LL   W W W - A u t h e n t i c a t eJ M�M m   � �NN �OO  C o n t e n t - L e n g t h�  1 � � note: unlike authorization headers, "Content-Length" isn't reserved by NSSession but is already set automatically so no point allowing users to override with potentially wrong value   2 �PPl   n o t e :   u n l i k e   a u t h o r i z a t i o n   h e a d e r s ,   " C o n t e n t - L e n g t h "   i s n ' t   r e s e r v e d   b y   N S S e s s i o n   b u t   i s   a l r e a d y   s e t   a u t o m a t i c a l l y   s o   n o   p o i n t   a l l o w i n g   u s e r s   t o   o v e r r i d e   w i t h   p o t e n t i a l l y   w r o n g   v a l u e/ QRQ l     �� ���  �   ��  R STS l     ��������  ��  ��  T UVU h   � ���W�� (0 _nsstringencodings _NSStringEncodingsW l     XYZX k      [[ \]\ l     ��^_��  ^�� note: the right way to implement this would be to convert charset name to NSStringEncoding via CFStringConvertIANACharSetNameToEncoding and CFStringConvertEncodingToNSStringEncoding, but ASOC can't call CF APIs properly so all we can do here is define our own list of charset names (including variations) that map directly to available NSStringEncodings; user will have to work with NSData when dealing with any other encodings   _ �``X   n o t e :   t h e   r i g h t   w a y   t o   i m p l e m e n t   t h i s   w o u l d   b e   t o   c o n v e r t   c h a r s e t   n a m e   t o   N S S t r i n g E n c o d i n g   v i a   C F S t r i n g C o n v e r t I A N A C h a r S e t N a m e T o E n c o d i n g   a n d   C F S t r i n g C o n v e r t E n c o d i n g T o N S S t r i n g E n c o d i n g ,   b u t   A S O C   c a n ' t   c a l l   C F   A P I s   p r o p e r l y   s o   a l l   w e   c a n   d o   h e r e   i s   d e f i n e   o u r   o w n   l i s t   o f   c h a r s e t   n a m e s   ( i n c l u d i n g   v a r i a t i o n s )   t h a t   m a p   d i r e c t l y   t o   a v a i l a b l e   N S S t r i n g E n c o d i n g s ;   u s e r   w i l l   h a v e   t o   w o r k   w i t h   N S D a t a   w h e n   d e a l i n g   w i t h   a n y   o t h e r   e n c o d i n g s] aba j     ��c�� 	0 _list  c m     ��
�� 
msngb ded l     ��������  ��  ��  e fgf i   hih I      �������� 	0 _init  ��  ��  i r    &jkj J     ll mnm l 	   	o����o J     	pp qrq J     ss tut m     vv �ww 
 u t f - 8u x��x m    yy �zz  u t f 8��  r {��{ n   |}| o    ���� ,0 nsutf8stringencoding NSUTF8StringEncoding} m    ��
�� misccura��  ��  ��  n ~~ l 	 	 ������ J   	 �� ��� J   	 �� ��� m   	 
�� ���  u t f - 1 6� ���� m   
 �� ��� 
 u t f 1 6��  � ���� n   ��� o    ���� .0 nsutf16stringencoding NSUTF16StringEncoding� m    ��
�� misccura��  ��  ��   ��� l 	  ������ J    �� ��� J    �� ��� m    �� ���  u t f - 1 6 b e� ���� m    �� ���  u t f 1 6 b e��  � ���� n   ��� o    ���� @0 nsutf16bigendianstringencoding NSUTF16BigEndianStringEncoding� m    ��
�� misccura��  ��  ��  � ��� l 	  $������ J    $�� ��� J    �� ��� m    �� ���  u t f - 1 6 l e� ���� m    �� ���  u t f 1 6 l e��  � ���� n   "��� o     "���� F0 !nsutf16littleendianstringencoding !NSUTF16LittleEndianStringEncoding� m     ��
�� misccura��  ��  ��  � ��� l 	 $ -������ J   $ -�� ��� J   $ (�� ��� m   $ %�� ���  u t f - 3 2� ���� m   % &�� ��� 
 u t f 3 2��  � ���� n  ( +��� o   ) +���� .0 nsutf32stringencoding NSUTF32StringEncoding� m   ( )��
�� misccura��  ��  ��  � ��� l 	 - <������ J   - <�� ��� J   - 5�� ��� m   - 0�� ���  u t f - 3 2 b e� ���� m   0 3�� ���  u t f 3 2 b e��  � ���� n  5 :��� o   6 :���� @0 nsutf32bigendianstringencoding NSUTF32BigEndianStringEncoding� m   5 6��
�� misccura��  ��  ��  � ��� l 	 < K������ J   < K�� ��� J   < D�� ��� m   < ?�� ���  u t f - 3 2 l e� ���� m   ? B�� ���  u t f 3 2 l e��  � ���� n  D I��� o   E I���� F0 !nsutf32littleendianstringencoding !NSUTF32LittleEndianStringEncoding� m   D E��
�� misccura��  ��  ��  � ��� l 	 K W������ J   K W�� ��� J   K P�� ���� m   K N�� ��� 
 a s c i i��  � ���� n  P U��� o   Q U���� .0 nsasciistringencoding NSASCIIStringEncoding� m   P Q��
�� misccura��  ��  ��  � ��� l 	 W i������ J   W i�� ��� J   W b�� ��� m   W Z�� ���  i s o - 2 0 2 2 - j p� ��� m   Z ]�� ���  i s o 2 0 2 2 j p� 	 ��	  m   ] `		 �		  c s i s o 2 0 2 2 j p��  � 	��	 n  b g			 o   c g���� 60 nsiso2022jpstringencoding NSISO2022JPStringEncoding	 m   b c��
�� misccura��  ��  ��  � 			 l 	 i {	����	 J   i {				 	
		
 J   i t		 			 m   i l		 �		  i s o - 8 8 5 9 - 1	 			 m   l o		 �		  l a t i n 1	 	��	 m   o r		 �		  i s o 8 8 5 9 - 1��  	 	��	 n  t y			 o   u y���� 60 nsisolatin1stringencoding NSISOLatin1StringEncoding	 m   t u��
�� misccura��  ��  ��  	 			 l 	 { �	����	 J   { �		 		 	 J   { �	!	! 	"	#	" m   { ~	$	$ �	%	%  i s o - 8 8 5 9 - 2	# 	&	'	& m   ~ �	(	( �	)	)  l a t i n 2	' 	*��	* m   � �	+	+ �	,	,  i s o 8 8 5 9 - 2��  	  	-��	- n  � �	.	/	. o   � ����� 60 nsisolatin2stringencoding NSISOLatin2StringEncoding	/ m   � ���
�� misccura��  ��  ��  	 	0	1	0 l 	 � �	2����	2 J   � �	3	3 	4	5	4 J   � �	6	6 	7	8	7 m   � �	9	9 �	:	:  e u c - j p	8 	;	<	; m   � �	=	= �	>	> 
 u - j i s	< 	?	@	? m   � �	A	A �	B	B 
 e u c j p	@ 	C��	C m   � �	D	D �	E	E  u j i s��  	5 	F��	F n  � �	G	H	G o   � ����� :0 nsjapaneseeucstringencoding NSJapaneseEUCStringEncoding	H m   � ���
�� misccura��  ��  ��  	1 	I	J	I l 	 � �	K����	K J   � �	L	L 	M	N	M J   � �	O	O 	P��	P m   � �	Q	Q �	R	R  m a c r o m a n��  	N 	S��	S n  � �	T	U	T o   � ����� 80 nsmacosromanstringencoding NSMacOSRomanStringEncoding	U m   � ���
�� misccura��  ��  ��  	J 	V	W	V l 	 � �	X����	X J   � �	Y	Y 	Z	[	Z J   � �	\	\ 	]	^	] m   � �	_	_ �	`	`  s h i f t - j i s	^ 	a	b	a m   � �	c	c �	d	d 
 s - j i s	b 	e��	e m   � �	f	f �	g	g  s j i s��  	[ 	h��	h n  � �	i	j	i o   � ����� 40 nsshiftjisstringencoding NSShiftJISStringEncoding	j m   � ���
�� misccura��  ��  ��  	W 	k	l	k l 	 � �	m����	m J   � �	n	n 	o	p	o J   � �	q	q 	r	s	r m   � �	t	t �	u	u  w i n d o w s - 1 2 5 0	s 	v	w	v m   � �	x	x �	y	y  w i n d o w s 1 2 5 0	w 	z��	z m   � �	{	{ �	|	|  c p 1 2 5 0��  	p 	}��	} n  � �	~		~ o   � ����� >0 nswindowscp1250stringencoding NSWindowsCP1250StringEncoding	 m   � ���
�� misccura��  ��  ��  	l 	�	�	� l 	 � �	�����	� J   � �	�	� 	�	�	� J   � �	�	� 	�	�	� m   � �	�	� �	�	�  w i n d o w s - 1 2 5 1	� 	�	�	� m   � �	�	� �	�	�  w i n d o w s 1 2 5 1	� 	���	� m   � �	�	� �	�	�  c p 1 2 5 1��  	� 	���	� n  � �	�	�	� o   � ����� >0 nswindowscp1251stringencoding NSWindowsCP1251StringEncoding	� m   � ���
�� misccura��  ��  ��  	� 	�	�	� l 	 � �	�����	� J   � �	�	� 	�	�	� J   � �	�	� 	�	�	� m   � �	�	� �	�	�  w i n d o w s - 1 2 5 2	� 	�	�	� m   � �	�	� �	�	�  w i n d o w s 1 2 5 2	� 	���	� m   � �	�	� �	�	�  c p 1 2 5 2��  	� 	���	� n  � �	�	�	� o   � ����� >0 nswindowscp1252stringencoding NSWindowsCP1252StringEncoding	� m   � ���
�� misccura��  ��  ��  	� 	�	�	� l 	 �
	�����	� J   �
	�	� 	�	�	� J   �	�	� 	�	�	� m   � �	�	� �	�	�  w i n d o w s - 1 2 5 3	� 	�	�	� m   � �	�	� �	�	�  w i n d o w s 1 2 5 3	� 	���	� m   �	�	� �	�	�  c p 1 2 5 3��  	� 	���	� n 	�	�	� o  ���� >0 nswindowscp1253stringencoding NSWindowsCP1253StringEncoding	� m  ��
�� misccura��  ��  ��  	� 	���	� l 	
	�����	� J  
	�	� 	�	�	� J  
	�	� 	�	�	� m  
	�	� �	�	�  w i n d o w s - 1 2 5 4	� 	�	�	� m  	�	� �	�	�  w i n d o w s 1 2 5 4	� 	���	� m  	�	� �	�	�  c p 1 2 5 4��  	� 	���	� n 	�	�	� o  ���� >0 nswindowscp1254stringencoding NSWindowsCP1254StringEncoding	� m  �
� misccura��  ��  ��  ��  k o      �~�~ 	0 _list  g 	�	�	� l     �}�|�{�}  �|  �{  	� 	��z	� i   
	�	�	� I      �y	��x�y 0 getencoding getEncoding	� 	��w	� o      �v�v 0 textencoding textEncoding�w  �x  	� Q     U	�	��u	� k    L	�	� 	�	�	� Z   	�	��t�s	� =   
	�	�	� o    �r�r 	0 _list  	� m    	�q
�q 
msng	� I    �p�o�n�p 	0 _init  �o  �n  �t  �s  	� 	��m	� P    L	�	�	�	� k    K	�	� 	�	�	� X    H	��l	�	� Z  . C	�	��k�j	� E  . 6	�	�	� n  . 2	�	�	� 4   / 2�i	�
�i 
cobj	� m   0 1�h�h 	� o   . /�g�g 0 aref aRef	� J   2 5	�	� 	��f	� o   2 3�e�e 0 textencoding textEncoding�f  	� L   9 ?	�	� n  9 >	�	�	� 4   : =�d	�
�d 
cobj	� m   ; <�c�c 	� o   9 :�b�b 0 aref aRef�k  �j  �l 0 aref aRef	� n   "	�	�	� o     "�a�a 	0 _list  	�  f     	� 	��`	� L   I K	�	� m   I J�_
�_ 
msng�`  	� �^	�
�^ consdiac	� �]	�
�] conshyph	� �\	�
�\ conspunc	� �[�Z
�[ conswhit�Z  	� �Y
 
�Y conscase
  �X�W
�X consnume�W  �m  	� R      �V�U�T
�V .ascrerr ****      � ****�U  �T  �u  �z  Y g a used by `send HTTP request` to automatically encode/decode text-based request/response body data   Z �

 �   u s e d   b y   ` s e n d   H T T P   r e q u e s t `   t o   a u t o m a t i c a l l y   e n c o d e / d e c o d e   t e x t - b a s e d   r e q u e s t / r e s p o n s e   b o d y   d a t aV 


 l     �S�R�Q�S  �R  �Q  
 


 l     �P�O�N�P  �O  �N  
 


 i  � �

	
 I      �M

�L�M 0 _parsecharset _parseCharset

 
�K
 o      �J�J "0 asoccontenttype asocContentType�K  �L  
	 k     :

 


 l    



 r     


 n    



 I    
�I
�H�I Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_
 


 m    

 �

 V ( ? i ) ; \ s * c h a r s e t \ s * = \ s * ( " ? ) ( . + ? ) \ 1 \ s * ( ? : ; | $ )
 


 m    �G�G  
 
�F
 l   
�E�D
 m    �C
�C 
msng�E  �D  �F  �H  
 n    

 
 o    �B�B *0 nsregularexpression NSRegularExpression
  m     �A
�A misccura
 o      �@�@ 0 asocpattern asocPattern
 � � sloppy non-RFC1341 pattern not appropriate for general parameter matching, but adequate here as the value will be rejected anyway unless it matches one of the encoding names defined above   
 �
!
!x   s l o p p y   n o n - R F C 1 3 4 1   p a t t e r n   n o t   a p p r o p r i a t e   f o r   g e n e r a l   p a r a m e t e r   m a t c h i n g ,   b u t   a d e q u a t e   h e r e   a s   t h e   v a l u e   w i l l   b e   r e j e c t e d   a n y w a y   u n l e s s   i t   m a t c h e s   o n e   o f   t h e   e n c o d i n g   n a m e s   d e f i n e d   a b o v e
 
"
#
" r    
$
%
$ n   
&
'
& I    �?
(�>�? F0 !firstmatchinstring_options_range_ !firstMatchInString_options_range_
( 
)
*
) o    �=�= "0 asoccontenttype asocContentType
* 
+
,
+ m    �<�<  
, 
-�;
- J    
.
. 
/
0
/ m    �:�:  
0 
1�9
1 n   
2
3
2 I    �8�7�6�8 
0 length  �7  �6  
3 o    �5�5 "0 asoccontenttype asocContentType�9  �;  �>  
' o    �4�4 0 asocpattern asocPattern
% o      �3�3 0 	asocmatch 	asocMatch
# 
4
5
4 Z   +
6
7�2�1
6 =   "
8
9
8 o     �0�0 0 	asocmatch 	asocMatch
9 m     !�/
�/ 
msng
7 L   % '
:
: m   % &�.
�. 
msng�2  �1  
5 
;�-
; L   , :
<
< c   , 9
=
>
= l  , 7
?�,�+
? n  , 7
@
A
@ I   - 7�*
B�)�* *0 substringwithrange_ substringWithRange_
B 
C�(
C l  - 3
D�'�&
D n  - 3
E
F
E I   . 3�%
G�$�% 0 rangeatindex_ rangeAtIndex_
G 
H�#
H m   . /�"�" �#  �$  
F o   - .�!�! 0 	asocmatch 	asocMatch�'  �&  �(  �)  
A o   , -� �  "0 asoccontenttype asocContentType�,  �+  
> m   7 8�
� 
ctxt�-  
 
I
J
I l     ����  �  �  
J 
K
L
K l     ����  �  �  
L 
M
N
M i  � �
O
P
O I      �
Q�� $0 _makehttprequest _makeHTTPRequest
Q 
R
S
R o      �� 0 theurl theURL
S 
T
U
T o      �� 0 
httpmethod 
httpMethod
U 
V
W
V o      ��  0 requestheaders requestHeaders
W 
X
Y
X o      �� 0 requestbody requestBody
Y 
Z�
Z o      �� $0 timeoutinseconds timeoutInSeconds�  �  
P P    }
[
\
]
[ k   |
^
^ 
_
`
_ l   �
a
b�  
a   build HTTP request   
b �
c
c &   b u i l d   H T T P   r e q u e s t
` 
d
e
d r    
f
g
f n   
h
i
h I    �
j�� "0 requestwithurl_ requestWithURL_
j 
k�
k l   
l��
l n   
m
n
m I    �

o�	�
 $0 asnsurlparameter asNSURLParameter
o 
p
q
p o    �� 0 theurl theURL
q 
r�
r m    
s
s �
t
t  t o�  �	  
n o    �� 0 _support  �  �  �  �  
i n   
u
v
u o    �� *0 nsmutableurlrequest NSMutableURLRequest
v m    �
� misccura
g o      �� 0 httprequest httpRequest
e 
w
x
w l   '
y
z
{
y r    '
|
}
| n   %
~

~ I    %�
��� "0 astextparameter asTextParameter
� 
�
�
� o     � �  0 
httpmethod 
httpMethod
� 
���
� m     !
�
� �
�
�  m e t h o d��  �  
 o    ���� 0 _support  
} o      ���� 0 
httpmethod 
httpMethod
z O I TO DO: what if any checks are needed here (e.g. non-empty/invalid chars)   
{ �
�
� �   T O   D O :   w h a t   i f   a n y   c h e c k s   a r e   n e e d e d   h e r e   ( e . g .   n o n - e m p t y / i n v a l i d   c h a r s )
x 
�
�
� n  ( .
�
�
� I   ) .��
�����  0 sethttpmethod_ setHTTPMethod_
� 
���
� o   ) *���� 0 
httpmethod 
httpMethod��  ��  
� o   ( )���� 0 httprequest httpRequest
� 
�
�
� l  / ?
�
�
�
� Z  / ?
�
�����
� >  / 2
�
�
� o   / 0���� $0 timeoutinseconds timeoutInSeconds
� m   0 1��
�� 
msng
� n  5 ;
�
�
� I   6 ;��
����� *0 settimeoutinterval_ setTimeoutInterval_
� 
���
� o   6 7���� $0 timeoutinseconds timeoutInSeconds��  ��  
� o   5 6���� 0 httprequest httpRequest��  ��  
� � � If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out.   
� �
�
�   I f   d u r i n g   a   c o n n e c t i o n   a t t e m p t   t h e   r e q u e s t   r e m a i n s   i d l e   f o r   l o n g e r   t h a n   t h e   t i m e o u t   i n t e r v a l ,   t h e   r e q u e s t   i s   c o n s i d e r e d   t o   h a v e   t i m e d   o u t .
� 
�
�
� l  @ @��
�
���  
� $  add request headers, if given   
� �
�
� <   a d d   r e q u e s t   h e a d e r s ,   i f   g i v e n
� 
�
�
� Z   @%
�
�����
� >  @ C
�
�
� o   @ A����  0 requestheaders requestHeaders
� m   A B��
�� 
msng
� X   F!
���
�
� k   `
�
� 
�
�
� Q   ` �
�
�
�
� k   c �
�
� 
�
�
� r   c n
�
�
� c   c l
�
�
� n  c h
�
�
� 1   d h��
�� 
pcnt
� o   c d���� 0 aref aRef
� m   h k��
�� 
reco
� o      ���� 0 headerrecord headerRecord
� 
�
�
� l  o �
�
�
�
� Z  o �
�
�����
� >   o z
�
�
� l  o x
�����
� I  o x��
�
�
�� .corecnte****       ****
� o   o p���� 0 headerrecord headerRecord
� ��
���
�� 
kocl
� m   q t��
�� 
ctxt��  ��  ��  
� m   x y���� 
� R   } �����
�
�� .ascrerr ****      � ****��  
� ��
���
�� 
errn
� m   � ������Y��  ��  ��  
� note: requiring text values here avoids any risk of numbers being accidentally coerced to inappropriate localized representations (e.g. "1,0" instead of "1.0"); user should use Number library's `format number` command to convert numbers to non-localized format first   
� �
�
�   n o t e :   r e q u i r i n g   t e x t   v a l u e s   h e r e   a v o i d s   a n y   r i s k   o f   n u m b e r s   b e i n g   a c c i d e n t a l l y   c o e r c e d   t o   i n a p p r o p r i a t e   l o c a l i z e d   r e p r e s e n t a t i o n s   ( e . g .   " 1 , 0 "   i n s t e a d   o f   " 1 . 0 " ) ;   u s e r   s h o u l d   u s e   N u m b e r   l i b r a r y ' s   ` f o r m a t   n u m b e r `   c o m m a n d   t o   c o n v e r t   n u m b e r s   t o   n o n - l o c a l i z e d   f o r m a t   f i r s t
� 
���
� r   � �
�
�
� J   � �
�
� 
�
�
� n  � �
�
�
� o   � ����� 0 
headername 
headerName
� o   � ����� 0 headerrecord headerRecord
� 
���
� n  � �
�
�
� o   � ����� 0 headervalue headerValue
� o   � ����� 0 headerrecord headerRecord��  
� J      
�
� 
�
�
� o      ���� 0 
headername 
headerName
� 
���
� o      ���� 0 headervalue headerValue��  ��  
� R      ��
�
�
�� .ascrerr ****      � ****
� o      ���� 0 etext eText
� ��
�
�
�� 
errn
� o      ���� 0 enum eNum
� ��
�
�
�� 
erob
� o      ���� 0 efrom eFrom
� ��
���
�� 
errt
� o      ���� 
0 eto eTo��  
� k   � �
�
� 
�
�
� Z  � �
�
�����
� H   � �
�
� E  � �
�
�
� J   � �
�
� 
�
�
� m   � ������\
� 
�
�
� m   � ������Y
� 
���
� m   � ������@��  
� J   � �
�
� 
���
� o   � ����� 0 enum eNum��  
� R   � ���
�
�
�� .ascrerr ****      � ****
� o   � ����� 0 etext eText
� ��
�
�
�� 
errn
� o   � ����� 0 enum eNum
� ��
�
�
�� 
erob
� o   � ����� 0 efrom eFrom
� ��
���
�� 
errt
� o   � ����� 
0 eto eTo��  ��  ��  
� 
���
� n  � �
�
�
� I   � ���
����� .0 throwinvalidparameter throwInvalidParameter
� 
�
�
� o   � ����� 0 aref aRef
� 
�
�
� m   � �
�
� �
�
�  h e a d e r s
� 
�
�
� m   � ���
�� 
list
�  ��  m   � � � P N o t   a   l i s t   o f   v a l i d   H T T P   h e a d e r   r e c o r d s .��  ��  
� o   � ����� 0 _support  ��  
�  Z   ����� E  � � o   � ����� "0 _excludeheaders _excludeHeaders o   � ����� 0 
headername 
headerName n  �	
	 I   ������� .0 throwinvalidparameter throwInvalidParameter  o   � ����� 0 aref aRef  m   � �  h e a d e r s  m  ��
�� 
list �� b  
 m   � � T h e   f o l l o w i n g   h e a d e r   i s   n o t   a l l o w e d   i n   t h e   h e a d e r s   l i s t   a s   i t   i s   a l r e a d y   s e t   a u t o m a t i c a l l y :   o  	���� 0 
headername 
headerName��  ��  
 o   � ����� 0 _support  ��  ��   �� l  l ���� n  I  �� ���� <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_  !"! o  ���� 0 headervalue headerValue" #��# o  ���� 0 
headername 
headerName��  ��   o  ���� 0 httprequest httpRequest��  ��   ` Z TO DO: does NSHTTPRequest sanitize these inputs; if not, how should they be treated here?    �$$ �   T O   D O :   d o e s   N S H T T P R e q u e s t   s a n i t i z e   t h e s e   i n p u t s ;   i f   n o t ,   h o w   s h o u l d   t h e y   b e   t r e a t e d   h e r e ?��  �� 0 aref aRef
� n  I T%&% I   N T��'���� "0 aslistparameter asListParameter' ()( o   N O����  0 requestheaders requestHeaders) *��* m   O P++ �,,  h e a d e r s��  ��  & o   I N���� 0 _support  ��  ��  
� -.- l &&��/0��  /   add request body   0 �11 "   a d d   r e q u e s t   b o d y. 232 Z  &y45����4 > &)676 o  &'���� 0 requestbody requestBody7 m  '(��
�� 
msng5 l ,u89:8 Z  ,u;<=>; =  ,9?@? l ,7A����A I ,7��BC
�� .corecnte****       ****B J  ,/DD E��E o  ,-���� 0 requestbody requestBody��  C ��F��
�� 
koclF m  03��
�� 
ctxt��  ��  ��  @ m  78���� < l <GHIG k  <JJ KLK l <<��MN��  M x r if user supplies "Content-Type" header, parse its `charset` param if it has one to determine text encoding to use   N �OO �   i f   u s e r   s u p p l i e s   " C o n t e n t - T y p e "   h e a d e r ,   p a r s e   i t s   ` c h a r s e t `   p a r a m   i f   i t   h a s   o n e   t o   d e t e r m i n e   t e x t   e n c o d i n g   t o   u s eL PQP r  <FRSR n <DTUT I  =D��V���� 40 valueforhttpheaderfield_ valueForHTTPHeaderField_V W��W m  =@XX �YY  C o n t e n t - T y p e��  ��  U o  <=���� 0 httprequest httpRequestS o      �� 0 contenttype contentTypeQ Z[Z Z  G�\]�~^\ = GJ_`_ o  GH�}�} 0 contenttype contentType` m  HI�|
�| 
msng] l M^abca k  M^dd efe n MXghg I  NX�{i�z�{ <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_i jkj m  NQll �mm 0 t e x t / p l a i n ; c h a r s e t = u t f - 8k n�yn m  QToo �pp  C o n t e n t - T y p e�y  �z  h o  MN�x�x 0 httprequest httpRequestf q�wq r  Y^rsr o  YZ�v�v ,0 nsutf8stringencoding NSUTF8StringEncodings o      �u�u *0 requestbodyencoding requestBodyEncoding�w  b 0 * encode text-based body as UTF8 by default   c �tt T   e n c o d e   t e x t - b a s e d   b o d y   a s   U T F 8   b y   d e f a u l t�~  ^ l a�uvwu k  a�xx yzy r  at{|{ I  ap�t}�s�t 0 _parsecharset _parseCharset} ~�r~ n bl� I  gl�q��p�q 0 
asnsstring 
asNSString� ��o� o  gh�n�n 0 contenttype contentType�o  �p  � o  bg�m�m 0 _support  �r  �s  | o      �l�l 0 charsetname charsetNamez ��k� Z  u����j�� = uz��� o  ux�i�i 0 charsetname charsetName� m  xy�h
�h 
msng� l }����� k  }��� ��� n }���� I  ~��g��f�g <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_� ��� l ~���e�d� b  ~���� o  ~�c�c 0 contenttype contentType� m  ��� ���  ; c h a r s e t = u t f - 8�e  �d  � ��b� m  ���� ���  C o n t e n t - T y p e�b  �f  � o  }~�a�a 0 httprequest httpRequest� ��`� r  ����� o  ���_�_ ,0 nsutf8stringencoding NSUTF8StringEncoding� o      �^�^ *0 requestbodyencoding requestBodyEncoding�`  � Q K if Content-Type doesn't include charset parameter then use UTF8 by default   � ��� �   i f   C o n t e n t - T y p e   d o e s n ' t   i n c l u d e   c h a r s e t   p a r a m e t e r   t h e n   u s e   U T F 8   b y   d e f a u l t�j  � l ������ k  ���� ��� r  ����� n ����� I  ���]��\�] 0 getencoding getEncoding� ��[� o  ���Z�Z 0 charsetname charsetName�[  �\  � o  ���Y�Y (0 _nsstringencodings _NSStringEncodings� o      �X�X *0 requestbodyencoding requestBodyEncoding� ��W� Z  �����V�U� = ����� o  ���T�T *0 requestbodyencoding requestBodyEncoding� m  ���S
�S 
msng� n ����� I  ���R��Q�R .0 throwinvalidparameter throwInvalidParameter� ��� o  ���P�P  0 requestheaders requestHeaders� ��� m  ���� ���  h e a d e r s� ��� m  ���O
�O 
list� ��N� m  ���� ���n T h e   C o n t e n t - T y p e   h e a d e r   s p e c i f i e s   a   c h a r s e t   t h a t   c a n n o t   b e   a u t o m a t i c a l l y   e n c o d e d   b y   t h i s   h a n d l e r   ( e . g .   u s e   a   d i f f e r e n t   c h a r s e t   o r   s u p p l y   t h e   r e q u e s t   b o d y   a s   a n   N S D a t a   o b j e c t   i n s t e a d ) .�N  �Q  � o  ���M�M 0 _support  �V  �U  �W  � � � automatically encode the body text using the specified charset (assuming it's one directly recognized by NSString's dataUsingEncoding: method)   � ���   a u t o m a t i c a l l y   e n c o d e   t h e   b o d y   t e x t   u s i n g   t h e   s p e c i f i e d   c h a r s e t   ( a s s u m i n g   i t ' s   o n e   d i r e c t l y   r e c o g n i z e d   b y   N S S t r i n g ' s   d a t a U s i n g E n c o d i n g :   m e t h o d )�k  v V P user has specified Content-Type for body (e.g. "application/json;charset=utf8")   w ��� �   u s e r   h a s   s p e c i f i e d   C o n t e n t - T y p e   f o r   b o d y   ( e . g .   " a p p l i c a t i o n / j s o n ; c h a r s e t = u t f 8 " )[ ��� r  ����� n ����� I  ���L��K�L (0 datausingencoding_ dataUsingEncoding_� ��J� o  ���I�I *0 requestbodyencoding requestBodyEncoding�J  �K  � n ����� I  ���H��G�H 0 
asnsstring 
asNSString� ��F� o  ���E�E 0 requestbody requestBody�F  �G  � o  ���D�D 0 _support  � o      �C�C 0 bodydata bodyData� ��� Z  ����B�A� = ����� o  ���@�@ 0 bodydata bodyData� m  ���?
�? 
msng� n � ��� I  � �>��=�> .0 throwinvalidparameter throwInvalidParameter� ��� o  ���<�<  0 requestheaders requestHeaders� ��� m  ���� ���  b o d y� ��� J  ���� ��� m  ���;
�; 
ctxt� ��:� m  ���9
�9 
ocid�:  � ��8� b  ����� m  ���� ��� � C a n  t   e n c o d e   t h e   g i v e n   t e x t   u s i n g   t h e   c h a r s e t   s p e c i f i e d   b y   t h e   C o n t e n t - T y p e   h e a d e r :  � o  ���7�7 0 contenttype contentType�8  �=  � o  ���6�6 0 _support  �B  �A  � ��5� n ��� I  �4��3�4 0 sethttpbody_ setHTTPBody_� ��2� o  	�1�1 0 bodydata bodyData�2  �3  � o  �0�0 0 httprequest httpRequest�5  H �  given a text value to use as the request body, encode it using rgw xhEAWR specified by the user-supplied Content-Type, if any,   I ��� �   g i v e n   a   t e x t   v a l u e   t o   u s e   a s   t h e   r e q u e s t   b o d y ,   e n c o d e   i t   u s i n g   r g w   x h E A W R   s p e c i f i e d   b y   t h e   u s e r - s u p p l i e d   C o n t e n t - T y p e ,   i f   a n y ,= ��� F  2��� n ��� I  �/��.�/ &0 checktypeforvalue checkTypeForValue� ��� o  �-�- 0 requestbody requestBody� ��,� m  �+
�+ 
ocid�,  �.  � o  �*�* 0 _support  � l  .��)�(� n  .��� I  !.�'��&�' &0 isinstanceoftype_ isInstanceOfType_� ��%� l !*��$�#� n !*��� I  &*�"�!� �" 	0 class  �!  �   � n !&� � o  "&�� 0 nsdata NSData  m  !"�
� misccura�$  �#  �%  �&  � o   !�� 0 requestbody requestBody�)  �(  � � k  5X  l 55��   � � also accept NSData, allowing users to do their own encoding/decoding; users should supply appropriate Content-Type header themselves    �
   a l s o   a c c e p t   N S D a t a ,   a l l o w i n g   u s e r s   t o   d o   t h e i r   o w n   e n c o d i n g / d e c o d i n g ;   u s e r s   s h o u l d   s u p p l y   a p p r o p r i a t e   C o n t e n t - T y p e   h e a d e r   t h e m s e l v e s 	 n 5;

 I  6;��� 0 sethttpbody_ setHTTPBody_ � o  67�� 0 requestbody requestBody�  �   o  56�� 0 httprequest httpRequest	 � Z  <X�� n <F I  =F��� 40 valueforhttpheaderfield_ valueForHTTPHeaderField_ � l =B�� = =B m  =@ �  C o n t e n t - T y p e m  @A�
� 
msng�  �  �  �   o  <=�� 0 httprequest httpRequest l IT n IT I  JT��
� <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_  !  m  JM"" �## 0 a p p l i c a t i o n / o c t e t - s t r e a m! $�	$ m  MP%% �&&  C o n t e n t - T y p e�	  �
   o  IJ�� 0 httprequest httpRequest   arbitrary binary data    �'' ,   a r b i t r a r y   b i n a r y   d a t a�  �  �  �  > n [u()( I  `u�*�� .0 throwinvalidparameter throwInvalidParameter* +,+ o  `a�� 0 requestbody requestBody, -.- m  ad// �00  b o d y. 121 J  dl33 454 m  dg�
� 
ctxt5 6�6 m  gj�
� 
ocid�  2 7�7 m  lo88 �99 8 N o t   a   t e x t   o r   N S D a t a   o b j e c t .�  �  ) o  [`� �  0 _support  9 V P requestBody may be supplied as text or NSData -- TO DO: what about file object?   : �:: �   r e q u e s t B o d y   m a y   b e   s u p p l i e d   a s   t e x t   o r   N S D a t a   - -   T O   D O :   w h a t   a b o u t   f i l e   o b j e c t ?��  ��  3 ;��; L  z|<< o  z{���� 0 httprequest httpRequest��  
\ ��=
�� consdiac= ��>
�� conshyph> ��?
�� conspunc? ����
�� conswhit��  
] ��@
�� conscase@ ����
�� consnume��  
N ABA l     ��������  ��  ��  B CDC l     ��������  ��  ��  D EFE i  � �GHG I      ��I���� *0 _unpackhttpresponse _unpackHTTPResponseI JKJ o      ���� 0 httpresponse httpResponseK LML o      ���� $0 responsebodytype responseBodyTypeM N��N o      ���� $0 responsebodydata responseBodyData��  ��  H k     �OO PQP r     RSR J     ����  S o      ���� 0 headerfields headerFieldsQ TUT r    VWV n   
XYX I    
�������� "0 allheaderfields allHeaderFields��  ��  Y o    ���� 0 httpresponse httpResponseW o      ���� $0 asocheaderfields asocHeaderFieldsU Z[Z r    \]\ n   ^_^ I    �������� 0 allkeys allKeys��  ��  _ o    ���� $0 asocheaderfields asocHeaderFields] o      ���� 0 
headerkeys 
headerKeys[ `a` Y    Eb��cd��b k   % @ee fgf r   % -hih l  % +j����j n  % +klk I   & +��m����  0 objectatindex_ objectAtIndex_m n��n o   & '���� 0 i  ��  ��  l o   % &���� 0 
headerkeys 
headerKeys��  ��  i o      ���� 0 asockey asocKeyg o��o r   . @pqp K   . =rr ��st�� 0 
headername 
headerNames c   / 2uvu o   / 0���� 0 asockey asocKeyv m   0 1��
�� 
ctxtt ��w���� 0 headervalue headerValuew c   3 ;xyx l  3 9z����z n  3 9{|{ I   4 9��}���� 0 objectforkey_ objectForKey_} ~��~ o   4 5���� 0 asockey asocKey��  ��  | o   3 4���� $0 asocheaderfields asocHeaderFields��  ��  y m   9 :��
�� 
****��  q n      �  ;   > ?� o   = >���� 0 headerfields headerFields��  �� 0 i  c m    ����  d \     ��� l   ������ n   ��� I    �������� 	0 count  ��  ��  � o    ���� $0 asocheaderfields asocHeaderFields��  ��  � m    ���� ��  a ��� Z   F ������ =  F I��� o   F G���� $0 responsebodytype responseBodyType� m   G H��
�� 
ctxt� k   L ��� ��� r   L O��� m   L M��
�� 
msng� o      ���� ,0 responsebodyencoding responseBodyEncoding� ��� r   P X��� n  P V��� I   Q V������� 0 objectforkey_ objectForKey_� ���� m   Q R�� ���  C o n t e n t - T y p e��  ��  � o   P Q���� $0 asocheaderfields asocHeaderFields� o      ���� "0 asoccontenttype asocContentType� ��� Z  Y t������� >  Y \��� o   Y Z���� "0 asoccontenttype asocContentType� m   Z [��
�� 
msng� r   _ p��� n  _ n��� I   d n������� 0 getencoding getEncoding� ���� I   d j������� 0 _parsecharset _parseCharset� ���� o   e f���� "0 asoccontenttype asocContentType��  ��  ��  ��  � o   _ d���� (0 _nsstringencodings _NSStringEncodings� o      ���� ,0 responsebodyencoding responseBodyEncoding��  ��  � ��� Z   u �������� =  u x��� o   u v���� ,0 responsebodyencoding responseBodyEncoding� m   v w��
�� 
msng� R   { �����
�� .ascrerr ****      � ****� m    ��� ��� � C a n ' t   a u t o m a t i c a l l y   d e c o d e   H T T P   r e s p o n s e   a s   t e x t   a s   i t   d i d n ' t   s p e c i f y   a   C o n t e n t - T y p e   w i t h   a   s u p p o r t e d   c h a r s e t .� �����
�� 
errn� m   } ~�����\��  ��  ��  � ���� r   � ���� c   � ���� l  � ������� n  � ���� I   � �������� 00 initwithdata_encoding_ initWithData_encoding_� ��� o   � ����� $0 responsebodydata responseBodyData� ���� o   � ����� ,0 responsebodyencoding responseBodyEncoding��  ��  � n  � ���� I   � ��������� 	0 alloc  ��  ��  � n  � ���� o   � ����� 0 nsstring NSString� m   � ���
�� misccura��  ��  � m   � ���
�� 
ctxt� o      ���� 0 responsebody responseBody��  � ��� =  � ���� o   � ����� $0 responsebodytype responseBodyType� m   � ���
�� 
rdat� ��� l  � ����� r   � ���� n  � ���� I   � ��������� 0 copy  ��  ��  � o   � ����� $0 responsebodydata responseBodyData� o      ���� 0 responsebody responseBody�   return NSData   � ���    r e t u r n   N S D a t a� ��� =  � ���� o   � ����� $0 responsebodytype responseBodyType� m   � ���
�� 
msng� ���� r   � ���� m   � ���
�� 
msng� o      ���� 0 responsebody responseBody��  � n  � ���� I   � �������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ����� $0 responsebodytype responseBodyType� ���� m   � ��� ���  r e t u r n i n g��  ��  � o   � ��� 0 _support  � ��~� L   � ��� K   � ��� �}���} 0 
statuscode 
statusCode� n  � ���� I   � ��|�{�z�| 0 
statuscode 
statusCode�{  �z  � o   � ��y�y 0 httpresponse httpResponse� �x���x "0 responseheaders responseHeaders� o   � ��w�w 0 headerfields headerFields� �v��u�v 0 responsebody responseBody� o   � ��t�t 0 responsebody responseBody�u  �~  F ��� l     �s�r�q�s  �r  �q  � ��� l     �p�o�n�p  �o  �n  � ��� l     �m���m  �  -----   � ��� 
 - - - - -� ��� l     �l�k�j�l  �k  �j  � ��� i  � ���� I     �i�h�
�i .Web:ReqHnull��� ��� null�h  � �g��
�g 
Dest� o      �f�f 0 theurl theURL� �e� 
�e 
Meth� |�d�c�b�d  �c   o      �a�a 0 
httpmethod 
httpMethod�b   l     �`�_ m       �  G E T�`  �_    �^
�^ 
Head |�]�\�[	�]  �\   o      �Z�Z  0 requestheaders requestHeaders�[  	 J      �Y�Y   �X

�X 
Body
 |�W�V�U�W  �V   o      �T�T 0 requestbody requestBody�U   l     �S�R m      �Q
�Q 
msng�S  �R   �P
�P 
TimO |�O�N�M�O  �N   o      �L�L $0 timeoutinseconds timeoutInSeconds�M   l     �K�J m      �I
�I 
msng�K  �J   �H�G
�H 
Type |�F�E�D�F  �E   o      �C�C $0 responsebodytype responseBodyType�D   l     �B�A m      �@
�@ 
ctxt�B  �A  �G  � l   / Q    / k      Z    !"�?�>! >   #$# o    �=�= $0 timeoutinseconds timeoutInSeconds$ m    �<
�< 
msng" r   	 %&% n  	 '(' I    �;)�:�; (0 asintegerparameter asIntegerParameter) *+* o    �9�9 $0 timeoutinseconds timeoutInSeconds+ ,�8, m    -- �..  t i m e o u t�8  �:  ( o   	 �7�7 0 _support  & o      �6�6 $0 timeoutinseconds timeoutInSeconds�?  �>    /0/ r    '121 I    %�53�4�5 $0 _makehttprequest _makeHTTPRequest3 454 o    �3�3 0 theurl theURL5 676 o    �2�2 0 
httpmethod 
httpMethod7 898 o    �1�1  0 requestheaders requestHeaders9 :;: o     �0�0 0 requestbody requestBody; <�/< o     !�.�. $0 timeoutinseconds timeoutInSeconds�/  �4  2 o      �-�- 0 httprequest httpRequest0 =>= r   ( 1?@? n  ( /ABA I   + /�,�+�*�, >0 ephemeralsessionconfiguration ephemeralSessionConfiguration�+  �*  B n  ( +CDC o   ) +�)�) 60 nsurlsessionconfiguration NSURLSessionConfigurationD m   ( )�(
�( misccura@ o      �'�' 0 sessionconfig sessionConfig> EFE l  2 BGHIG Z  2 BJK�&�%J >  2 5LML o   2 3�$�$ $0 timeoutinseconds timeoutInSecondsM m   3 4�#
�# 
msngK n  8 >NON I   9 >�"P�!�" >0 settimeoutintervalforrequest_ setTimeoutIntervalForRequest_P Q� Q o   9 :�� $0 timeoutinseconds timeoutInSeconds�   �!  O o   8 9�� 0 sessionconfig sessionConfig�&  �%  H g a controls how long (in seconds) a task should wait for additional data to arrive before giving up   I �RR �   c o n t r o l s   h o w   l o n g   ( i n   s e c o n d s )   a   t a s k   s h o u l d   w a i t   f o r   a d d i t i o n a l   d a t a   t o   a r r i v e   b e f o r e   g i v i n g   u pF STS Z   C xUV�WU =  C FXYX o   C D�� $0 responsebodytype responseBodyTypeY m   D E�
� 
msngV k   I WZZ [\[ r   I S]^] n  I Q_`_ I   L Q�a�� 60 sessionwithconfiguration_ sessionWithConfiguration_a b�b o   L M�� 0 sessionconfig sessionConfig�  �  ` n  I Lcdc o   J L�� 0 nsurlsession NSURLSessiond m   I J�
� misccura^ o      �� 0 asocsession asocSession\ e�e r   T Wfgf m   T U�
� 
msngg o      �� $0 responsebodydata responseBodyData�  �  W k   Z xhh iji r   Z cklk n  Z amnm I   ] a���� 0 data  �  �  n n  Z ]opo o   [ ]�� 0 nsmutabledata NSMutableDatap m   Z [�
� misccural o      �� $0 responsebodydata responseBodyDataj qrq h   d k�
s�
 *0 sessiontaskdelegate sessionTaskDelegates i     tut I      �	v��	 J0 #urlsession_datatask_didreceivedata_ #URLSession_dataTask_didReceiveData_v wxw o      �� 0 asocsession asocSessionx yzy o      �� 0 asoctask asocTaskz {�{ o      �� 0 asocdata asocData�  �  u n    
|}| I    
�~�� 0 appenddata_ appendData_~ � o    � �  0 asocdata asocData�  �  } o     ���� $0 responsebodydata responseBodyDatar ���� r   l x��� n  l v��� I   o v������� d0 0sessionwithconfiguration_delegate_delegatequeue_ 0sessionWithConfiguration_delegate_delegateQueue_� ��� o   o p���� 0 sessionconfig sessionConfig� ��� o   p q���� *0 sessiontaskdelegate sessionTaskDelegate� ���� l  q r������ m   q r��
�� 
msng��  ��  ��  ��  � n  l o��� o   m o���� 0 nsurlsession NSURLSession� m   l m��
�� misccura� o      ���� 0 asocsession asocSession��  T ��� r   y ���� n  y ��� I   z ������� ,0 datataskwithrequest_ dataTaskWithRequest_� ���� o   z {���� 0 httprequest httpRequest��  ��  � o   y z���� 0 asocsession asocSession� o      ���� 0 asoctask asocTask� ��� n  � ���� I   � ��������� 
0 resume  ��  ��  � o   � ����� 0 asoctask asocTask� ��� l  � �������  � block until completed/failed; TO DO: can user cancel during this loop? (if so, does anything need to be done with error -128? e.g. catch, call cancel, then rethrow) If not, having task periodically call back into delegate while waiting may give AS a chance to cancel.   � ���   b l o c k   u n t i l   c o m p l e t e d / f a i l e d ;   T O   D O :   c a n   u s e r   c a n c e l   d u r i n g   t h i s   l o o p ?   ( i f   s o ,   d o e s   a n y t h i n g   n e e d   t o   b e   d o n e   w i t h   e r r o r   - 1 2 8 ?   e . g .   c a t c h ,   c a l l   c a n c e l ,   t h e n   r e t h r o w )   I f   n o t ,   h a v i n g   t a s k   p e r i o d i c a l l y   c a l l   b a c k   i n t o   d e l e g a t e   w h i l e   w a i t i n g   m a y   g i v e   A S   a   c h a n c e   t o   c a n c e l .� ��� V   � ���� l  � ����� n  � ���� I   � �������� .0 sleepfortimeinterval_ sleepForTimeInterval_� ���� m   � ��� ?���������  ��  � n  � ���� o   � ����� 0 nsthread NSThread� m   � ���
�� misccura�   sleep for 0.1sec   � ��� "   s l e e p   f o r   0 . 1 s e c� =  � ���� n  � ���� I   � ��������� 	0 state  ��  ��  � o   � ����� 0 asoctask asocTask� n  � ���� o   � ����� <0 nsurlsessiontaskstaterunning NSURLSessionTaskStateRunning� m   � ���
�� misccura� ��� Z   � �������� =  � ���� n  � ���� I   � ��������� 	0 state  ��  ��  � o   � ����� 0 asoctask asocTask� n  � ���� o   � ����� @0 nsurlsessiontaskstatesuspended NSURLSessionTaskStateSuspended� m   � ���
�� misccura� l  � ����� n  � ���� I   � ��������� 
0 cancel  ��  ��  � o   � ����� 0 asoctask asocTask� D > sanity check (shouldn't be possible for task to be suspended)   � ��� |   s a n i t y   c h e c k   ( s h o u l d n ' t   b e   p o s s i b l e   f o r   t a s k   t o   b e   s u s p e n d e d )��  ��  � ��� Z   � �������� =  � ���� n  � ���� I   � ��������� 	0 state  ��  ��  � o   � ����� 0 asoctask asocTask� n  � ���� o   � ����� @0 nsurlsessiontaskstatecanceling NSURLSessionTaskStateCanceling� m   � ���
�� misccura� l  � ����� R   � ������
�� .ascrerr ****      � ****��  � �����
�� 
errn� m   � ���������  � * $ TO DO: does Cmd-period cancel task?   � ��� H   T O   D O :   d o e s   C m d - p e r i o d   c a n c e l   t a s k ?��  ��  � ��� r   � ���� n  � ���� I   � ��������� 	0 error  ��  ��  � o   � ����� 0 asoctask asocTask� o      ���� 0 	taskerror 	taskError� ��� Z   �������� >  � ���� o   � ����� 0 	taskerror 	taskError� m   � ���
�� 
msng� R   �����
�� .ascrerr ****      � ****� l  ������� c   ���� n  ���� I   ��������� ,0 localizeddescription localizedDescription��  ��  � o   � ����� 0 	taskerror 	taskError� m  ��
�� 
ctxt��  ��  � ����
�� 
errn� n  � ���� I   � ��������� 0 code  ��  ��  � o   � ����� 0 	taskerror 	taskError� �����
�� 
erob� o   � ����� 0 theurl theURL��  ��  ��  � ���� L  �� I  ������� *0 _unpackhttpresponse _unpackHTTPResponse� ��� n ��� I  �������� 0 response  ��  ��  � o  ���� 0 asoctask asocTask� ��� o  ���� $0 responsebodytype responseBodyType� ���� o  ���� $0 responsebodydata responseBodyData��  ��  ��   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I  !/������� 
0 _error  � ��� m  "%   � " s e n d   H T T P   r e q u e s t�  o  %&���� 0 etext eText  o  &'���� 0 enumber eNumber  o  '(���� 0 efrom eFrom �� o  (+���� 
0 eto eTo��  ��   ` Z TO DO: make URL direct param (can't think of any situation where it'd be a script object)    �		 �   T O   D O :   m a k e   U R L   d i r e c t   p a r a m   ( c a n ' t   t h i n k   o f   a n y   s i t u a t i o n   w h e r e   i t ' d   b e   a   s c r i p t   o b j e c t )� 

 l     ��������  ��  ��    l     ��������  ��  ��    l     ��������  ��  ��    l     ��������  ��  ��    l     ��������  ��  ��    i  � � I     ����
�� .Web:DStCnull���     long o      �� 0 
statuscode 
statusCode��   Q     . k      r      n   !"! I    �~#�}�~ (0 asintegerparameter asIntegerParameter# $%$ o    	�|�| 0 
statuscode 
statusCode% &�{& m   	 
'' �((  �{  �}  " o    �z�z 0 _support    o      �y�y 0 
statuscode 
statusCode )�x) L    ** c    +,+ l   -�w�v- n   ./. I    �u0�t�u >0 localizedstringforstatuscode_ localizedStringForStatusCode_0 1�s1 o    �r�r 0 
statuscode 
statusCode�s  �t  / n   232 o    �q�q &0 nshttpurlresponse NSHTTPURLResponse3 m    �p
�p misccura�w  �v  , m    �o
�o 
ctxt�x   R      �n45
�n .ascrerr ****      � ****4 o      �m�m 0 etext eText5 �l67
�l 
errn6 o      �k�k 0 enumber eNumber7 �j89
�j 
erob8 o      �i�i 0 efrom eFrom9 �h:�g
�h 
errt: o      �f�f 
0 eto eTo�g   I   $ .�e;�d�e 
0 _error  ; <=< m   % &>> �??   H T T P   s t a t u s   n a m e= @A@ o   & '�c�c 0 etext eTextA BCB o   ' (�b�b 0 enumber eNumberC DED o   ( )�a�a 0 efrom eFromE F�`F o   ) *�_�_ 
0 eto eTo�`  �d   GHG l     �^�]�\�^  �]  �\  H I�[I l     �Z�Y�X�Z  �Y  �X  �[       �WJKLMNOPQR"STUVWXYZ[\]^_`ab�W  J �V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>
�V 
pimr�U 0 _support  �T 
0 _error  �S 0 _usesnetloc _usesNetLoc�R 0 _ascomponent _asComponent�Q ,0 _joinnetworklocation _joinNetworkLocation
�P .Web:SplUnull���     ctxt
�O .Web:JoiUnull���     WebC�N "0 _safecharacters _safeCharacters�M 0 _replacetext _replaceText
�L .Web:EscUnull���     ctxt
�K .Web:UneUnull���     ctxt
�J .Web:SplQnull���     ctxt
�I .Web:JoiQnull���     ****
�H .Web:FJSNnull���     ****
�G .Web:PJSNnull���     ctxt
�F .Web:FB64null���     ctxt
�E .Web:PB64null���     ctxt�D "0 _excludeheaders _excludeHeaders�C (0 _nsstringencodings _NSStringEncodings�B 0 _parsecharset _parseCharset�A $0 _makehttprequest _makeHTTPRequest�@ *0 _unpackhttpresponse _unpackHTTPResponse
�? .Web:ReqHnull��� ��� null
�> .Web:DStCnull���     longK �=c�= c  dd �<e�;
�< 
cobje ff   �: 
�: 
frmk�;  L gg   �9 *
�9 
scptM �8 4�7�6hi�5�8 
0 _error  �7 �4j�4 j  �3�2�1�0�/�3 0 handlername handlerName�2 0 etext eText�1 0 enumber eNumber�0 0 efrom eFrom�/ 
0 eto eTo�6  h �.�-�,�+�*�. 0 handlername handlerName�- 0 etext eText�, 0 enumber eNumber�+ 0 efrom eFrom�* 
0 eto eToi  D�)�(�) �( &0 throwcommanderror throwCommandError�5 b  ࠡ����+ N �'k�' k   j n r v z ~ � � � � � � � � � � � � � � � � �O �& ��%�$lm�#�& 0 _ascomponent _asComponent�% �"n�" n  �!�! 0 
asocstring 
asocString�$  l � �  0 
asocstring 
asocStringm � ��
� 
msng
� 
ctxt�# ��  �Y hO��&P � ���op�� ,0 _joinnetworklocation _joinNetworkLocation� �q� q  �� .0 networklocationrecord networkLocationRecord�  o 	���������� .0 networklocationrecord networkLocationRecord� $0 fullnetlocrecord fullNetLocRecord� 0 urlcomponents urlComponents� 0 aref aRef� 0 	urlrecord 	urlRecord� 0 username userName� 0 userpassword userPassword� 0 hostname hostName� 0 
portnumber 
portNumberp (� �� �� �� ��
�	�������r�� ��*9=AD��F]ems}�������� 0 username userName� 0 userpassword userPassword� 0 hostname hostName� 0 
portnumber 
portNumber�
 �	 60 asoptionalrecordparameter asOptionalRecordParameter� 
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
ctxt�  r ������
�� 
errn���\��  
� 
errn� �Y
�� 
erob
�� 
leng
�� 
bool�%b  �����������m+ 
E�O�[�,\[�,\[�,\[�,\Z�vE�O V�[��l kh  ��,a &��,FW 3X  )a a a ��a a a a a �v��a ,k/%a %[OY��O�E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO�a  �a %�%E�Y hO�a  �a  %E�Y hO�a ! 	 �a " 	 �a # a $&a $& )a a a ��a %Y hO��%E�O�a & �a '%�%E�Y hO�Q �������st��
�� .Web:SplUnull���     ctxt�� 0 urltext urlText�� ��u��
�� 
NeLou {�������� ,0 splitnetworklocation splitNetworkLocation��  
�� boovfals��  s ������������������ 0 urltext urlText�� ,0 splitnetworklocation splitNetworkLocation�� 0 asocurl asocURL�� "0 networklocation networkLocation�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTot ����������������������������������������������������v-������ $0 asnsurlparameter asNSURLParameter�� 0 username userName�� 0 user  �� 0 _ascomponent _asComponent�� 0 userpassword userPassword�� 0 password  �� 0 hostname hostName�� 0 host  �� 0 
portnumber 
portNumber�� 0 port  �� �� (0 asbooleanparameter asBooleanParameter�� ,0 _joinnetworklocation _joinNetworkLocation�� 0 	urlscheme 	urlScheme�� 
0 scheme  �� "0 networklocation networkLocation�� 0 resourcepath resourcePath�� 0 path  �� "0 parameterstring parameterString�� 0 querystring queryString�� 	0 query  �� (0 fragmentidentifier fragmentIdentifier�� 0 fragment  �� �� 0 etext eTextv ����w
�� 
errn�� 0 enumber eNumberw ����x
�� 
erob�� 0 efrom eFromx ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �b  ��l+ E�O�*�j+ k+ �*�j+ k+ �*�j+ k+ �*�j+ 
k+ �E�Ob  ��l+  *�k+ E�Y hO�*�j+ k+ a �a *�j+ k+ a *�j+ k+ a *�j+ k+ a *�j+ k+ a W X  *a ����a + R ��?����yz��
�� .Web:JoiUnull���     WebC�� 0 	urlrecord 	urlRecord�� ��{��
�� 
Base{ {����F�� 0 baseurl baseURL��  ��  y ������������������������������������ 0 	urlrecord 	urlRecord�� 0 baseurl baseURL�� 0 fullurlrecord fullURLRecord�� 0 urlcomponents urlComponents�� 0 aref aRef�� 0 	urlscheme 	urlScheme�� 0 resourcepath resourcePath�� "0 parameterstring parameterString�� 0 querystring queryString�� (0 fragmentidentifier fragmentIdentifier�� "0 networklocation networkLocation�� 0 urltext urlText�� 0 asocurl asocURL�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToz LOP��������s��w��{�����������������������|������������������&��2;��BPU[dow�����������������������������}���
�� 
kocl
�� 
reco
�� .corecnte****       ****�� 0 	urlscheme 	urlScheme�� "0 networklocation networkLocation�� 0 resourcepath resourcePath�� "0 parameterstring parameterString�� 0 querystring queryString�� (0 fragmentidentifier fragmentIdentifier�� �� 60 asoptionalrecordparameter asOptionalRecordParameter�� 
�� 
cobj
�� 
pcnt
�� 
ctxt��  | ������
�� 
errn���\��  
�� 
leng�� �� .0 throwinvalidparameter throwInvalidParameter�� ,0 _joinnetworklocation _joinNetworkLocation
�� 
Safe
�� .Web:EscUnull���     ctxt
�� 
bool�� "0 astextparameter asTextParameter�� $0 asnsurlparameter asNSURLParameter
�� misccura�� 0 nsurl NSURL�� <0 urlwithstring_relativetourl_ URLWithString_relativeToURL_
�� 
msng
�� 
errn���Y
�� 
erob�� 0 etext eText} ����~
�� 
errn�� 0 enumber eNumber~ ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� 
0 _error  ��}f��^�kv��l j�b  ������������a a a m+ E�O�[�,\[�,\[�,\[�,\[�,\Za vE�O f�[�a l kh  �a ,a &�a ,FW =X  b  �a �a a a a a a  a va �a !,k/%a "%a #+ $[OY��O�E[a k/E�Z[a l/E�Z[a m/E�Z[a a #/E�Z[a a /E�ZO��,kv��l j *��,k+ %E�Y ) ��,a &E�W X  b  �a &�a 'a #+ $O�a (a )l *E�O�a +
 &�a ,	 b  �a -&	 �a .a -&a -& /�a /	 �a 0a -& a 1�%E�Y hOa 2�%�%E�Y �E�O�a 3 �a 4%�%E�Y hO�a 5 �a 6%�%E�Y hO�a 7 �a 8%�%E�Y hO�a 9 �a :%�%E�Y hY b  �a ;l+ <E�O�a = Kb  �a >l+ ?E�Oa @a A,��l+ BE�O�a C  )a Da Ea F�a #a GY hO�a &E�Y hO�VW X H I*a J���] a + KS ��+������~�� 0 _replacetext _replaceText�� �}��} �  �|�{�z�| 0 thetext theText�{ 0 fromtext fromText�z 0 totext toText�  � �y�x�w�v�y 0 thetext theText�x 0 fromtext fromText�w 0 totext toText�v 0 thelist theList� �u�t�s�r
�u 
ascr
�t 
txdl
�s 
citm
�r 
ctxt�~ ���,FO��-E�O���,FO��&T �qW�p�o���n
�q .Web:EscUnull���     ctxt�p 0 thetext theText�o �m��l
�m 
Safe� {�k�j^�k &0 allowedcharacters allowedCharacters�j  �l  � �i�h�g�f�e�d�c�b�i 0 thetext theText�h &0 allowedcharacters allowedCharacters�g $0 asocallowedchars asocAllowedChars�f 0 
asocresult 
asocResult�e 0 etext eText�d 0 enumber eNumber�c 0 efrom eFrom�b 
0 eto eTo� n�a|�`�_�^�]�\�[�Z�Y�X�W��V�U���T�S�a "0 astextparameter asTextParameter
�` misccura�_  0 nscharacterset NSCharacterSet�^ J0 #charactersetwithcharactersinstring_ #characterSetWithCharactersInString_�] 0 
asnsstring 
asNSString�\ j0 3stringbyaddingpercentencodingwithallowedcharacters_ 3stringByAddingPercentEncodingWithAllowedCharacters_
�[ 
msng
�Z 
errn�Y�Y
�X 
erob�W 
�V 
ctxt�U 0 etext eText� �R�Q�
�R 
errn�Q 0 enumber eNumber� �P�O�
�P 
erob�O 0 efrom eFrom� �N�M�L
�N 
errt�M 
0 eto eTo�L  �T �S 
0 _error  �n p [b  ��l+ E�Ob  b  ��l+ %E�O��,�k+ E�Ob  �k+ �k+ E�O��  )�����Y hO��&W X  *a ����a + U �K��J�I���H
�K .Web:UneUnull���     ctxt�J 0 thetext theText�I  � �G�F�E�D�C�B�G 0 thetext theText�F 0 
asocresult 
asocResult�E 0 etext eText�D 0 enumber eNumber�C 0 efrom eFrom�B 
0 eto eTo� ��A�@�?�>�=�<�;�:��9�8��7�6�A "0 astextparameter asTextParameter�@ 0 
asnsstring 
asNSString�? B0 stringbyremovingpercentencoding stringByRemovingPercentEncoding
�> 
msng
�= 
errn�<�Y
�; 
erob�: 
�9 
ctxt�8 0 etext eText� �5�4�
�5 
errn�4 0 enumber eNumber� �3�2�
�3 
erob�2 0 efrom eFrom� �1�0�/
�1 
errt�0 
0 eto eTo�/  �7 �6 
0 _error  �H L ;b  ��l+ E�Ob  �k+ j+ E�O��  )�����Y hO��&W X  *������+ V �.�-�,���+
�. .Web:SplQnull���     ctxt�- 0 	querytext 	queryText�,  � 	�*�)�(�'�&�%�$�#�"�* 0 	querytext 	queryText�) 0 oldtids oldTIDs�( 0 	querylist 	queryList�' 0 aref aRef�& 0 
queryparts 
queryParts�% 0 etext eText�$ 0 enumber eNumber�# 0 efrom eFrom�" 
0 eto eTo� !"�!� <�@��G�U���������u������
�! 
ascr
�  
txdl� "0 astextparameter asTextParameter
� 
spac� 0 _replacetext _replaceText
� 
citm
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
leng
� 
errn��Y
� 
erob� 
� .Web:UneUnull���     ctxt� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� �
�	�
�
 
errt�	 
0 eto eTo�  � � 
0 _error  �+ ��� ���,E�O �*b  ��l+ ��m+ E�O���,FO��-E�O���,FO T�[��l kh ��,E�-E�O�a ,l )a a a �a a Y hO��k/j ��l/j lv��,F[OY��O���,FO�W X  ���,FO*a ����a + VW �������
� .Web:JoiQnull���     ****� 0 	querylist 	queryList�  � 	���� ����������� 0 	querylist 	queryList� 0 oldtids oldTIDs� 0 aref aRef�  0 kvpair kvPair�� 0 	querytext 	queryText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��������������������������������������&3��;���_����
�� 
ascr
�� 
txdl�� 0 aslist asList
�� 
cobj
�� 
kocl
�� .corecnte****       ****
�� 
pcnt
�� 
list
�� 
leng
�� 
bool
�� 
errn���Y
�� 
erob�� 
�� 
ctxt
�� 
Safe
�� 
spac
�� .Web:EscUnull���     ctxt�� 0 _replacetext _replaceText�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � ���,E�O �b  ��l+ �-E�O ��[��l kh ��,E�O�kv��l k 	 	��,l �& )������Y hO��a l l  )�����a Y hO*��k/a _ l a %��l/a _ l %_ a m+ ��,F[OY��Oa ��,FO�a &E�O���,FO�W X  ���,FO*a ����a + X ��{��������
�� .Web:FJSNnull���     ****�� 0 
jsonobject 
jsonObject�� �����
�� 
EWSp� {�������� "0 isprettyprinted isPrettyPrinted��  
�� boovfals��  � 	�������������������� 0 
jsonobject 
jsonObject�� "0 isprettyprinted isPrettyPrinted�� 0 writeoptions writeOptions�� 0 thedata theData�� 0 theerror theError�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ���������������������������������������������������� (0 asbooleanparameter asBooleanParameter
�� misccura�� 80 nsjsonwritingprettyprinted NSJSONWritingPrettyPrinted�� *0 nsjsonserialization NSJSONSerialization�� (0 isvalidjsonobject_ isValidJSONObject_
�� 
errn���Y
�� 
erob�� 
�� 
obj �� F0 !datawithjsonobject_options_error_ !dataWithJSONObject_options_error_
�� 
cobj
�� 
msng�� ,0 localizeddescription localizedDescription�� 0 nsstring NSString�� 	0 alloc  �� ,0 nsutf8stringencoding NSUTF8StringEncoding�� 00 initwithdata_encoding_ initWithData_encoding_
�� 
ctxt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �b  ��l+  
��,E�Y jE�O��,�k+  )�����Y hO��,���m+ E[�k/E�Z[�l/E�ZO��  )�����j+ %a %Y hO�a ,j+ ��a ,l+ a &W X  *a ����a + Y �� ��������
�� .Web:PJSNnull���     ctxt�� 0 jsontext jsonText�� �����
�� 
Frag� {�������� *0 arefragmentsallowed areFragmentsAllowed��  
�� boovfals��  � 
���������������������� 0 jsontext jsonText�� *0 arefragmentsallowed areFragmentsAllowed�� 0 readoptions readOptions�� 0 thedata theData�� 0 
jsonobject 
jsonObject�� 0 theerror theError�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��"������������������������������X��\�����o������ "0 astextparameter asTextParameter�� (0 asbooleanparameter asBooleanParameter
�� misccura�� :0 nsjsonreadingallowfragments NSJSONReadingAllowFragments�� 0 
asnsstring 
asNSString�� ,0 nsutf8stringencoding NSUTF8StringEncoding�� (0 datausingencoding_ dataUsingEncoding_�� *0 nsjsonserialization NSJSONSerialization
�� 
obj �� F0 !jsonobjectwithdata_options_error_ !JSONObjectWithData_options_error_
�� 
cobj
�� 
msng
�� 
errn���Y
�� 
erob�� �� ,0 localizeddescription localizedDescription
�� 
****�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �b  ��l+ E�Ob  ��l+  
��,E�Y jE�Ob  �k+ ��,k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )��a �a a �j+ %a %Y hO�a &W X  *a ����a + Z ���~�}���|
� .Web:FB64null���     ctxt�~ 0 thetext theText�}  � �{�z�y�x�w�v�{ 0 thetext theText�z 0 
asocstring 
asocString�y 0 etext eText�x 0 enumber eNumber�w 0 efrom eFrom�v 
0 eto eTo� ��u�t�s�r�q�p�o���n�m�u "0 astextparameter asTextParameter�t 0 
asnsstring 
asNSString
�s misccura�r ,0 nsutf8stringencoding NSUTF8StringEncoding�q B0 base64encodedstringwithoptions_ base64EncodedStringWithOptions_�p (0 datausingencoding_ dataUsingEncoding_�o 0 etext eText� �l�k�
�l 
errn�k 0 enumber eNumber� �j�i�
�j 
erob�i 0 efrom eFrom� �h�g�f
�h 
errt�g 
0 eto eTo�f  �n �m 
0 _error  �| ; *b  b  ��l+ k+ E�O���,jk+ k+ W X  *颣���+ [ �e��d�c���b
�e .Web:PB64null���     ctxt�d 0 thetext theText�c  � �a�`�_�^�]�\�[�a 0 thetext theText�` 0 asocdata asocData�_ 0 
asocstring 
asocString�^ 0 etext eText�] 0 enumber eNumber�\ 0 efrom eFrom�[ 
0 eto eTo� ��Z�Y�X�W�V�U�T�S�R�Q�P	�O�N�M��L�K�Z "0 astextparameter asTextParameter
�Y misccura�X 0 nsdata NSData�W 	0 alloc  �V Z0 +nsdatabase64decodingignoreunknowncharacters +NSDataBase64DecodingIgnoreUnknownCharacters�U L0 $initwithbase64encodedstring_options_ $initWithBase64EncodedString_options_�T 0 nsstring NSString�S ,0 nsutf8stringencoding NSUTF8StringEncoding�R 00 initwithdata_encoding_ initWithData_encoding_
�Q 
msng
�P 
ctxt�O �N .0 throwinvalidparameter throwInvalidParameter�M 0 etext eText� �J�I�
�J 
errn�I 0 enumber eNumber� �H�G�
�H 
erob�G 0 efrom eFrom� �F�E�D
�F 
errt�E 
0 eto eTo�D  �L �K 
0 _error  �b c Nb  ��l+ E�O��,j+ ���,l+ E�O��,j+ ���,l+ 	E�O��  b  �����+ Y hW X  *a ����a + \ �C��C �  7;?CGKN] �BW  ��B (0 _nsstringencodings _NSStringEncodings�  ��A��� �@�?�>�@ 	0 _list  �? 	0 _init  �> 0 getencoding getEncoding
�A 
msng� �=i�<�;���:�= 	0 _init  �<  �;  �  � Evy�9�8���7���6���5���4���3���2��1��	�0			�/	$	(	+�.	9	=	A	D�-�,	Q�+	_	c	f�*	t	x	{�)	�	�	��(	�	�	��'	�	�	��&	�	�	��%�$
�9 misccura�8 ,0 nsutf8stringencoding NSUTF8StringEncoding�7 .0 nsutf16stringencoding NSUTF16StringEncoding�6 @0 nsutf16bigendianstringencoding NSUTF16BigEndianStringEncoding�5 F0 !nsutf16littleendianstringencoding !NSUTF16LittleEndianStringEncoding�4 .0 nsutf32stringencoding NSUTF32StringEncoding�3 @0 nsutf32bigendianstringencoding NSUTF32BigEndianStringEncoding�2 F0 !nsutf32littleendianstringencoding !NSUTF32LittleEndianStringEncoding�1 .0 nsasciistringencoding NSASCIIStringEncoding�0 60 nsiso2022jpstringencoding NSISO2022JPStringEncoding�/ 60 nsisolatin1stringencoding NSISOLatin1StringEncoding�. 60 nsisolatin2stringencoding NSISOLatin2StringEncoding�- �, :0 nsjapaneseeucstringencoding NSJapaneseEUCStringEncoding�+ 80 nsmacosromanstringencoding NSMacOSRomanStringEncoding�* 40 nsshiftjisstringencoding NSShiftJISStringEncoding�) >0 nswindowscp1250stringencoding NSWindowsCP1250StringEncoding�( >0 nswindowscp1251stringencoding NSWindowsCP1251StringEncoding�' >0 nswindowscp1252stringencoding NSWindowsCP1252StringEncoding�& >0 nswindowscp1253stringencoding NSWindowsCP1253StringEncoding�% >0 nswindowscp1254stringencoding NSWindowsCP1254StringEncoding�$ �:'��lv��,lv��lv��,lv��lv��,lv��lv��,lv��lv��,lva a lv�a ,lva a lv�a ,lva kv�a ,lva a a mv�a ,lva a a mv�a ,lva  a !a "mv�a #,lva $a %a &a 'a (v�a ),lva *kv�a +,lva ,a -a .mv�a /,lva 0a 1a 2mv�a 3,lva 4a 5a 6mv�a 7,lva 8a 9a :mv�a ;,lva <a =a >mv�a ?,lva @a Aa Bmv�a C,lva DvEc   � �#	��"�!��� �# 0 getencoding getEncoding�" ��� �  �� 0 textencoding textEncoding�!  � ��� 0 textencoding textEncoding� 0 aref aRef� 
��	�	�������
� 
msng� 	0 _init  � 	0 _list  
� 
kocl
� 
cobj
� .corecnte****       ****�  �  �  V Nb   �  
*j+ Y hO�� 2 +)�,[��l kh ��k/�kv ��l/EY h[OY��O�VW X  	h^ �
	������ 0 _parsecharset _parseCharset� ��� �  �� "0 asoccontenttype asocContentType�  � ���� "0 asoccontenttype asocContentType� 0 asocpattern asocPattern� 0 	asocmatch 	asocMatch� 
�
�	
�������
�
 misccura�	 *0 nsregularexpression NSRegularExpression
� 
msng� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_� 
0 length  � F0 !firstmatchinstring_options_range_ !firstMatchInString_options_range_� 0 rangeatindex_ rangeAtIndex_� *0 substringwithrange_ substringWithRange_
� 
ctxt� ;��,�j�m+ E�O��jj�j+ lvm+ E�O��  �Y hO��lk+ k+ �&_ �
P� ������� $0 _makehttprequest _makeHTTPRequest�  ����� �  ������������ 0 theurl theURL�� 0 
httpmethod 
httpMethod��  0 requestheaders requestHeaders�� 0 requestbody requestBody�� $0 timeoutinseconds timeoutInSeconds��  � ���������������������������������������� 0 theurl theURL�� 0 
httpmethod 
httpMethod��  0 requestheaders requestHeaders�� 0 requestbody requestBody�� $0 timeoutinseconds timeoutInSeconds�� 0 httprequest httpRequest�� 0 aref aRef�� 0 headerrecord headerRecord�� 0 
headername 
headerName�� 0 headervalue headerValue�� 0 etext eText�� 0 enum eNum�� 0 efrom eFrom�� 
0 eto eTo�� 0 contenttype contentType�� ,0 nsutf8stringencoding NSUTF8StringEncoding�� *0 requestbodyencoding requestBodyEncoding�� 0 charsetname charsetName�� 0 bodydata bodyData� A
\
]����
s����
���������+�����������������������������������
���������X��lo����������������������������"%/8
�� misccura�� *0 nsmutableurlrequest NSMutableURLRequest�� $0 asnsurlparameter asNSURLParameter�� "0 requestwithurl_ requestWithURL_�� "0 astextparameter asTextParameter��  0 sethttpmethod_ setHTTPMethod_
�� 
msng�� *0 settimeoutinterval_ setTimeoutInterval_�� "0 aslistparameter asListParameter
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
reco
�� 
ctxt
�� 
errn���Y�� 0 
headername 
headerName�� 0 headervalue headerValue�� 0 etext eText� �����
�� 
errn�� 0 enum eNum� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  ���\���@
�� 
erob
�� 
errt�� 
�� 
list�� �� .0 throwinvalidparameter throwInvalidParameter�� <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_�� 40 valueforhttpheaderfield_ valueForHTTPHeaderField_�� 0 
asnsstring 
asNSString�� 0 _parsecharset _parseCharset�� 0 getencoding getEncoding�� (0 datausingencoding_ dataUsingEncoding_
�� 
ocid�� 0 sethttpbody_ setHTTPBody_�� &0 checktypeforvalue checkTypeForValue�� 0 nsdata NSData�� 	0 class  �� &0 isinstanceoftype_ isInstanceOfType_
�� 
bool��~��z��,b  ��l+ k+ E�Ob  ��l+ E�O��k+ 	O�� ��k+ Y hO�� � �b  ��l+ [��l kh  I�a ,a &E�O��a l l )a a lhY hO�a ,�a ,lvE[�k/E�Z[�l/E�ZW FX  a a a mv�kv )a �a �a �a �Y hOb  �a a  a !a "+ #Ob  � b  �a $a  a %�%a "+ #Y hO���l+ &[OY�>Y hO��N�kv�a l k  ֥a 'k+ (E�O��  �a )a *l+ &O�E^ Y f*b  �k+ +k+ ,E^ O] �  ��a -%a .l+ &O�E^ Y 4b  ] k+ /E^ O] �  b  �a 0a  a 1a "+ #Y hOb  �k+ +] k+ 2E^ O] �  !b  �a 3a a 4lva 5�%a "+ #Y hO�] k+ 6Y gb  �a 4l+ 7	 ��a 8,j+ 9k+ :a ;& (��k+ 6O�a <� k+ ( �a =a >l+ &Y hY b  �a ?a a 4lva @a "+ #Y hO�V` ��H���������� *0 _unpackhttpresponse _unpackHTTPResponse�� ����� �  �������� 0 httpresponse httpResponse�� $0 responsebodytype responseBodyType�� $0 responsebodydata responseBodyData��  � ������������������������ 0 httpresponse httpResponse�� $0 responsebodytype responseBodyType�� $0 responsebodydata responseBodyData�� 0 headerfields headerFields�� $0 asocheaderfields asocHeaderFields�� 0 
headerkeys 
headerKeys�� 0 i  �� 0 asockey asocKey�� ,0 responsebodyencoding responseBodyEncoding�� "0 asoccontenttype asocContentType�� 0 responsebody responseBody� ������������������������������������������������� "0 allheaderfields allHeaderFields�� 0 allkeys allKeys�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 
headername 
headerName
�� 
ctxt�� 0 headervalue headerValue�� 0 objectforkey_ objectForKey_
�� 
****�� 
�� 
msng�� 0 _parsecharset _parseCharset�� 0 getencoding getEncoding
�� 
errn���\
�� misccura�� 0 nsstring NSString�� 	0 alloc  � 00 initwithdata_encoding_ initWithData_encoding_
� 
rdat� 0 copy  � >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 
statuscode 
statusCode� "0 responseheaders responseHeaders� 0 responsebody responseBody� �� �jvE�O�j+  E�O�j+ E�O /j�j+ kkh ��k+ E�O��&椧k+ �&��6F[OY��O��  V�E�O��k+ E�O�� b  *�k+ k+ E�Y hO��  )��la Y hOa a ,j+ ��l+ �&E�Y -�a   �j+ E�Y ��  �E�Y b  �a l+ Oa �j+ a �a �a a �������
� .Web:ReqHnull��� ��� null�  � ���
� 
Dest� 0 theurl theURL� ���
� 
Meth� {��� 0 
httpmethod 
httpMethod�  � �~��
�~ 
Head� {�}�|�{�}  0 requestheaders requestHeaders�|  �{  � �z��
�z 
Body� {�y�x�w�y 0 requestbody requestBody�x  
�w 
msng� �v��
�v 
TimO� {�u�t�s�u $0 timeoutinseconds timeoutInSeconds�t  
�s 
msng� �r��q
�r 
Type� {�p�o�n�p $0 responsebodytype responseBodyType�o  
�n 
ctxt�q  � �m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�m 0 theurl theURL�l 0 
httpmethod 
httpMethod�k  0 requestheaders requestHeaders�j 0 requestbody requestBody�i $0 timeoutinseconds timeoutInSeconds�h $0 responsebodytype responseBodyType�g 0 httprequest httpRequest�f 0 sessionconfig sessionConfig�e 0 asocsession asocSession�d $0 responsebodydata responseBodyData�c *0 sessiontaskdelegate sessionTaskDelegate�b 0 asoctask asocTask�a 0 	taskerror 	taskError�` 0 etext eText�_ 0 enumber eNumber�^ 0 efrom eFrom�] 
0 eto eTo� )�\-�[�Z�Y�X�W�V�U�T�S�R�Q�Ps��O�N�M�L�K�J��I�H�G�F�E�D�C�B�A�@�?�>�=�<�;� �:
�\ 
msng�[ (0 asintegerparameter asIntegerParameter�Z �Y $0 _makehttprequest _makeHTTPRequest
�X misccura�W 60 nsurlsessionconfiguration NSURLSessionConfiguration�V >0 ephemeralsessionconfiguration ephemeralSessionConfiguration�U >0 settimeoutintervalforrequest_ setTimeoutIntervalForRequest_�T 0 nsurlsession NSURLSession�S 60 sessionwithconfiguration_ sessionWithConfiguration_�R 0 nsmutabledata NSMutableData�Q 0 data  �P *0 sessiontaskdelegate sessionTaskDelegate� �9��8�7���6
�9 .ascrinit****      � ****� k     �� s�5�5  �8  �7  � �4�4 J0 #urlsession_datatask_didreceivedata_ #URLSession_dataTask_didReceiveData_� �� �3u�2�1���0�3 J0 #urlsession_datatask_didreceivedata_ #URLSession_dataTask_didReceiveData_�2 �/��/ �  �.�-�,�. 0 asocsession asocSession�- 0 asoctask asocTask�, 0 asocdata asocData�1  � �+�*�)�+ 0 asocsession asocSession�* 0 asoctask asocTask�) 0 asocdata asocData� �(�( 0 appenddata_ appendData_�0 b  	�k+  �6 L  �O d0 0sessionwithconfiguration_delegate_delegatequeue_ 0sessionWithConfiguration_delegate_delegateQueue_�N ,0 datataskwithrequest_ dataTaskWithRequest_�M 
0 resume  �L 	0 state  �K <0 nsurlsessiontaskstaterunning NSURLSessionTaskStateRunning�J 0 nsthread NSThread�I .0 sleepfortimeinterval_ sleepForTimeInterval_�H @0 nsurlsessiontaskstatesuspended NSURLSessionTaskStateSuspended�G 
0 cancel  �F @0 nsurlsessiontaskstatecanceling NSURLSessionTaskStateCanceling
�E 
errn�D���C 	0 error  �B 0 code  
�A 
erob�@ �? ,0 localizeddescription localizedDescription
�> 
ctxt�= 0 response  �< *0 _unpackhttpresponse _unpackHTTPResponse�; 0 etext eText� �'�&�
�' 
errn�& 0 enumber eNumber� �%�$�
�% 
erob�$ 0 efrom eFrom� �#�"�!
�# 
errt�" 
0 eto eTo�!  �: 
0 _error  �0�� b  ��l+ E�Y hO*������+ E�O��,j+ E�O�� ��k+ Y hO��  ��,�k+ 
E�O�E�Y  ��,j+ E�O��K S�O��,���m+ E�O��k+ E�O�j+ O  h�j+ �a , �a ,a k+ [OY��O�j+ �a ,  
�j+ Y hO�j+ �a ,  )a a lhY hO�j+ E�O�� )a �j+ a �a  �j+ !a "&Y hO*�j+ #��m+ $W X % &*a '���] �+ (b � �����
�  .Web:DStCnull���     long� 0 
statuscode 
statusCode�  � ������ 0 
statuscode 
statusCode� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� '�������>��� (0 asintegerparameter asIntegerParameter
� misccura� &0 nshttpurlresponse NSHTTPURLResponse� >0 localizedstringforstatuscode_ localizedStringForStatusCode_
� 
ctxt� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ��
�	
� 
errt�
 
0 eto eTo�	  � � 
0 _error  � / b  ��l+ E�O��,�k+ �&W X  *衢���+ 
ascr  ��ޭ