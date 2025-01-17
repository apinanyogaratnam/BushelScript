FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � � File -- common file system and path string operations

Notes:

- Path manipulation commands all operate on POSIX paths, as those are reliable whereas HFS paths (which are already deprecated everywhere else in OS X) are not.

     � 	 	�   F i l e   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 N o t e s : 
 
 -   P a t h   m a n i p u l a t i o n   c o m m a n d s   a l l   o p e r a t e   o n   P O S I X   p a t h s ,   a s   t h o s e   a r e   r e l i a b l e   w h e r e a s   H F S   p a t h s   ( w h i c h   a r e   a l r e a d y   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X )   a r e   n o t . 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _support   ( N     ) ) 4    �� *
�� 
scpt * m     + + � , ,  T y p e S u p p o r t & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 l     ��������  ��  ��   1  2 3 2 i   ! 4 5 4 I      �� 6���� 
0 _error   6  7 8 7 o      ���� 0 handlername handlerName 8  9 : 9 o      ���� 0 etext eText :  ; < ; o      ���� 0 enumber eNumber <  = > = o      ���� 0 efrom eFrom >  ?�� ? o      ���� 
0 eto eTo��  ��   5 n     @ A @ I    �� B���� &0 throwcommanderror throwCommandError B  C D C m     E E � F F  F i l e D  G H G o    ���� 0 handlername handlerName H  I J I o    ���� 0 etext eText J  K L K o    	���� 0 enumber eNumber L  M N M o   	 
���� 0 efrom eFrom N  O�� O o   
 ���� 
0 eto eTo��  ��   A o     ���� 0 _support   3  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V J D--------------------------------------------------------------------    W � X X � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - U  Y Z Y l     �� [ \��   [  File Read/Write; these are atomic alternatives to StandardAdditions' File Read/Write suite, with better support for text encodings (incremental read/write is almost entirely useless in practice as AS doesn't have the capabilities or smarts to do it right)    \ � ] ]    F i l e   R e a d / W r i t e ;   t h e s e   a r e   a t o m i c   a l t e r n a t i v e s   t o   S t a n d a r d A d d i t i o n s '   F i l e   R e a d / W r i t e   s u i t e ,   w i t h   b e t t e r   s u p p o r t   f o r   t e x t   e n c o d i n g s   ( i n c r e m e n t a l   r e a d / w r i t e   i s   a l m o s t   e n t i r e l y   u s e l e s s   i n   p r a c t i c e   a s   A S   d o e s n ' t   h a v e   t h e   c a p a b i l i t i e s   o r   s m a r t s   t o   d o   i t   r i g h t ) Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` h   " )�� b�� (0 _nsstringencodings _NSStringEncodings b k       c c  d e d l     �� f g��   fZT note that CoreFoundation defines a much larger set of encodings, but ASOC's limited C support prevents it using CFStringConvertEncodingToNSStringEncoding to convert them to NSStringEncodings so aren't supported here (users' scripts can always use command-line `textutil` tool via `do shell script` to transcode plain text files separately)    g � h h�   n o t e   t h a t   C o r e F o u n d a t i o n   d e f i n e s   a   m u c h   l a r g e r   s e t   o f   e n c o d i n g s ,   b u t   A S O C ' s   l i m i t e d   C   s u p p o r t   p r e v e n t s   i t   u s i n g   C F S t r i n g C o n v e r t E n c o d i n g T o N S S t r i n g E n c o d i n g   t o   c o n v e r t   t h e m   t o   N S S t r i n g E n c o d i n g s   s o   a r e n ' t   s u p p o r t e d   h e r e   ( u s e r s '   s c r i p t s   c a n   a l w a y s   u s e   c o m m a n d - l i n e   ` t e x t u t i l `   t o o l   v i a   ` d o   s h e l l   s c r i p t `   t o   t r a n s c o d e   p l a i n   t e x t   f i l e s   s e p a r a t e l y ) e  i j i l     ��������  ��  ��   j  k l k j     �� m�� 	0 _list   m m     ��
�� 
msng l  n o n l     ��������  ��  ��   o  p q p i    r s r I      �������� 	0 _init  ��  ��   s r     � t u t J     � v v  w x w l 	    y���� y J      z z  { | { m     ��
�� FEncFE01 |  }�� } n    ~  ~ o    ���� ,0 nsutf8stringencoding NSUTF8StringEncoding  m    ��
�� misccura��  ��  ��   x  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE02 �  ��� � n   
 � � � o    
���� .0 nsutf16stringencoding NSUTF16StringEncoding � m    ��
�� misccura��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE03 �  ��� � n    � � � o    ���� @0 nsutf16bigendianstringencoding NSUTF16BigEndianStringEncoding � m    ��
�� misccura��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE04 �  ��� � n    � � � o    ���� F0 !nsutf16littleendianstringencoding !NSUTF16LittleEndianStringEncoding � m    ��
�� misccura��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE05 �  ��� � n    � � � o    ���� .0 nsutf32stringencoding NSUTF32StringEncoding � m    ��
�� misccura��  ��  ��   �  � � � l 	  $ ����� � J    $ � �  � � � m    ��
�� FEncFE06 �  ��� � n   " � � � o     "���� @0 nsutf32bigendianstringencoding NSUTF32BigEndianStringEncoding � m     ��
�� misccura��  ��  ��   �  � � � l 	 $ * ����� � J   $ * � �  � � � m   $ %��
�� FEncFE07 �  ��� � n  % ( � � � o   & (���� F0 !nsutf32littleendianstringencoding !NSUTF32LittleEndianStringEncoding � m   % &��
�� misccura��  ��  ��   �  � � � l 	 * 2 ����� � J   * 2 � �  � � � m   * +��
�� FEncFE11 �  ��� � n  + 0 � � � o   , 0���� .0 nsasciistringencoding NSASCIIStringEncoding � m   + ,��
�� misccura��  ��  ��   �  � � � l 	 2 < ����� � J   2 < � �  � � � m   2 5��
�� FEncFE12 �  ��� � n  5 : � � � o   6 :���� 60 nsiso2022jpstringencoding NSISO2022JPStringEncoding � m   5 6��
�� misccura��  ��  ��   �  � � � l 	 < F ����� � J   < F � �  � � � m   < ?��
�� FEncFE13 �  ��� � n  ? D � � � o   @ D���� 60 nsisolatin1stringencoding NSISOLatin1StringEncoding � m   ? @��
�� misccura��  ��  ��   �  � � � l 	 F P ���~ � J   F P � �  � � � m   F I�}
�} FEncFE14 �  ��| � n  I N � � � o   J N�{�{ 60 nsisolatin2stringencoding NSISOLatin2StringEncoding � m   I J�z
�z misccura�|  �  �~   �  � � � l 	 P Z ��y�x � J   P Z � �  � � � m   P S�w
�w FEncFE15 �  ��v � n  S X � � � o   T X�u�u :0 nsjapaneseeucstringencoding NSJapaneseEUCStringEncoding � m   S T�t
�t misccura�v  �y  �x   �  � � � l 	 Z d ��s�r � J   Z d � �  � � � m   Z ]�q
�q FEncFE16 �  ��p � n  ] b � � � o   ^ b�o�o 80 nsmacosromanstringencoding NSMacOSRomanStringEncoding � m   ] ^�n
�n misccura�p  �s  �r   �  � � � l 	 d n ��m�l � J   d n � �  � � � m   d g�k
�k FEncFE17 �  ��j � n  g l � � � o   h l�i�i >0 nsnonlossyasciistringencoding NSNonLossyASCIIStringEncoding � m   g h�h
�h misccura�j  �m  �l   �  � � � l 	 n x ��g�f � J   n x � �  � � � m   n q�e
�e FEncFE18 �  ��d � n  q v � � � o   r v�c�c 40 nsshiftjisstringencoding NSShiftJISStringEncoding � m   q r�b
�b misccura�d  �g  �f   �  � � � l 	 x � �a�`  J   x �  m   x {�_
�_ FEncFE19 �^ n  { � o   | ��]�] 00 nssymbolstringencoding NSSymbolStringEncoding m   { |�\
�\ misccura�^  �a  �`   �  l 	 � �	�[�Z	 J   � �

  m   � ��Y
�Y FEncFE50 �X n  � � o   � ��W�W >0 nswindowscp1250stringencoding NSWindowsCP1250StringEncoding m   � ��V
�V misccura�X  �[  �Z    l 	 � ��U�T J   � �  m   � ��S
�S FEncFE51 �R n  � � o   � ��Q�Q >0 nswindowscp1251stringencoding NSWindowsCP1251StringEncoding m   � ��P
�P misccura�R  �U  �T    l 	 � ��O�N J   � �  m   � ��M
�M FEncFE52 �L n  � � !  o   � ��K�K >0 nswindowscp1252stringencoding NSWindowsCP1252StringEncoding! m   � ��J
�J misccura�L  �O  �N   "#" l 	 � �$�I�H$ J   � �%% &'& m   � ��G
�G FEncFE53' (�F( n  � �)*) o   � ��E�E >0 nswindowscp1253stringencoding NSWindowsCP1253StringEncoding* m   � ��D
�D misccura�F  �I  �H  # +�C+ l 	 � �,�B�A, J   � �-- ./. m   � ��@
�@ FEncFE54/ 0�?0 n  � �121 o   � ��>�> >0 nswindowscp1254stringencoding NSWindowsCP1254StringEncoding2 m   � ��=
�= misccura�?  �B  �A  �C   u o      �<�< 	0 _list   q 343 l     �;�:�9�;  �:  �9  4 5�85 i   
676 I      �78�6�7 0 getencoding getEncoding8 9�59 o      �4�4 0 textencoding textEncoding�5  �6  7 k     k:: ;<; Q     _=>?= k    G@@ ABA Z   CD�3�2C =   
EFE o    �1�1 	0 _list  F m    	�0
�0 
msngD I    �/�.�-�/ 	0 _init  �.  �-  �3  �2  B GHG r    IJI c    KLK o    �,�, 0 textencoding textEncodingL m    �+
�+ 
enumJ o      �*�* 0 textencoding textEncodingH M�)M X    GN�(ON Z  / BPQ�'�&P =  / 5RSR n  / 3TUT 4   0 3�%V
�% 
cobjV m   1 2�$�$ U o   / 0�#�# 0 aref aRefS o   3 4�"�" 0 textencoding textEncodingQ L   8 >WW n  8 =XYX 4   9 <�!Z
�! 
cobjZ m   : ;� �  Y o   8 9�� 0 aref aRef�'  �&  �( 0 aref aRefO n    #[\[ o   ! #�� 	0 _list  \  f     !�)  > R      ��]
� .ascrerr ****      � ****�  ] �^�
� 
errn^ d      __ m      ����  ? l  O _`ab` Q   O _cdec L   R Vff c   R Ughg o   R S�� 0 textencoding textEncodingh m   S T�
� 
longd R      ��i
� .ascrerr ****      � ****�  i �j�
� 
errnj d      kk m      ����  e l  ^ ^�lm�  l   fall through   m �nn    f a l l   t h r o u g ha ] W not a predefined constant, but hedge bets as it might be a raw NSStringEncoding number   b �oo �   n o t   a   p r e d e f i n e d   c o n s t a n t ,   b u t   h e d g e   b e t s   a s   i t   m i g h t   b e   a   r a w   N S S t r i n g E n c o d i n g   n u m b e r< p�p n  ` kqrq I   e k�s�� >0 throwinvalidconstantparameter throwInvalidConstantParameters tut o   e f�� 0 textencoding textEncodingu v�v m   f gww �xx 
 u s i n g�  �  r o   ` e�� 0 _support  �  �8   a yzy l     �
�	��
  �	  �  z {|{ l     ����  �  �  | }~} l     ���    -----   � ��� 
 - - - - -~ ��� l     ����  �  �  � ��� i  * -��� I     � ��
�  .Fil:Readnull���     file� o      ���� 0 thefile theFile� ����
�� 
Type� |����������  ��  � o      ���� 0 datatype dataType��  � l     ������ m      ��
�� 
ctxt��  ��  � �����
�� 
Enco� |����������  ��  � o      ���� 0 textencoding textEncoding��  � l     ������ m      ��
�� FEncFE01��  ��  ��  � Q     ����� k    ��� ��� r    ��� n   ��� I    ������� ,0 asposixpathparameter asPOSIXPathParameter� ��� o    	���� 0 thefile theFile� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 	posixpath 	posixPath� ��� r    ��� n   ��� I    ������� "0 astypeparameter asTypeParameter� ��� o    ���� 0 datatype dataType� ���� m    �� ���  a s��  ��  � o    ���� 0 _support  � o      ���� 0 datatype dataType� ���� Z    ������� F    *��� =   "��� o     ���� 0 datatype dataType� m     !��
�� 
ctxt� >  % (��� o   % &���� 0 textencoding textEncoding� m   & '��
�� FEncFEPE� l  - }���� k   - }�� ��� r   - 9��� n  - 7��� I   2 7������� 0 getencoding getEncoding� ���� o   2 3���� 0 textencoding textEncoding��  ��  � o   - 2���� (0 _nsstringencodings _NSStringEncodings� o      ���� 0 textencoding textEncoding� ��� r   : S��� n  : D��� I   = D������� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_� ��� o   = >���� 0 	posixpath 	posixPath� ��� o   > ?���� 0 textencoding textEncoding� ���� l  ? @������ m   ? @��
�� 
obj ��  ��  ��  ��  � n  : =��� o   ; =���� 0 nsstring NSString� m   : ;��
�� misccura� J      �� ��� o      ���� 0 
asocstring 
asocString� ���� o      ���� 0 theerror theError��  � ��� Z  T x������� =  T W��� o   T U���� 0 
asocstring 
asocString� m   U V��
�� 
msng� R   Z t����
�� .ascrerr ****      � ****� l  l s������ c   l s��� n  l q��� I   m q�������� ,0 localizeddescription localizedDescription��  ��  � o   l m���� 0 theerror theError� m   q r��
�� 
ctxt��  ��  � ����
�� 
errn� n  \ a��� I   ] a�������� 0 code  ��  ��  � o   \ ]���� 0 theerror theError� ����
�� 
erob� o   d e���� 0 thefile theFile� �����
�� 
errt� o   h i���� 0 datatype dataType��  ��  ��  � ���� L   y }�� c   y |��� o   y z���� 0 
asocstring 
asocString� m   z {��
�� 
ctxt��  �'! note: AS treats `text`, `string`, and `Unicode text` as synonyms when comparing for equality, which is a little bit problematic as StdAdds' `read` command treats `string` as 'primary encoding' and `Unicode text` as UTF16; passing `primary encoding` for `using` parameter provides an 'out'   � ���B   n o t e :   A S   t r e a t s   ` t e x t ` ,   ` s t r i n g ` ,   a n d   ` U n i c o d e   t e x t `   a s   s y n o n y m s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   w h i c h   i s   a   l i t t l e   b i t   p r o b l e m a t i c   a s   S t d A d d s '   ` r e a d `   c o m m a n d   t r e a t s   ` s t r i n g `   a s   ' p r i m a r y   e n c o d i n g '   a n d   ` U n i c o d e   t e x t `   a s   U T F 1 6 ;   p a s s i n g   ` p r i m a r y   e n c o d i n g `   f o r   ` u s i n g `   p a r a m e t e r   p r o v i d e s   a n   ' o u t '��  � k   � ��� ��� r   � ���� I  � ������
�� .rdwropenshor       file� l  � ������� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf��  ��  ��  � o      ���� 0 fh  � ���� Q   � ����� k   � ��� � � r   � � I  � ���
�� .rdwrread****        **** o   � ����� 0 fh   ����
�� 
as   o   � ����� 0 datatype dataType��   o      ���� 0 	theresult 	theResult   I  � �����
�� .rdwrclosnull���     **** o   � ����� 0 fh  ��   	��	 L   � �

 o   � ����� 0 	theresult 	theResult��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � k   � �  Q   � ��� I  � �����
�� .rdwrclosnull���     **** o   � ����� 0 fh  ��   R      ������
�� .ascrerr ****      � ****��  ��  ��   �� R   � ���
�� .ascrerr ****      � **** o   � ����� 0 etext eText ��
�� 
errn o   � ����� 0 enumber eNumber ��
�� 
erob o   � ����� 0 efrom eFrom ����
�� 
errt o   � ����� 
0 eto eTo��  ��  ��  ��  � R      �� !
�� .ascrerr ****      � ****  o      ���� 0 etext eText! ��"#
�� 
errn" o      �� 0 enumber eNumber# �~$%
�~ 
erob$ o      �}�} 0 efrom eFrom% �|&�{
�| 
errt& o      �z�z 
0 eto eTo�{  � I   � ��y'�x�y 
0 _error  ' ()( m   � �** �++  r e a d   f i l e) ,-, o   � ��w�w 0 etext eText- ./. o   � ��v�v 0 enumber eNumber/ 010 o   � ��u�u 0 efrom eFrom1 2�t2 o   � ��s�s 
0 eto eTo�t  �x  � 343 l     �r�q�p�r  �q  �p  4 565 l     �o�n�m�o  �n  �m  6 787 i  . 19:9 I     �l;<
�l .Fil:Writnull���     file; o      �k�k 0 thefile theFile< �j=>
�j 
Data= o      �i�i 0 thedata theData> �h?@
�h 
Type? |�g�fA�eB�g  �f  A o      �d�d 0 datatype dataType�e  B l     C�c�bC m      �a
�a 
ctxt�c  �b  @ �`D�_
�` 
EncoD |�^�]E�\F�^  �]  E o      �[�[ 0 textencoding textEncoding�\  F l     G�Z�YG m      �X
�X FEncFE01�Z  �Y  �_  : Q    	HIJH k    �KK LML r    NON n   PQP I    �WR�V�W ,0 asposixpathparameter asPOSIXPathParameterR STS o    	�U�U 0 thefile theFileT U�TU m   	 
VV �WW  �T  �V  Q o    �S�S 0 _support  O o      �R�R 0 	posixpath 	posixPathM XYX r    Z[Z n   \]\ I    �Q^�P�Q "0 astypeparameter asTypeParameter^ _`_ o    �O�O 0 datatype dataType` a�Na m    bb �cc  a s�N  �P  ] o    �M�M 0 _support  [ o      �L�L 0 datatype dataTypeY d�Kd Z    �ef�Jge F    *hih =   "jkj o     �I�I 0 datatype dataTypek m     !�H
�H 
ctxti >  % (lml o   % &�G�G 0 textencoding textEncodingm m   & '�F
�F FEncFEPEf k   - �nn opo r   - Aqrq n  - ?sts I   0 ?�Eu�D�E &0 stringwithstring_ stringWithString_u v�Cv l  0 ;w�B�Aw n  0 ;xyx I   5 ;�@z�?�@ "0 astextparameter asTextParameterz {|{ o   5 6�>�> 0 thedata theData| }�=} m   6 7~~ �  d a t a�=  �?  y o   0 5�<�< 0 _support  �B  �A  �C  �D  t n  - 0��� o   . 0�;�; 0 nsstring NSString� m   - .�:
�: misccurar o      �9�9 0 
asocstring 
asocStringp ��� r   B N��� n  B L��� I   G L�8��7�8 0 getencoding getEncoding� ��6� o   G H�5�5 0 textencoding textEncoding�6  �7  � o   B G�4�4 (0 _nsstringencodings _NSStringEncodings� o      �3�3 0 textencoding textEncoding� ��� r   O k��� n  O X��� I   P X�2��1�2 P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_� ��� o   P Q�0�0 0 	posixpath 	posixPath� ��� m   Q R�/
�/ boovtrue� ��� o   R S�.�. 0 textencoding textEncoding� ��-� l  S T��,�+� m   S T�*
�* 
obj �,  �+  �-  �1  � o   O P�)�) 0 
asocstring 
asocString� J      �� ��� o      �(�( 0 
didsucceed 
didSucceed� ��'� o      �&�& 0 theerror theError�'  � ��%� Z   l ����$�#� H   l n�� o   l m�"�" 0 
didsucceed 
didSucceed� R   q ��!��
�! .ascrerr ****      � ****� l  � ��� �� c   � ���� n  � ���� I   � ����� ,0 localizeddescription localizedDescription�  �  � o   � ��� 0 theerror theError� m   � ��
� 
ctxt�   �  � ���
� 
errn� n  u z��� I   v z���� 0 code  �  �  � o   u v�� 0 theerror theError� ���
� 
erob� o   } ~�� 0 thefile theFile� ���
� 
errt� o   � ��� 0 datatype dataType�  �$  �#  �%  �J  g k   � ��� ��� r   � ���� I  � ����
� .rdwropenshor       file� l  � ����� c   � ���� o   � ��� 0 	posixpath 	posixPath� m   � ��
� 
psxf�  �  � �
��	
�
 
perm� m   � ��
� boovtrue�	  � o      �� 0 fh  � ��� Q   � ����� k   � ��� ��� l  � ����� I  � ����
� .rdwrseofnull���     ****� o   � ��� 0 fh  � ���
� 
set2� m   � ���  �  � e _ important: when overwriting an existing file, make sure its previous contents are erased first   � ��� �   i m p o r t a n t :   w h e n   o v e r w r i t i n g   a n   e x i s t i n g   f i l e ,   m a k e   s u r e   i t s   p r e v i o u s   c o n t e n t s   a r e   e r a s e d   f i r s t� ��� I  � �� ��
�  .rdwrwritnull���     ****� o   � ����� 0 thedata theData� ����
�� 
refn� o   � ����� 0 fh  � �����
�� 
as  � o   � ����� 0 datatype dataType��  � ��� I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � ���� L   � �����  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   � ��� ��� Q   � ������ I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ���� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  ��  �  �K  I R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  J I   �	������� 
0 _error  � ��� m   � ��� ���  w r i t e   f i l e� ��� o   � ���� 0 etext eText� ��� o   ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��  8 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � � � l     ����   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   l     ����     POSIX path manipulation    � 0   P O S I X   p a t h   m a n i p u l a t i o n 	
	 l     ��������  ��  ��  
  i  2 5 I     ��
�� .Fil:ConPnull���     **** o      ���� 0 filepath filePath ��
�� 
From |��������  ��   o      ���� 0 
fromformat 
fromFormat��   l     ���� m      ��
�� FLCTFLCP��  ��   ����
�� 
To__ |��������  ��   o      ���� 0 toformat toFormat��   l     ���� m      ��
�� FLCTFLCP��  ��  ��   l   b Q    b k   L   !"! Z    �#$��%# =    &'& l   (����( I   ��)*
�� .corecnte****       ****) J    ++ ,��, o    ���� 0 filepath filePath��  * ��-��
�� 
kocl- m    ��
�� 
ctxt��  ��  ��  ' m    ����  $ l   ./0. r    121 n   343 I    ��5���� ,0 asposixpathparameter asPOSIXPathParameter5 676 o    ���� 0 filepath filePath7 8��8 m    99 �::  ��  ��  4 o    ���� 0 _support  2 o      ���� 0 	posixpath 	posixPath/ F @ assume it's a file identifier object (alias, �class furl�, etc)   0 �;; �   a s s u m e   i t ' s   a   f i l e   i d e n t i f i e r   o b j e c t   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )��  % l  ! �<=>< Z   ! �?@AB? =  ! $CDC o   ! "���� 0 
fromformat 
fromFormatD m   " #��
�� FLCTFLCP@ r   ' *EFE o   ' (���� 0 filepath filePathF o      ���� 0 	posixpath 	posixPathA GHG =  - 0IJI o   - .���� 0 
fromformat 
fromFormatJ m   . /��
�� FLCTFLCHH KLK l  3 ;MNOM r   3 ;PQP n   3 9RSR 1   7 9��
�� 
psxpS l  3 7T����T 4   3 7��U
�� 
fileU o   5 6���� 0 filepath filePath��  ��  Q o      ���� 0 	posixpath 	posixPathN � � caution: HFS path format is flawed and deprecated everywhere else in OS X (unlike POSIX path format, it can't distinguish between two volumes with the same name), but is still used by AS and a few older scriptable apps so must be supported   O �VV�   c a u t i o n :   H F S   p a t h   f o r m a t   i s   f l a w e d   a n d   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X   ( u n l i k e   P O S I X   p a t h   f o r m a t ,   i t   c a n ' t   d i s t i n g u i s h   b e t w e e n   t w o   v o l u m e s   w i t h   t h e   s a m e   n a m e ) ,   b u t   i s   s t i l l   u s e d   b y   A S   a n d   a   f e w   o l d e r   s c r i p t a b l e   a p p s   s o   m u s t   b e   s u p p o r t e dL WXW =  > AYZY o   > ?���� 0 
fromformat 
fromFormatZ m   ? @��
�� FLCTFLCUX [��[ k   D w\\ ]^] r   D N_`_ n  D Laba I   G L��c����  0 urlwithstring_ URLWithString_c d��d o   G H���� 0 filepath filePath��  ��  b n  D Gefe o   E G���� 	0 NSURL  f m   D E��
�� misccura` o      ���� 0 asocurl asocURL^ g��g Z  O whi����h G   O ]jkj =  O Rlml o   O P���� 0 asocurl asocURLm m   P Q��
�� 
msngk H   U [nn n  U Zopo I   V Z������� 0 fileurl fileURL��  �  p o   U V�~�~ 0 asocurl asocURLi n  ` sqrq I   e s�}s�|�} .0 throwinvalidparameter throwInvalidParameters tut o   e f�{�{ 0 filepath filePathu vwv m   f ixx �yy  w z{z m   i j�z
�z 
ctxt{ |�y| m   j m}} �~~  N o t   a   f i l e   U R L .�y  �|  r o   ` e�x�x 0 _support  ��  ��  ��  ��  B n  z �� I    ��w��v�w >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o    ��u�u 0 
fromformat 
fromFormat� ��t� m   � ��� ���  f r o m�t  �v  � o   z �s�s 0 _support  = \ V it's a text path in the user-specified format, so convert it to a standard POSIX path   > ��� �   i t ' s   a   t e x t   p a t h   i n   t h e   u s e r - s p e c i f i e d   f o r m a t ,   s o   c o n v e r t   i t   t o   a   s t a n d a r d   P O S I X   p a t h" ��� l  � ��r���r  �   sanity check   � ���    s a n i t y   c h e c k� ��� Z  � ����q�p� =   � ���� n  � ���� 1   � ��o
�o 
leng� o   � ��n�n 0 	posixpath 	posixPath� m   � ��m�m  � n  � ���� I   � ��l��k�l .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��j�j 0 filepath filePath� ��� m   � ��� ���  � ��� m   � ��i
�i 
ctxt� ��h� m   � ��� ��� ( P a t h   c a n  t   b e   e m p t y .�h  �k  � o   � ��g�g 0 _support  �q  �p  � ��� l  � ��f���f  � ; 5 convert POSIX path text to the requested format/type   � ��� j   c o n v e r t   P O S I X   p a t h   t e x t   t o   t h e   r e q u e s t e d   f o r m a t / t y p e� ��e� Z   �L����� =  � ���� o   � ��d�d 0 toformat toFormat� m   � ��c
�c FLCTFLCP� L   � ��� o   � ��b�b 0 	posixpath 	posixPath� ��� =  � ���� o   � ��a�a 0 toformat toFormat� m   � ��`
�` FLCTFLCA� ��� l  � ����� L   � ��� c   � ���� c   � ���� o   � ��_�_ 0 	posixpath 	posixPath� m   � ��^
�^ 
psxf� m   � ��]
�] 
alis� %  returns object of type `alias`   � ��� >   r e t u r n s   o b j e c t   o f   t y p e   ` a l i a s `� ��� =  � ���� o   � ��\�\ 0 toformat toFormat� m   � ��[
�[ FLCTFLCX� ��� l  � ����� L   � ��� c   � ���� o   � ��Z�Z 0 	posixpath 	posixPath� m   � ��Y
�Y 
psxf� , & returns object of type `�class furl�`   � ��� L   r e t u r n s   o b j e c t   o f   t y p e   ` � c l a s s   f u r l � `� ��� =  � ���� o   � ��X�X 0 toformat toFormat� m   � ��W
�W FLCTFLCS� ��� l  � ����� L   � ��� N   � ��� n   � ���� 4   � ��V�
�V 
file� l  � ���U�T� c   � ���� c   � ���� o   � ��S�S 0 	posixpath 	posixPath� m   � ��R
�R 
psxf� m   � ��Q
�Q 
ctxt�U  �T  � 1   � ��P
�P 
ascr�NH returns an _object specifier_ of type 'file'. Caution: unlike alias and �class furl� objects, this is not a true object but may be used by some applications; not to be confused with the deprecated `file specifier` type (�class fss�), although it uses the same `file TEXT` constructor. Furthermore, it uses an HFS path string so suffers the same problems as HFS paths. Also, being a specifier, requires disambiguation when used [e.g.] in an `open` command otherwise command will be dispatched to it instead of target app, e.g. `tell app "TextEdit" to open {fileSpecifierObject}`. Horribly nasty, brittle, and confusing mis-feature, in other words, but supported (though not encouraged) as an option here for sake of compatibility as there's usually some scriptable app or other API in AS that will absolutely refuse to accept anything else.   � ����   r e t u r n s   a n   _ o b j e c t   s p e c i f i e r _   o f   t y p e   ' f i l e ' .   C a u t i o n :   u n l i k e   a l i a s   a n d   � c l a s s   f u r l �   o b j e c t s ,   t h i s   i s   n o t   a   t r u e   o b j e c t   b u t   m a y   b e   u s e d   b y   s o m e   a p p l i c a t i o n s ;   n o t   t o   b e   c o n f u s e d   w i t h   t h e   d e p r e c a t e d   ` f i l e   s p e c i f i e r `   t y p e   ( � c l a s s   f s s � ) ,   a l t h o u g h   i t   u s e s   t h e   s a m e   ` f i l e   T E X T `   c o n s t r u c t o r .   F u r t h e r m o r e ,   i t   u s e s   a n   H F S   p a t h   s t r i n g   s o   s u f f e r s   t h e   s a m e   p r o b l e m s   a s   H F S   p a t h s .   A l s o ,   b e i n g   a   s p e c i f i e r ,   r e q u i r e s   d i s a m b i g u a t i o n   w h e n   u s e d   [ e . g . ]   i n   a n   ` o p e n `   c o m m a n d   o t h e r w i s e   c o m m a n d   w i l l   b e   d i s p a t c h e d   t o   i t   i n s t e a d   o f   t a r g e t   a p p ,   e . g .   ` t e l l   a p p   " T e x t E d i t "   t o   o p e n   { f i l e S p e c i f i e r O b j e c t } ` .   H o r r i b l y   n a s t y ,   b r i t t l e ,   a n d   c o n f u s i n g   m i s - f e a t u r e ,   i n   o t h e r   w o r d s ,   b u t   s u p p o r t e d   ( t h o u g h   n o t   e n c o u r a g e d )   a s   a n   o p t i o n   h e r e   f o r   s a k e   o f   c o m p a t i b i l i t y   a s   t h e r e ' s   u s u a l l y   s o m e   s c r i p t a b l e   a p p   o r   o t h e r   A P I   i n   A S   t h a t   w i l l   a b s o l u t e l y   r e f u s e   t o   a c c e p t   a n y t h i n g   e l s e .� ��� =  � ���� o   � ��O�O 0 toformat toFormat� m   � ��N
�N FLCTFLCH� ��� L   ��� c   ���� c   � ���� o   � ��M�M 0 	posixpath 	posixPath� m   � ��L
�L 
psxf� m   � �K
�K 
ctxt� ��� = ��� o  �J�J 0 toformat toFormat� m  �I
�I FLCTFLCU� ��H� k  <�� ��� r  ��� n ��� I  �G��F�G $0 fileurlwithpath_ fileURLWithPath_� ��E� o  �D�D 0 	posixpath 	posixPath�E  �F  � n ��� o  �C�C 	0 NSURL  � m  �B
�B misccura� o      �A�A 0 asocurl asocURL� ��� Z 3���@�?� = � � o  �>�> 0 asocurl asocURL  m  �=
�= 
msng� n / I  !/�<�;�< .0 throwinvalidparameter throwInvalidParameter  o  !"�:�: 0 filepath filePath  m  "% �		   
�9
 4  %+�8
�8 
ctxt m  '* � 4 C a n  t   c o n v e r t   t o   f i l e   U R L .�9  �;   o  !�7�7 0 _support  �@  �?  � �6 L  4< c  4; l 49�5�4 n 49 I  59�3�2�1�3  0 absolutestring absoluteString�2  �1   o  45�0�0 0 asocurl asocURL�5  �4   m  9:�/
�/ 
ctxt�6  �H  � n ?L I  DL�.�-�. >0 throwinvalidconstantparameter throwInvalidConstantParameter  o  DE�,�, 0 toformat toFormat �+ m  EH �  t o�+  �-   o  ?D�*�* 0 _support  �e   R      �)
�) .ascrerr ****      � **** o      �(�( 0 etext eText �' 
�' 
errn o      �&�& 0 enumber eNumber  �%!"
�% 
erob! o      �$�$ 0 efrom eFrom" �##�"
�# 
errt# o      �!�! 
0 eto eTo�"   I  Tb� $��  
0 _error  $ %&% m  UX'' �((  c o n v e r t   p a t h& )*) o  XY�� 0 etext eText* +,+ o  YZ�� 0 enumber eNumber, -.- o  Z[�� 0 efrom eFrom. /�/ o  [\�� 
0 eto eTo�  �   x r brings a modicum of sanity to the horrible mess that is AppleScript's file path formats and file identifier types    �00 �   b r i n g s   a   m o d i c u m   o f   s a n i t y   t o   t h e   h o r r i b l e   m e s s   t h a t   i s   A p p l e S c r i p t ' s   f i l e   p a t h   f o r m a t s   a n d   f i l e   i d e n t i f i e r   t y p e s 121 l     ����  �  �  2 343 l     ����  �  �  4 565 i  6 9787 I     �9:
� .Fil:NorPnull���     ctxt9 o      �� 0 filepath filePath: �;<
� 
ExpT; |��=�>�  �  = o      ��  0 expandingtilde expandingTilde�  > l 
    ?��? l     @�
�	@ m      �
� boovfals�
  �	  �  �  < �AB
� 
ExpRA |��C�D�  �  C o      �� &0 expandingrelative expandingRelative�  D l     E��E m      � 
�  boovfals�  �  B ��F��
�� 
ExpAF |����G��H��  ��  G o      ���� $0 expandingsymlink expandingSymlink��  H l     I����I m      ��
�� boovfals��  ��  ��  8 Q     �JKLJ P    �MNOM k    �PP QRQ r    STS n   UVU I    ��W���� ,0 asposixpathparameter asPOSIXPathParameterW XYX o    ���� 0 filepath filePathY Z��Z m    [[ �\\  ��  ��  V o    ���� 0 _support  T o      ���� 0 filepath filePathR ]^] l   6_`a_ Z   6bc����b F    *ded H    "ff n   !ghg l 
  !i����i I    !��j���� (0 asbooleanparameter asBooleanParameterj klk o    ����  0 expandingtilde expandingTildel m��m m    nn �oo  t i l d e   e x p a n s i o n��  ��  ��  ��  h o    ���� 0 _support  e C   % (pqp o   % &���� 0 filepath filePathq m   & 'rr �ss  ~c r   - 2tut b   - 0vwv m   - .xx �yy  . /w o   . /���� 0 filepath filePathu o      ���� 0 filepath filePath��  ��  ` � � Cocoa API *always* expands leading "~" character, which it really shouldn't as tilde expansion is a *nix shell-ism, not a POSIX path-ism, so prefix with "./" to prevent that   a �zz\   C o c o a   A P I   * a l w a y s *   e x p a n d s   l e a d i n g   " ~ "   c h a r a c t e r ,   w h i c h   i t   r e a l l y   s h o u l d n ' t   a s   t i l d e   e x p a n s i o n   i s   a   * n i x   s h e l l - i s m ,   n o t   a   P O S I X   p a t h - i s m ,   s o   p r e f i x   w i t h   " . / "   t o   p r e v e n t   t h a t^ {|{ Z  7 `}~����} F   7 K� n  7 B��� l 
 < B������ I   < B������� (0 asbooleanparameter asBooleanParameter� ��� o   < =���� &0 expandingrelative expandingRelative� ���� m   = >�� ��� $ a b s o l u t e   e x p a n s i o n��  ��  ��  ��  � o   7 <���� 0 _support  � H   E I�� C   E H��� o   E F���� 0 filepath filePath� m   F G�� ���  /~ r   N \��� I  N Z�����
�� .Fil:JoiPnull���     ****� J   N V�� ��� I  N S������
�� .Fil:CurFnull��� ��� null��  ��  � ���� o   S T���� 0 filepath filePath��  ��  � o      ���� 0 filepath filePath��  ��  | ���� Z   a ������� n  a l��� I   f l������� (0 asbooleanparameter asBooleanParameter� ��� o   f g���� $0 expandingsymlink expandingSymlink� ���� m   g h�� ���  a l i a s   e x p a n s i o n��  ��  � o   a f���� 0 _support  � L   o ��� c   o ��� l  o {������ n  o {��� I   w {�������� B0 stringbyresolvingsymlinksinpath stringByResolvingSymlinksInPath��  ��  � l  o w������ n  o w��� I   r w������� &0 stringwithstring_ stringWithString_� ���� o   r s���� 0 filepath filePath��  ��  � n  o r��� o   p r���� 0 nsstring NSString� m   o p��
�� misccura��  ��  ��  ��  � m   { ~��
�� 
ctxt��  � L   � ��� c   � ���� l  � ������� n  � ���� I   � ��������� 60 stringbystandardizingpath stringByStandardizingPath��  ��  � l  � ������� n  � ���� I   � �������� &0 stringwithstring_ stringWithString_� ���� o   � ����� 0 filepath filePath��  ��  � n  � ���� o   � ����� 0 nsstring NSString� m   � ���
�� misccura��  ��  ��  ��  � m   � ���
�� 
ctxt��  N ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  O ����
�� consnume��  K R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �����
�� 
errt� o      ���� 
0 eto eTo��  L I   � �������� 
0 _error  � ��� m   � ��� ���  n o r m a l i z e   p a t h� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 filepath filePath� ���� o   � ����� 
0 eto eTo��  ��  6 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  : =��� I     ����
�� .Fil:JoiPnull���     ****� o      ����  0 pathcomponents pathComponents� �����
�� 
Exte� |����������  ��  � o      ���� 0 fileextension fileExtension��  � l     ������ m      �� ���  ��  ��  ��  � Q     ����� k    ��� ��� r    ��� n    ��� 2   ��
�� 
cobj� n   ��� I    ������� "0 aslistparameter asListParameter� ��� o    	����  0 pathcomponents pathComponents� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 subpaths subPaths� ��� Q    a���� k    L�� ��� Z   %������� =   ��� o    ���� 0 subpaths subPaths� J    ��  � R    !�~�}�|
�~ .ascrerr ****      � ****�}  �|  ��  ��  � ��{� X   & L �z  r   6 G n  6 C I   ; C�y�x�y ,0 asposixpathparameter asPOSIXPathParameter  n  ; >	
	 1   < >�w
�w 
pcnt
 o   ; <�v�v 0 aref aRef �u m   > ? �  �u  �x   o   6 ;�t�t 0 _support   n      1   D F�s
�s 
pcnt o   C D�r�r 0 aref aRef�z 0 aref aRef o   ) *�q�q 0 subpaths subPaths�{  � R      �p�o�n
�p .ascrerr ****      � ****�o  �n  � n  T a I   Y a�m�l�m .0 throwinvalidparameter throwInvalidParameter  o   Y Z�k�k  0 pathcomponents pathComponents  m   Z [ �    m   [ \�j
�j 
list �i m   \ ] � X E x p e c t e d   o n e   o r   m o r e   t e x t   a n d / o r   f i l e   i t e m s .�i  �l   o   T Y�h�h 0 _support  �  r   b n !  l  b l"�g�f" n  b l#$# I   g l�e%�d�e *0 pathwithcomponents_ pathWithComponents_% &�c& o   g h�b�b 0 subpaths subPaths�c  �d  $ n  b g'(' o   c g�a�a 0 nsstring NSString( m   b c�`
�` misccura�g  �f  ! o      �_�_ 0 asocpath asocPath )*) r   o ~+,+ n  o |-.- I   t |�^/�]�^ "0 astextparameter asTextParameter/ 010 o   t u�\�\ 0 fileextension fileExtension1 2�[2 m   u x33 �44 ( u s i n g   f i l e   e x t e n s i o n�[  �]  . o   o t�Z�Z 0 _support  , o      �Y�Y 0 fileextension fileExtension* 565 Z    �78�X�W7 >    �9:9 n   �;<; 1   � ��V
�V 
leng< o    ��U�U 0 fileextension fileExtension: m   � ��T�T  8 k   � �== >?> r   � �@A@ n  � �BCB I   � ��SD�R�S B0 stringbyappendingpathextension_ stringByAppendingPathExtension_D E�QE o   � ��P�P 0 fileextension fileExtension�Q  �R  C o   � ��O�O 0 asocpath asocPathA o      �N�N 0 asocpath asocPath? F�MF Z  � �GH�L�KG =  � �IJI o   � ��J�J 0 asocpath asocPathJ m   � ��I
�I 
msngH n  � �KLK I   � ��HM�G�H .0 throwinvalidparameter throwInvalidParameterM NON o   � ��F�F 0 fileextension fileExtensionO PQP m   � �RR �SS ( u s i n g   f i l e   e x t e n s i o nQ TUT m   � ��E
�E 
ctxtU V�DV m   � �WW �XX . I n v a l i d   f i l e   e x t e n s i o n .�D  �G  L o   � ��C�C 0 _support  �L  �K  �M  �X  �W  6 Y�BY L   � �ZZ c   � �[\[ o   � ��A�A 0 asocpath asocPath\ m   � ��@
�@ 
ctxt�B  � R      �?]^
�? .ascrerr ****      � ****] o      �>�> 0 etext eText^ �=_`
�= 
errn_ o      �<�< 0 enumber eNumber` �;ab
�; 
eroba o      �:�: 0 efrom eFromb �9c�8
�9 
errtc o      �7�7 
0 eto eTo�8  � I   � ��6d�5�6 
0 _error  d efe m   � �gg �hh  j o i n   p a t hf iji o   � ��4�4 0 etext eTextj klk o   � ��3�3 0 enumber eNumberl mnm o   � ��2�2 0 efrom eFromn o�1o o   � ��0�0 
0 eto eTo�1  �5  � pqp l     �/�.�-�/  �.  �-  q rsr l     �,�+�*�,  �+  �*  s tut i  > Avwv I     �)xy
�) .Fil:SplPnull���     ctxtx o      �(�( 0 filepath filePathy �'z�&
�' 
Uponz |�%�${�#|�%  �$  { o      �"�" 0 splitposition splitPosition�#  | l     }�!� } m      �
� FLSPFLSL�!  �   �&  w Q     ~~�~ k    h�� ��� r    ��� n   ��� I    ���� &0 stringwithstring_ stringWithString_� ��� l   ���� n   ��� I    ���� ,0 asposixpathparameter asPOSIXPathParameter� ��� o    �� 0 filepath filePath� ��� m    �� ���  �  �  � o    �� 0 _support  �  �  �  �  � n   ��� o    �� 0 nsstring NSString� m    �
� misccura� o      �� 0 asocpath asocPath� ��� Z    h����� =   ��� o    �� 0 splitposition splitPosition� m    �
� FLSPFLSL� L    /�� J    .�� ��� c    %��� l   #���� n   #��� I    #���
� F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent�  �
  � o    �	�	 0 asocpath asocPath�  �  � m   # $�
� 
ctxt� ��� c   % ,��� l  % *���� n  % *��� I   & *���� &0 lastpathcomponent lastPathComponent�  �  � o   % &�� 0 asocpath asocPath�  �  � m   * +� 
�  
ctxt�  � ��� =  2 5��� o   2 3���� 0 splitposition splitPosition� m   3 4��
�� FLSPFLSE� ��� L   8 I�� J   8 H�� ��� c   8 ?��� l  8 =������ n  8 =��� I   9 =�������� >0 stringbydeletingpathextension stringByDeletingPathExtension��  ��  � o   8 9���� 0 asocpath asocPath��  ��  � m   = >��
�� 
ctxt� ���� c   ? F��� l  ? D������ n  ? D��� I   @ D�������� 0 pathextension pathExtension��  ��  � o   ? @���� 0 asocpath asocPath��  ��  � m   D E��
�� 
ctxt��  � ��� =  L O��� o   L M���� 0 splitposition splitPosition� m   M N��
�� FLSPFLSA� ���� L   R Z�� c   R Y��� l  R W������ n  R W��� I   S W��������  0 pathcomponents pathComponents��  ��  � o   R S���� 0 asocpath asocPath��  ��  � m   W X��
�� 
list��  � n  ] h��� I   b h������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   b c���� 0 matchformat matchFormat� ���� m   c d�� ���  a t��  ��  � o   ] b���� 0 _support  �   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   p ~������� 
0 _error  � ��� m   q t�� ���  s p l i t   p a t h� ��� o   t u���� 0 etext eText� ��� o   u v���� 0 enumber eNumber� ��� o   v w���� 0 efrom eFrom� ���� o   w x���� 
0 eto eTo��  ��  u ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � S M Shell Script Support handlers for use in AppleScripts that run via osascript   � ��� �   S h e l l   S c r i p t   S u p p o r t   h a n d l e r s   f o r   u s e   i n   A p p l e S c r i p t s   t h a t   r u n   v i a   o s a s c r i p t� ��� l     ��������  ��  ��  � ��� l     ���� j   B F�����  0 _argvusererror _ArgvUserError� m   B E����'��� error code used to indicate the shell script's user supplied invalid command line options (errors due to bugs in invalid option/argument definitions supplied by shell script author use standard AS error codes); need to decide what's a sensible code to use and document it in SDEF (unfortunately, `on error number ...` blocks only accept literal integer (for pattern matching) or identifier (for assignment) and don't allow a command as parameter, so there's no way to supply library-defined error numbers as 'named constants' via library-defined commands, e.g. `on error number (command line user error)`, that return the appropriate number)   � ���   e r r o r   c o d e   u s e d   t o   i n d i c a t e   t h e   s h e l l   s c r i p t ' s   u s e r   s u p p l i e d   i n v a l i d   c o m m a n d   l i n e   o p t i o n s   ( e r r o r s   d u e   t o   b u g s   i n   i n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n s   s u p p l i e d   b y   s h e l l   s c r i p t   a u t h o r   u s e   s t a n d a r d   A S   e r r o r   c o d e s ) ;   n e e d   t o   d e c i d e   w h a t ' s   a   s e n s i b l e   c o d e   t o   u s e   a n d   d o c u m e n t   i t   i n   S D E F   ( u n f o r t u n a t e l y ,   ` o n   e r r o r   n u m b e r   . . . `   b l o c k s   o n l y   a c c e p t   l i t e r a l   i n t e g e r   ( f o r   p a t t e r n   m a t c h i n g )   o r   i d e n t i f i e r   ( f o r   a s s i g n m e n t )   a n d   d o n ' t   a l l o w   a   c o m m a n d   a s   p a r a m e t e r ,   s o   t h e r e ' s   n o   w a y   t o   s u p p l y   l i b r a r y - d e f i n e d   e r r o r   n u m b e r s   a s   ' n a m e d   c o n s t a n t s '   v i a   l i b r a r y - d e f i n e d   c o m m a n d s ,   e . g .   ` o n   e r r o r   n u m b e r   ( c o m m a n d   l i n e   u s e r   e r r o r ) ` ,   t h a t   r e t u r n   t h e   a p p r o p r i a t e   n u m b e r )� ��� l     ��������  ��  ��  � � � h   G R���� 0 novalue NoValue l     ����   J D unique constant used to indicate no defaultValue property was given    � �   u n i q u e   c o n s t a n t   u s e d   t o   i n d i c a t e   n o   d e f a u l t V a l u e   p r o p e r t y   w a s   g i v e n   l     ��������  ��  ��    j   S [��	�� 
0 lf2 LF2	 b   S Z

 1   S V��
�� 
lnfd 1   V Y��
�� 
lnfd  j   \ `���� 0 indent1 Indent1 m   \ _ �       j   a e���� 0 indent2 Indent2 m   a d �               l     ��������  ��  ��    l     ��������  ��  ��    l     ��������  ��  ��    i  f i I      �� ���� 0 vt100 VT100  !��! o      ���� 0 
formatcode 
formatCode��  ��   k     "" #$# l      ��%&��  %F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
		0 = reset/normal
		1 = bold
		2 = faint
		4 = underline
		5 = blink
		7 = negative
		8 = conceal
		30-37 = foreground colors (black, red, green, yellow, blue, magenta, cyan, white)
		38;5;N = xterm-256 foreground colors (N = 0-255)
		39 = default foreground color
		40-49 = background colors (as for 30-39)
	   & �''�   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
 	 
 	 	 0   =   r e s e t / n o r m a l 
 	 	 1   =   b o l d 
 	 	 2   =   f a i n t 
 	 	 4   =   u n d e r l i n e 
 	 	 5   =   b l i n k 
 	 	 7   =   n e g a t i v e 
 	 	 8   =   c o n c e a l 
 	 	 3 0 - 3 7   =   f o r e g r o u n d   c o l o r s   ( b l a c k ,   r e d ,   g r e e n ,   y e l l o w ,   b l u e ,   m a g e n t a ,   c y a n ,   w h i t e ) 
 	 	 3 8 ; 5 ; N   =   x t e r m - 2 5 6   f o r e g r o u n d   c o l o r s   ( N   =   0 - 2 5 5 ) 
 	 	 3 9   =   d e f a u l t   f o r e g r o u n d   c o l o r 
 	 	 4 0 - 4 9   =   b a c k g r o u n d   c o l o r s   ( a s   f o r   3 0 - 3 9 ) 
 	$ (��( L     )) b     *+* b     	,-, b     ./. l    0����0 5     ��1��
�� 
cha 1 m    ���� 
�� kfrmID  ��  ��  / m    22 �33  [- o    ���� 0 
formatcode 
formatCode+ m   	 
44 �55  m��   676 l     ��������  ��  ��  7 898 l     ��:;��  :  -----   ; �<< 
 - - - - -9 =>= l     ��?@��  ? - ' convert raw args to supported AS types   @ �AA N   c o n v e r t   r a w   a r g s   t o   s u p p o r t e d   A S   t y p e s> BCB l     ��������  ��  ��  C DED i  j mFGF I      ��H���� 0 	_jointext 	_joinTextH IJI o      ���� 0 thelist theListJ K��K o      ���� 0 separatortext separatorText��  ��  G k     LL MNM r     OPO n    QRQ 1    ��
�� 
txdlR 1     ��
�� 
ascrP o      ���� 0 oldtids oldTIDsN STS r    UVU o    ���� 0 separatortext separatorTextV n     WXW 1    
��
�� 
txdlX 1    ��
�� 
ascrT YZY r    [\[ c    ]^] o    ���� 0 thelist theList^ m    ��
�� 
ctxt\ o      ���� 0 thetext theTextZ _`_ r    aba o    ���� 0 oldtids oldTIDsb n     cdc 1    ��
�� 
txdld 1    ��
�� 
ascr` e��e L    ff o    ���� 0 thetext theText��  E ghg l     ��������  ��  ��  h iji l     ��������  ��  ��  j klk i  n qmnm I      �o�~� 0 _asvaluetype _asValueTypeo p�}p o      �|�| 0 	valuetype 	valueType�}  �~  n k     ?qq rsr Z     <tu�{vt =     wxw l    	y�z�yy I    	�xz{
�x .corecnte****       ****z J     || }�w} o     �v�v 0 	valuetype 	valueType�w  { �u~�t
�u 
kocl~ m    �s
�s 
list�t  �z  �y  x m   	 
�r�r u l   4�� Z    4���q�p� G    #��� =    ��� n   ��� 1    �o
�o 
leng� o    �n�n 0 	valuetype 	valueType� m    �m�m  � >    !��� n   ��� 1    �l
�l 
leng� o    �k�k 0 	valuetype 	valueType� l    ��j�i� I    �h��
�h .corecnte****       ****� o    �g�g 0 	valuetype 	valueType� �f��e
�f 
kocl� m    �d
�d 
ctxt�e  �j  �i  � R   & 0�c��
�c .ascrerr ****      � ****� m   . /�� ��� & N o t   a   l i s t   o f   t e x t .� �b��
�b 
errn� m   ( )�a�a�\� �`��
�` 
erob� o   * +�_�_ 0 	valuetype 	valueType� �^��]
�^ 
errt� m   , -�\
�\ 
list�]  �q  �p  � 3 - list of text = enumeration of allowed values   � ��� Z   l i s t   o f   t e x t   =   e n u m e r a t i o n   o f   a l l o w e d   v a l u e s�{  v l  7 <���� r   7 <��� c   7 :��� o   7 8�[�[ 0 	valuetype 	valueType� m   8 9�Z
�Z 
pcls� o      �Y�Y 0 	valuetype 	valueType�   must be type name   � ��� $   m u s t   b e   t y p e   n a m es ��X� L   = ?�� o   = >�W�W 0 	valuetype 	valueType�X  l ��� l     �V�U�T�V  �U  �T  � ��� l     �S�R�Q�S  �R  �Q  � ��� i  r u��� I      �P��O�P 0 _unpackvalue _unpackValue� ��� o      �N�N 0 thevalue theValue� ��M� o      �L�L $0 definitionrecord definitionRecord�M  �O  � k    �� ��� l     �K���K  � � � note that only ASOC-friendly AS types are supported here since NSDictionaries are used as temporary storage for parsed options and arguments   � ���   n o t e   t h a t   o n l y   A S O C - f r i e n d l y   A S   t y p e s   a r e   s u p p o r t e d   h e r e   s i n c e   N S D i c t i o n a r i e s   a r e   u s e d   a s   t e m p o r a r y   s t o r a g e   f o r   p a r s e d   o p t i o n s   a n d   a r g u m e n t s� ��� r     
��� I     �J��I�J 0 _asvaluetype _asValueType� ��H� n   ��� o    �G�G 0 	valuetype 	valueType� o    �F�F $0 definitionrecord definitionRecord�H  �I  � o      �E�E 0 	valuetype 	valueType� ��� Z   
���D�� =   ��� n   ��� m    �C
�C 
pcls� o    �B�B 0 	valuetype 	valueType� m    �A
�A 
list� P    @���� k    ?�� ��� Z    ;���@�?� H    �� E   ��� o    �>�> 0 	valuetype 	valueType� J    �� ��=� o    �<�< 0 thevalue theValue�=  � R   ! 7�;��
�; .ascrerr ****      � ****� b   ) 6��� b   ) 4��� b   ) 2��� m   ) *�� ��� ( N o t   a   v a l i d   o p t i o n   (� I   * 1�:��9�: 0 	_jointext 	_joinText� ��� o   + ,�8�8 0 	valuetype 	valueType� ��7� m   , -�� ���  /�7  �9  � m   2 3�� ���  ) :  � o   4 5�6�6 0 thevalue theValue� �5��4
�5 
errn� o   # (�3�3  0 _argvusererror _ArgvUserError�4  �@  �?  � ��2� l  < ?���� r   < ?��� o   < =�1�1 0 thevalue theValue� o      �0�0 0 	theresult 	theResult� � � note: the given value is returned as-is, so its case is not guaranteed to be same as in enumeration; client code should normalize value itself as necessary   � ���8   n o t e :   t h e   g i v e n   v a l u e   i s   r e t u r n e d   a s - i s ,   s o   i t s   c a s e   i s   n o t   g u a r a n t e e d   t o   b e   s a m e   a s   i n   e n u m e r a t i o n ;   c l i e n t   c o d e   s h o u l d   n o r m a l i z e   v a l u e   i t s e l f   a s   n e c e s s a r y�2  � �/�
�/ consdiac� �.�
�. conshyph� �-�
�- conspunc� �,�+
�, conswhit�+  � �*�
�* conscase� �)�(
�) consnume�(  �D  � l  C
���� Z   C
����� =  C F��� o   C D�'�' 0 	valuetype 	valueType� m   D E�&
�& 
ctxt� r   I L��� o   I J�%�% 0 thevalue theValue� o      �$�$ 0 	theresult 	theResult� � � E  O X J   O T  m   O P�#
�# 
long  m   P Q�"
�" 
doub �! m   Q R� 
�  
nmbr�!   J   T W		 
�
 o   T U�� 0 	valuetype 	valueType�     l  [ � k   [ �  r   [ j n  [ h I   d h���� 0 init  �  �   n  [ d I   ` d���� 	0 alloc  �  �   n  [ ` o   \ `�� &0 nsnumberformatter NSNumberFormatter m   [ \�
� misccura o      �� 0 asocformatter asocFormatter  n  k u I   l u��� "0 setnumberstyle_ setNumberStyle_  �  l  l q!��! n  l q"#" o   m q�� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle# m   l m�
� misccura�  �  �  �   o   k l�� 0 asocformatter asocFormatter $%$ n  v �&'& I   w ��(�� 0 
setlocale_ 
setLocale_( )�
) l  w �*�	�* n  w �+,+ I   | ����� 0 systemlocale systemLocale�  �  , n  w |-.- o   x |�� 0 nslocale NSLocale. m   w x�
� misccura�	  �  �
  �  ' o   v w�� 0 asocformatter asocFormatter% /0/ r   � �121 n  � �343 I   � ��5� � &0 numberfromstring_ numberFromString_5 6��6 o   � ����� 0 thevalue theValue��  �   4 o   � ����� 0 asocformatter asocFormatter2 o      ���� 0 
asocresult 
asocResult0 787 Z  � �9:����9 =  � �;<; o   � ����� 0 
asocresult 
asocResult< m   � ���
�� 
msng: R   � ���=>
�� .ascrerr ****      � ****= b   � �?@? m   � �AA �BB ( N o t   a   v a l i d   n u m b e r :  @ o   � ����� 0 thevalue theValue> ��C��
�� 
errnC o   � �����  0 _argvusererror _ArgvUserError��  ��  ��  8 DED r   � �FGF c   � �HIH o   � ����� 0 
asocresult 
asocResultI m   � ���
�� 
****G o      ���� 0 	theresult 	theResultE J��J Z   � �KL����K =  � �MNM o   � ����� 0 	valuetype 	valueTypeN m   � ���
�� 
longL k   � �OO PQP Z  � �RS����R >   � �TUT `   � �VWV o   � ����� 0 	theresult 	theResultW m   � ����� U m   � �����  S R   � ���XY
�� .ascrerr ****      � ****X b   � �Z[Z m   � �\\ �]] * N o t   a   v a l i d   i n t e g e r :  [ o   � ����� 0 thevalue theValueY ��^��
�� 
errn^ o   � �����  0 _argvusererror _ArgvUserError��  ��  ��  Q _��_ r   � �`a` c   � �bcb o   � ����� 0 	theresult 	theResultc m   � ���
�� 
longa o      ���� 0 	theresult 	theResult��  ��  ��  ��   6 0 note: decimal numbers must be in canonical form    �dd `   n o t e :   d e c i m a l   n u m b e r s   m u s t   b e   i n   c a n o n i c a l   f o r m efe E  � �ghg J   � �ii jkj m   � ���
�� 
furlk lml m   � ���
�� 
alism non m   � ���
�� 
fileo p��p m   � ���
�� 
psxf��  h J   � �qq r��r o   � ����� 0 	valuetype 	valueType��  f sts l  ��uvwu k   ��xx yzy l  � ���{|��  {   expand/normalize path   | �}} ,   e x p a n d / n o r m a l i z e   p a t hz ~~ Z   �I������� F   ���� H   � ��� C   � ���� o   � ����� 0 thevalue theValue� m   � ��� ���  /� H   ��� C   ���� o   � ����� 0 thevalue theValue� m   ��� ���  ~� k  E�� ��� r  ��� n ��� I  �������� ,0 currentdirectorypath currentDirectoryPath��  ��  � n ��� I  ��������  0 defaultmanager defaultManager��  ��  � n ��� o  ���� 0 nsfilemanager NSFileManager� m  ��
�� misccura� o      ���� 0 basepath basePath� ��� Z 5������� =  ��� o  ���� 0 basepath basePath� m  ��
�� 
msng� R  #1����
�� .ascrerr ****      � ****� b  +0��� m  +.�� ��� � C a n ' t   e x p a n d   r e l a t i v e   f i l e   p a t h   ( c u r r e n t   w o r k i n g   d i r e c t o r y   i s   u n k n o w n ) :  � o  ./���� 0 thevalue theValue� �����
�� 
errn� o  %*����  0 _argvusererror _ArgvUserError��  ��  ��  � ���� r  6E��� l 6C������ n 6C��� I  ;C������� *0 pathwithcomponents_ pathWithComponents_� ���� J  ;?�� ��� o  ;<���� 0 basepath basePath� ���� o  <=���� 0 thevalue theValue��  ��  ��  � n 6;��� o  7;���� 0 nsstring NSString� m  67��
�� misccura��  ��  � o      ���� 0 thevalue theValue��  ��  ��   ��� r  J`��� c  J^��� c  JZ��� l JX������ n JX��� I  TX�������� 60 stringbystandardizingpath stringByStandardizingPath��  ��  � l JT������ n JT��� I  OT������� &0 stringwithstring_ stringWithString_� ���� o  OP���� 0 thevalue theValue��  ��  � n JO��� o  KO���� 0 nsstring NSString� m  JK��
�� misccura��  ��  ��  ��  � m  XY��
�� 
ctxt� m  Z]��
�� 
psxf� o      ���� 0 	theresult 	theResult� ���� Q  a����� Z dw������� = di��� o  de���� 0 	valuetype 	valueType� m  eh��
�� 
alis� r  ls��� c  lq��� o  lm���� 0 	theresult 	theResult� m  mp��
�� 
alis� o      ���� 0 	theresult 	theResult��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      ���� +��  � l ����� R  �����
�� .ascrerr ****      � ****� b  ����� m  ���� ��� 2 F i l e   p a t h   d o e s n  t   e x i s t :  � o  ������ 0 thevalue theValue� �����
�� 
errn� o  ������  0 _argvusererror _ArgvUserError��  �   file not found   � ���    f i l e   n o t   f o u n d��  v � � note: `file` is treated as synonym for `POSIX file` here, as actual 'file' object specifiers are both mostly pointless and much more problematic due to using HFS paths   w ���P   n o t e :   ` f i l e `   i s   t r e a t e d   a s   s y n o n y m   f o r   ` P O S I X   f i l e `   h e r e ,   a s   a c t u a l   ' f i l e '   o b j e c t   s p e c i f i e r s   a r e   b o t h   m o s t l y   p o i n t l e s s   a n d   m u c h   m o r e   p r o b l e m a t i c   d u e   t o   u s i n g   H F S   p a t h st ��� = ����� o  ������ 0 	valuetype 	valueType� m  ����
�� 
bool� ���� l ������ P  ������� Z  ������� E ����� J  ���� ��� m  ���� ���  t r u e� ��� m  ���� ���  y e s� ��� m  ���� ���  t� ��� m  ��   �  y� �� m  �� �  1��  � J  �� �� o  ������ 0 thevalue theValue��  � r  �� m  ����
�� boovtrue o      ���� 0 	theresult 	theResult� 	
	 E �� J  ��  m  �� � 
 f a l s e  m  �� �  n o  m  �� �  f  m  �� �  n �� m  �� �    0��   J  ��!! "��" o  ������ 0 thevalue theValue��  
 #��# r  ��$%$ m  ����
�� boovfals% o      ���� 0 	theresult 	theResult��  � R  ����&'
�� .ascrerr ****      � ****& b  ��()( m  ��** �++ 2 N o t    y e s    o r    n o    ( Y | N ) :  ) o  ������ 0 thevalue theValue' �,�~
� 
errn, o  ���}�}  0 _argvusererror _ArgvUserError�~  ��  � �|�{
�| conscase�{  � W Q may be used by boolean argument definitions (boolean options don't take a value)   � �-- �   m a y   b e   u s e d   b y   b o o l e a n   a r g u m e n t   d e f i n i t i o n s   ( b o o l e a n   o p t i o n s   d o n ' t   t a k e   a   v a l u e )��  � R  �
�z./
�z .ascrerr ****      � ****. m  	00 �11 r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) ./ �y23
�y 
errn2 m  ���x�x�Y3 �w45
�w 
erob4 l ��6�v�u6 N  ��77 n  ��898 o  ���t�t 0 	valuetype 	valueType9 o  ���s�s $0 definitionrecord definitionRecord�v  �u  5 �r:�q
�r 
errt: m   �p
�p 
type�q  � = 7 valueType is a type name (text, integer, boolean, etc)   � �;; n   v a l u e T y p e   i s   a   t y p e   n a m e   ( t e x t ,   i n t e g e r ,   b o o l e a n ,   e t c )� <�o< L  == o  �n�n 0 	theresult 	theResult�o  � >?> l     �m�l�k�m  �l  �k  ? @A@ l     �j�i�h�j  �i  �h  A BCB i  v yDED I      �gF�f�g 40 _defaultvalueplaceholder _defaultValuePlaceholderF G�eG o      �d�d $0 definitionrecord definitionRecord�e  �f  E l    �HIJH k     �KK LML r     
NON I     �cP�b�c 0 _asvaluetype _asValueTypeP Q�aQ n   RSR o    �`�` 0 	valuetype 	valueTypeS o    �_�_ $0 definitionrecord definitionRecord�a  �b  O o      �^�^ 0 	valuetype 	valueTypeM TUT l   VWXV Z   YZ�]�\Y =   [\[ n   ]^] m    �[
�[ 
pcls^ o    �Z�Z 0 	valuetype 	valueType\ m    �Y
�Y 
listZ L    __ m    `` �aa  O P T I O N�]  �\  W F @ (valueType is list of allowed text values, i.e. an enumeration)   X �bb �   ( v a l u e T y p e   i s   l i s t   o f   a l l o w e d   t e x t   v a l u e s ,   i . e .   a n   e n u m e r a t i o n )U cdc l   �Xef�X  e ^ X note: the following conditional block should implement same branches as in _unpackValue   f �gg �   n o t e :   t h e   f o l l o w i n g   c o n d i t i o n a l   b l o c k   s h o u l d   i m p l e m e n t   s a m e   b r a n c h e s   a s   i n   _ u n p a c k V a l u ed h�Wh Z    �ijkli =   mnm o    �V�V 0 	valuetype 	valueTypen m    �U
�U 
ctxtj L     "oo m     !pp �qq  T E X Tk rsr E  % .tut J   % *vv wxw m   % &�T
�T 
longx yzy m   & '�S
�S 
doubz {�R{ m   ' (�Q
�Q 
nmbr�R  u J   * -|| }�P} o   * +�O�O 0 	valuetype 	valueType�P  s ~~ Z   1 >���N�� =  1 4��� o   1 2�M�M 0 	valuetype 	valueType� m   2 3�L
�L 
long� L   7 9�� m   7 8�� ���  I N T E G E R�N  � L   < >�� m   < =�� ���  N U M B E R ��� E  A M��� J   A I�� ��� m   A B�K
�K 
furl� ��� m   B C�J
�J 
alis� ��� m   C D�I
�I 
file� ��H� m   D E�G
�G 
psxf�H  � J   I L�� ��F� o   I J�E�E 0 	valuetype 	valueType�F  � ��� L   P T�� m   P S�� ���  F I L E� ��� =  W \��� o   W X�D�D 0 	valuetype 	valueType� m   X [�C
�C 
bool� ��B� L   _ c�� m   _ b�� ���  Y | N�B  l R   f ��A��
�A .ascrerr ****      � ****� m   } ��� ��� r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .� �@��
�@ 
errn� m   j m�?�?�Y� �>��
�> 
erob� l  p t��=�<� N   p t�� n   p s��� o   q s�;�; 0 	valuetype 	valueType� o   p q�:�: $0 definitionrecord definitionRecord�=  �<  � �9��8
�9 
errt� m   w z�7
�7 
type�8  �W  I z t given an option/argument definition record, returns the appropriate default placeholderValue according to valueType   J ��� �   g i v e n   a n   o p t i o n / a r g u m e n t   d e f i n i t i o n   r e c o r d ,   r e t u r n s   t h e   a p p r o p r i a t e   d e f a u l t   p l a c e h o l d e r V a l u e   a c c o r d i n g   t o   v a l u e T y p eC ��� l     �6�5�4�6  �5  �4  � ��� l     �3�2�1�3  �2  �1  � ��� i  z }��� I      �0��/�0 *0 _formatdefaultvalue _formatDefaultValue� ��.� o      �-�- $0 definitionrecord definitionRecord�.  �/  � l    ����� k     ��� ��� r     ��� n     ��� o    �,�, 0 defaultvalue defaultValue� o     �+�+ $0 definitionrecord definitionRecord� o      �*�* 0 defaultvalue defaultValue� ��� Z   (���)�(� F    ��� >    ��� l   ��'�&� I   �%��
�% .corecnte****       ****� J    	�� ��$� o    �#�# 0 defaultvalue defaultValue�$  � �"��!
�" 
kocl� m   
 � 
�  
list�!  �'  �&  � m    ��  � =    ��� n    ��� 1    �
� 
leng� o    �� 0 defaultvalue defaultValue� m    �� � r    $��� n    "��� 4    "��
� 
cobj� m     !�� � o    �� 0 defaultvalue defaultValue� o      �� 0 defaultvalue defaultValue�)  �(  � ��� Z   ) ������ >   ) 4��� l  ) 2���� I  ) 2���
� .corecnte****       ****� J   ) ,�� ��� o   ) *�� 0 defaultvalue defaultValue�  � ���
� 
kocl� m   - .�
� 
ctxt�  �  �  � m   2 3��  � r   7 :��� o   7 8�� 0 defaultvalue defaultValue� o      �� 0 defaulttext defaultText� ��� G   = X��� >   = H��� l  = F���� I  = F�
��
�
 .corecnte****       ****� J   = @�� ��	� o   = >�� 0 defaultvalue defaultValue�	  � ���
� 
kocl� m   A B�
� 
long�  �  �  � m   F G��  � >   K V��� l  K T���� I  K T���
� .corecnte****       ****� J   K N	 	  	� 	 o   K L���� 0 defaultvalue defaultValue�   � ��	��
�� 
kocl	 m   O P��
�� 
doub��  �  �  � m   T U����  � 			 k   [ �		 			 r   [ h				 n  [ f	
		
 I   b f�������� 0 init  ��  ��  	 n  [ b			 I   ^ b�������� 	0 alloc  ��  ��  	 n  [ ^			 o   \ ^���� &0 nsnumberformatter NSNumberFormatter	 m   [ \��
�� misccura		 o      ���� 0 asocformatter asocFormatter	 			 n  i q			 I   j q��	���� "0 setnumberstyle_ setNumberStyle_	 	��	 l  j m	����	 n  j m			 o   k m���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle	 m   j k��
�� misccura��  ��  ��  ��  	 o   i j���� 0 asocformatter asocFormatter	 			 n  r �			 I   s ���	���� 0 
setlocale_ 
setLocale_	 	��	 l  s |	����	 n  s |	 	!	  I   x |�������� 0 systemlocale systemLocale��  ��  	! n  s x	"	#	" o   t x���� 0 nslocale NSLocale	# m   s t��
�� misccura��  ��  ��  ��  	 o   r s���� 0 asocformatter asocFormatter	 	$��	$ r   � �	%	&	% c   � �	'	(	' l  � �	)����	) n  � �	*	+	* I   � ���	,���� &0 stringfromnumber_ stringFromNumber_	, 	-��	- o   � ����� 0 defaultvalue defaultValue��  ��  	+ o   � ����� 0 asocformatter asocFormatter��  ��  	( m   � ���
�� 
****	& o      ���� 0 defaulttext defaultText��  	 	.	/	. G   � �	0	1	0 >   � �	2	3	2 l  � �	4����	4 I  � ���	5	6
�� .corecnte****       ****	5 J   � �	7	7 	8��	8 o   � ����� 0 defaultvalue defaultValue��  	6 ��	9��
�� 
kocl	9 m   � ���
�� 
furl��  ��  ��  	3 m   � �����  	1 >   � �	:	;	: l  � �	<����	< I  � ���	=	>
�� .corecnte****       ****	= J   � �	?	? 	@��	@ o   � ����� 0 defaultvalue defaultValue��  	> ��	A��
�� 
kocl	A m   � ���
�� 
alis��  ��  ��  	; m   � �����  	/ 	B	C	B r   � �	D	E	D n   � �	F	G	F 1   � ���
�� 
psxp	G o   � ����� 0 defaultvalue defaultValue	E o      ���� 0 defaulttext defaultText	C 	H	I	H =  � �	J	K	J o   � ����� 0 defaultvalue defaultValue	K m   � ���
�� boovtrue	I 	L	M	L r   � �	N	O	N m   � �	P	P �	Q	Q  Y	O o      ���� 0 defaulttext defaultText	M 	R	S	R =  � �	T	U	T o   � ����� 0 defaultvalue defaultValue	U m   � ���
�� boovfals	S 	V��	V r   � �	W	X	W m   � �	Y	Y �	Z	Z  N	X o      ���� 0 defaulttext defaultText��  � L   � �	[	[ m   � �	\	\ �	]	]  � 	^��	^ L   � �	_	_ b   � �	`	a	` b   � �	b	c	b m   � �	d	d �	e	e  D e f a u l t :   	c o   � ����� 0 defaulttext defaultText	a m   � �	f	f �	g	g   .  ��  � G A formats default value for inclusion in OPTIONS/ARGUMENTS section   � �	h	h �   f o r m a t s   d e f a u l t   v a l u e   f o r   i n c l u s i o n   i n   O P T I O N S / A R G U M E N T S   s e c t i o n� 	i	j	i l     ��������  ��  ��  	j 	k	l	k i  ~ �	m	n	m I      ��	o���� (0 _formatenumeration _formatEnumeration	o 	p��	p o      ���� 0 	valuetype 	valueType��  ��  	n k     J	q	q 	r	s	r s     	t	u	t o     ���� 0 	valuetype 	valueType	u o      ���� 0 enumlist enumList	s 	v	w	v X    %	x��	y	x r     	z	{	z b    	|	}	| b    	~		~ m    	�	� �	�	�  	 l   	�����	� n   	�	�	� 1    ��
�� 
pcnt	� o    ���� 0 textref textRef��  ��  	} m    	�	� �	�	�  	{ n     	�	�	� 1    ��
�� 
pcnt	� o    ���� 0 textref textRef�� 0 textref textRef	y o    	���� 0 enumlist enumList	w 	�	�	� Z  & =	�	�����	� ?   & +	�	�	� n  & )	�	�	� 1   ' )��
�� 
leng	� o   & '���� 0 enumlist enumList	� m   ) *���� 	� r   . 9	�	�	� b   . 4	�	�	� m   . /	�	� �	�	�  o r  	� n  / 3	�	�	� 4   0 3��	�
�� 
cobj	� m   1 2������	� o   / 0���� 0 enumlist enumList	� n     	�	�	� 4   5 8��	�
�� 
cobj	� m   6 7������	� o   4 5���� 0 enumlist enumList��  ��  	� 	���	� L   > J	�	� b   > I	�	�	� b   > G	�	�	� m   > ?	�	� �	�	�  T h i s   m u s t   b e :  	� I   ? F��	����� 0 	_jointext 	_joinText	� 	�	�	� o   @ A���� 0 enumlist enumList	� 	���	� m   A B	�	� �	�	�  ,  ��  ��  	� m   G H	�	� �	�	�  .  ��  	l 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��	�	���  	�  -----   	� �	�	� 
 - - - - -	� 	�	�	� l     ��	�	���  	�   parse ARGV   	� �	�	�    p a r s e   A R G V	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  � �	�	�	� I      ��	����� (0 _buildoptionstable _buildOptionsTable	� 	���	� o      ���� &0 optiondefinitions optionDefinitions��  ��  	� k    �	�	� 	�	�	� l     ��	�	���  	� � � create a case-sensitive lookup table of all short and long option names (e.g. "-a", "-A", "-o", "--output-file", etc); used by _parseOptions() to retrieve the definition record for each option it encounters   	� �	�	��   c r e a t e   a   c a s e - s e n s i t i v e   l o o k u p   t a b l e   o f   a l l   s h o r t   a n d   l o n g   o p t i o n   n a m e s   ( e . g .   " - a " ,   " - A " ,   " - o " ,   " - - o u t p u t - f i l e " ,   e t c ) ;   u s e d   b y   _ p a r s e O p t i o n s ( )   t o   r e t r i e v e   t h e   d e f i n i t i o n   r e c o r d   f o r   e a c h   o p t i o n   i t   e n c o u n t e r s	� 	�	�	� r     	�	�	� J     ����  	� o      ���� 0 
foundnames 
foundNames	� 	�	�	� r    	�	�	� n   	�	�	� I    �������� 0 
dictionary  ��  ��  	� n   	�	�	� o    ���� *0 nsmutabledictionary NSMutableDictionary	� m    ��
�� misccura	� o      ���� 20 optiondefinitionsbyname optionDefinitionsByName	� 	�	�	� X   �	���	�	� k   �	�	� 	�	�	� l   ;	�	�	�	� r    ;	�	�	� b    9	�	�	� l   $	���~	� c    $	�	�	� n   "	�	�	� 1     "�}
�} 
pcnt	� o     �|�| 0 	optionref 	optionRef	� m   " #�{
�{ 
reco�  �~  	� K   $ 8	�	� �z	�	��z 0 	shortname 	shortName	� m   % &	�	� �	�	�  	� �y	�	��y 0 longname longName	� m   ' (	�	� �	�	�  	� �x	�	��x 0 propertyname propertyName	� m   ) *	�	� �	�	�  	� �w	�	��w 0 	valuetype 	valueType	� m   + ,�v
�v 
ctxt	� �u	�	��u 0 islist isList	� m   / 0�t
�t boovfals	� �s	��r�s 0 defaultvalue defaultValue	� m   3 4�q
�q boovfals�r  	� o      �p�p $0 optiondefinition optionDefinition	� 5 / this defaultValue is only used by boolean opts   	� �	�	� ^   t h i s   d e f a u l t V a l u e   i s   o n l y   u s e d   b y   b o o l e a n   o p t s	� 	�	�	� Q   < y	�	�	�	� k   ? _	�	� 	�
 	� r   ? F


 c   ? D


 n  ? B


 o   @ B�o�o 0 propertyname propertyName
 o   ? @�n�n $0 optiondefinition optionDefinition
 m   B C�m
�m 
ctxt
 o      �l�l 0 propertyname propertyName
  
�k
 Z  G _

	�j�i
 =  G N




 n  G J


 o   H J�h�h 0 propertyname propertyName
 o   G H�g�g $0 optiondefinition optionDefinition
 m   J M

 �

  
	 R   Q [�f�e

�f .ascrerr ****      � ****�e  
 �d
�c
�d 
errn
 m   U X�b�b�\�c  �j  �i  �k  	� R      �a�`

�a .ascrerr ****      � ****�`  
 �_
�^
�_ 
errn
 d      

 m      �]�]��^  	� R   g y�\


�\ .ascrerr ****      � ****
 m   u x

 �

 � I n v a l i d   o p t i o n   d e f i n i t i o n   ( p r o p e r t y   n a m e   m u s t   b e   n o n - e m p t y   t e x t ) .
 �[


�[ 
errn
 m   k n�Z�Z�Y
 �Y
�X
�Y 
erob
 o   q r�W�W 0 	optionref 	optionRef�X  	� 


 r   z �


 n   z 
 
!
  1   { �V
�V 
leng
! o   z {�U�U 0 
foundnames 
foundNames
 o      �T�T 0 	namecount 	nameCount
 
"
#
" X   ��
$�S
%
$ k   ��
&
& 
'
(
' r   � �
)
*
) o   � ��R�R 0 aref aRef
* J      
+
+ 
,
-
, o      �Q�Q 0 thename theName
- 
.�P
. o      �O�O 0 
nameprefix 
namePrefix�P  
( 
/
0
/ Q   � �
1
2
3
1 r   � �
4
5
4 c   � �
6
7
6 o   � ��N�N 0 thename theName
7 m   � ��M
�M 
ctxt
5 o      �L�L 0 thename theName
2 R      �K�J
8
�K .ascrerr ****      � ****�J  
8 �I
9�H
�I 
errn
9 d      
:
: m      �G�G��H  
3 R   � ��F
;
<
�F .ascrerr ****      � ****
; m   � �
=
= �
>
> r I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t / l o n g   n a m e   m u s t   b e   t e x t ) .
< �E
?
@
�E 
errn
? m   � ��D�D�\
@ �C
A�B
�C 
erob
A o   � ��A�A 0 	optionref 	optionRef�B  
0 
B�@
B Z   ��
C
D�?�>
C >  � �
E
F
E o   � ��=�= 0 thename theName
F m   � �
G
G �
H
H  
D k   ��
I
I 
J
K
J Z  � �
L
M�<�;
L E  � �
N
O
N o   � ��:�: 0 
foundnames 
foundNames
O J   � �
P
P 
Q�9
Q o   � ��8�8 0 thename theName�9  
M R   � ��7
R
S
�7 .ascrerr ****      � ****
R m   � �
T
T �
U
U x I n v a l i d   o p t i o n   d e f i n i t i o n   ( f o u n d   d u p l i c a t e   s h o r t / l o n g   n a m e ) .
S �6
V
W
�6 
errn
V m   � ��5�5�Y
W �4
X�3
�4 
erob
X o   � ��2�2 0 	optionref 	optionRef�3  �<  �;  
K 
Y
Z
Y r   �
[
\
[ o   � ��1�1 0 thename theName
\ n      
]
^
]  ;   
^ o   � �0�0 0 
foundnames 
foundNames
Z 
_
`
_ P  �
a�/
b
a Z  
�
c
d�.
e
c =  

f
g
f n 

h
i
h 1  �-
�- 
leng
i o  
�,�, 0 
nameprefix 
namePrefix
g m  �+�+ 
d l A
j
k
l
j Z A
m
n�*�)
m l (
o�(�'
o G  (
p
q
p >  
r
s
r n 
t
u
t 1  �&
�& 
leng
u o  �%�% 0 thename theName
s m  �$�$ 
q H  $
v
v E #
w
x
w m  !
y
y �
z
z 4 a b c d e f g h i j k l m n o p q r s t u v w x y z
x o  !"�#�# 0 thename theName�(  �'  
n R  +=�"
{
|
�" .ascrerr ****      � ****
{ m  9<
}
} �
~
~ � I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t   n a m e   m u s t   b e   a   s i n g l e   A - Z   o r   a - z   c h a r a c t e r ) .
| �!

�
�! 
errn
 m  /2� � �Y
� �
��
� 
erob
� o  56�� 0 	optionref 	optionRef�  �*  �)  
k   validate short name   
l �
�
� (   v a l i d a t e   s h o r t   n a m e�.  
e l D�
�
�
�
� k  D�
�
� 
�
�
� Z D�
�
���
� G  Di
�
�
� G  D]
�
�
� =  DK
�
�
� n DI
�
�
� 1  EI�
� 
leng
� o  DE�� 0 thename theName
� m  IJ��  
� H  NY
�
� E NX
�
�
� m  NQ
�
� �
�
� 4 a b c d e f g h i j k l m n o p q r s t u v w x y z
� n QW
�
�
� 4  RW�
�
� 
cha 
� m  UV�� 
� o  QR�� 0 thename theName
� D  `e
�
�
� o  `a�� 0 thename theName
� m  ad
�
� �
�
�  -
� R  l~�
�
�
� .ascrerr ****      � ****
� m  z}
�
� �
�
� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   m u s t   s t a r t   w i t h   A - Z   o r   a - z   c h a r a c t e r ) .
� �
�
�
� 
errn
� m  ps���Y
� �
��
� 
erob
� o  vw�� 0 	optionref 	optionRef�  �  �  
� 
��
� X  ��
��
�
� Z ��
�
���

� H  ��
�
� E ��
�
�
� m  ��
�
� �
�
� J a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 -
� n ��
�
�
� 1  ���	
�	 
pcnt
� o  ���� 0 charref charRef
� R  ���
�
�
� .ascrerr ****      � ****
� m  ��
�
� �
�
� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   c a n   o n l y   c o n t a i n   A - Z ,   a - z ,   0 - 9   o r   h y p h e n   c h a r a c t e r s ) .
� �
�
�
� 
errn
� m  �����Y
� �
��
� 
erob
� o  ���� 0 	optionref 	optionRef�  �  �
  � 0 charref charRef
� o  ���� 0 thename theName�  
�   validate long name   
� �
�
� &   v a l i d a t e   l o n g   n a m e�/  
b � ��
�  conscase��  
` 
���
� l ��
�����
� n ��
�
�
� I  ����
����� &0 setobject_forkey_ setObject_forKey_
� 
�
�
� o  ������ $0 optiondefinition optionDefinition
� 
���
� l ��
�����
� b  ��
�
�
� o  ������ 0 
nameprefix 
namePrefix
� o  ������ 0 thename theName��  ��  ��  ��  
� o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  ��  ��  �?  �>  �@  �S 0 aref aRef
% J   � �
�
� 
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
� o   � ����� 0 	shortname 	shortName
� o   � ����� $0 optiondefinition optionDefinition
� 
���
� m   � �
�
� �
�
�  -��  
� 
���
� J   � �
�
� 
�
�
� n  � �
�
�
� o   � ����� 0 longname longName
� o   � ����� $0 optiondefinition optionDefinition
� 
���
� m   � �
�
� �
�
�  - -��  ��  
# 
���
� Z ��
�
�����
� =  ��
�
�
� n  ��
�
�
� 1  ����
�� 
leng
� o  ������ 0 
foundnames 
foundNames
� o  ������ 0 	namecount 	nameCount
� R  ����
�
�
�� .ascrerr ****      � ****
� m  ��
�
� �
�
� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .
� ��
�
�
�� 
errn
� m  �������Y
� ��
���
�� 
erob
� o  ������ 0 	optionref 	optionRef��  ��  ��  ��  �� 0 	optionref 	optionRef	� o    ���� &0 optiondefinitions optionDefinitions	� 
���
� L  ��
�
� o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  	� 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� i  � �
�
�
� I      ��
����� 0 _parseoptions _parseOptions
� 
�
�
� o      ���� 0 rawarguments rawArguments
� 
�
�
� o      ���� &0 optiondefinitions optionDefinitions
� 
���
� o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  
� k    n
�
� 
�
�
� l     ��
�
���  
�oi given a list of raw arguments passed to script's run handler, extract those items that are command option names and (where relevant) their corresponding values, converting those values to the required type and returning an NSMutableDictionary of option name-value pairs plus a list of any remaining (i.e. non-option) arguments to be passed to _parseArguments()   
� �
�
��   g i v e n   a   l i s t   o f   r a w   a r g u m e n t s   p a s s e d   t o   s c r i p t ' s   r u n   h a n d l e r ,   e x t r a c t   t h o s e   i t e m s   t h a t   a r e   c o m m a n d   o p t i o n   n a m e s   a n d   ( w h e r e   r e l e v a n t )   t h e i r   c o r r e s p o n d i n g   v a l u e s ,   c o n v e r t i n g   t h o s e   v a l u e s   t o   t h e   r e q u i r e d   t y p e   a n d   r e t u r n i n g   a n   N S M u t a b l e D i c t i o n a r y   o f   o p t i o n   n a m e - v a l u e   p a i r s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s   t o   b e   p a s s e d   t o   _ p a r s e A r g u m e n t s ( )
� 
�
�
� l     ��
� ��  
� 6 0 first build a lookup table of all known options     � `   f i r s t   b u i l d   a   l o o k u p   t a b l e   o f   a l l   k n o w n   o p t i o n s
�  r      I     ������ (0 _buildoptionstable _buildOptionsTable �� o    ���� &0 optiondefinitions optionDefinitions��  ��   o      ���� 20 optiondefinitionsbyname optionDefinitionsByName 	 r   	 

 n  	  I    �������� 0 
dictionary  ��  ��   n  	  o   
 ���� *0 nsmutabledictionary NSMutableDictionary m   	 
��
�� misccura o      ���� (0 asocparametersdict asocParametersDict	  l    r     m     �  = n      1    ��
�� 
txdl 1    ��
�� 
ascr P J note: a long option can use a space or '=' to separate its name and value    � �   n o t e :   a   l o n g   o p t i o n   c a n   u s e   a   s p a c e   o r   ' = '   t o   s e p a r a t e   i t s   n a m e   a n d   v a l u e  l   ����   R L consume raw arguments list until it is empty or a non-option is encountered    �   �   c o n s u m e   r a w   a r g u m e n t s   l i s t   u n t i l   i t   i s   e m p t y   o r   a   n o n - o p t i o n   i s   e n c o u n t e r e d !"! W   h#$# k   "c%% &'& r   " (()( n   " &*+* 4  # &��,
�� 
cobj, m   $ %���� + o   " #���� 0 rawarguments rawArguments) o      ���� 0 thearg theArg' -.- Z   ) /012/ C   ) ,343 o   ) *���� 0 thearg theArg4 m   * +55 �66  - -0 l  / m7897 k   / m:: ;<; Z   / @=>����= =  / 2?@? o   / 0���� 0 thearg theArg@ m   0 1AA �BB  - -> l  5 <CDEC k   5 <FF GHG r   5 :IJI n   5 8KLK 1   6 8��
�� 
restL o   5 6���� 0 rawarguments rawArgumentsJ o      ���� 0 rawarguments rawArgumentsH M��M  S   ; <��  D i c double-hypens terminates the option list, so anything left in rawArguments is positional arguments   E �NN �   d o u b l e - h y p e n s   t e r m i n a t e s   t h e   o p t i o n   l i s t ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s��  ��  < OPO l  A GQRSQ r   A GTUT n   A EVWV 4  B E��X
�� 
citmX m   C D���� W o   A B���� 0 thearg theArgU o      ���� 0 
optionname 
optionNameR   get "--NAME"   S �YY    g e t   " - - N A M E "P Z��Z Z   H m[\��][ ?   H Q^_^ l  H O`����` I  H O��ab
�� .corecnte****       ****a o   H I���� 0 thearg theArgb ��c��
�� 
koclc m   J K��
�� 
citm��  ��  ��  _ m   O P���� \ l  T edefd r   T eghg n   T `iji 7  U `��kl
�� 
ctxtk l  Y \m����m 4   Y \��n
�� 
citmn m   Z [���� ��  ��  l m   ] _������j o   T U���� 0 thearg theArgh n      opo 4  a d��q
�� 
cobjq m   b c���� p o   ` a���� 0 rawarguments rawArgumentse * $ put "VALUE" back on stack for later   f �rr H   p u t   " V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  ] l  h mstus r   h mvwv n   h kxyx 1   i k��
�� 
resty o   h i���� 0 rawarguments rawArgumentsw o      ���� 0 rawarguments rawArgumentst ( " remove the option name from stack   u �zz D   r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  8 < 6 found "--[NAME[=VALUE]]" (NAME is a long option name)   9 �{{ l   f o u n d   " - - [ N A M E [ = V A L U E ] ] "   ( N A M E   i s   a   l o n g   o p t i o n   n a m e )1 |}| C   p s~~ o   p q���� 0 thearg theArg m   q r�� ���  -} ���� l  v ����� k   v ��� ��� l  v ����� Z  v �������� G   v ���� =  v {��� o   v w���� 0 thearg theArg� m   w z�� ���  -� E  ~ ���� m   ~ ��� ���  0 1 2 3 4 5 6 7 8 9 0� n  � ���� 4   � ����
�� 
cha � m   � ����� � o   � ����� 0 thearg theArg�  S   � ���  ��  � � { it's a lone hyphen or a negative number (i.e. not an option), so treat it and rest of rawArguments as positional arguments   � ��� �   i t ' s   a   l o n e   h y p h e n   o r   a   n e g a t i v e   n u m b e r   ( i . e .   n o t   a n   o p t i o n ) ,   s o   t r e a t   i t   a n d   r e s t   o f   r a w A r g u m e n t s   a s   p o s i t i o n a l   a r g u m e n t s� ��� l  � ����� r   � ���� n   � ���� 7  � �����
�� 
ctxt� m   � ����� � m   � ����� � o   � ����� 0 thearg theArg� o      ���� 0 
optionname 
optionName�  	 get "-N"   � ���    g e t   " - N "� ���� Z   � ������� ?   � ���� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 thearg theArg� m   � ����� � l  � ����� k   � ��� ��� r   � ���� n   � ���� 7  � �����
�� 
ctxt� m   � ����� � m   � �������� o   � ����� 0 thearg theArg� n      ��� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 rawarguments rawArguments� ��� r   � ���� n  � ���� I   � ������� 0 objectforkey_ objectForKey_� ��~� o   � ��}�} 0 
optionname 
optionName�~  �  � o   � ��|�| 20 optiondefinitionsbyname optionDefinitionsByName� o      �{�{ $0 optiondefinition optionDefinition� ��z� Z   � ����y�x� F   � ���� >  � ���� o   � ��w�w $0 optiondefinition optionDefinition� m   � ��v
�v 
msng� =  � ���� n  � ���� o   � ��u�u 0 	valuetype 	valueType� l  � ���t�s� c   � ���� o   � ��r�r $0 optiondefinition optionDefinition� m   � ��q
�q 
****�t  �s  � m   � ��p
�p 
bool� r   � ���� b   � ���� m   � ��� ���  -� n   � ���� 4  � ��o�
�o 
cobj� m   � ��n�n � o   � ��m�m 0 rawarguments rawArguments� n      ��� 4  � ��l�
�l 
cobj� m   � ��k�k � o   � ��j�j 0 rawarguments rawArguments�y  �x  �z  � / ) put "[-N�]VALUE" back on stack for later   � ��� R   p u t   " [ - N & ] V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  � l  � ����� r   � ���� n   � ���� 1   � ��i
�i 
rest� o   � ��h�h 0 rawarguments rawArguments� o      �g�g 0 rawarguments rawArguments� ' !remove the option name from stack   � ��� B r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  � H B found "-N[N�][VALUE]" (N is a single-character short option name)   � ��� �   f o u n d   " - N [ N & ] [ V A L U E ] "   ( N   i s   a   s i n g l e - c h a r a c t e r   s h o r t   o p t i o n   n a m e )��  2 l  � ����  S   � � S M not an option name, so anything left in rawArguments is positional arguments   � ��� �   n o t   a n   o p t i o n   n a m e ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s. ��� l �f���f  � - ' look up the option's definition record   � ��� N   l o o k   u p   t h e   o p t i o n ' s   d e f i n i t i o n   r e c o r d� ��� r  	��� n ��� I  �e��d�e 0 objectforkey_ objectForKey_� ��c� o  �b�b 0 
optionname 
optionName�c  �d  � o  �a�a 20 optiondefinitionsbyname optionDefinitionsByName� o      �`�` $0 optiondefinition optionDefinition� ��� Z  
����_�^� = 
   o  
�]�] $0 optiondefinition optionDefinition m  �\
�\ 
msng� l � k  �  Z  t	�[�Z o  �Y�Y &0 hasdefaultoptions hasDefaultOptions	 k  p

  r  ? J  0  E " J    m   �  - h �X m   �  - - h e l p�X   J  ! �W o  �V�V 0 
optionname 
optionName�W   �U E ".  J  "*!! "#" m  "%$$ �%%  - v# &�T& m  %('' �((  - - v e r s i o n�T    J  *-)) *�S* o  *+�R�R 0 
optionname 
optionName�S  �U   J      ++ ,-, o      �Q�Q 0 ishelp isHelp- .�P. o      �O�O 0 	isversion 	isVersion�P   /�N/ Z  @p01�M�L0 G  @I232 o  @A�K�K 0 ishelp isHelp3 o  DE�J�J 0 	isversion 	isVersion1 l Ll4564 k  Ll77 898 n LQ:;: I  MQ�I�H�G�I $0 removeallobjects removeAllObjects�H  �G  ; o  LM�F�F (0 asocparametersdict asocParametersDict9 <=< n R[>?> I  S[�E@�D�E $0 setvalue_forkey_ setValue_forKey_@ ABA o  ST�C�C 0 ishelp isHelpB C�BC m  TWDD �EE  h e l p�B  �D  ? o  RS�A�A (0 asocparametersdict asocParametersDict= FGF n \eHIH I  ]e�@J�?�@ $0 setvalue_forkey_ setValue_forKey_J KLK o  ]^�>�> 0 	isversion 	isVersionL M�=M m  ^aNN �OO  v e r s i o n�=  �?  I o  \]�<�< (0 asocparametersdict asocParametersDictG PQP r  fjRSR J  fh�;�;  S o      �:�: 0 rawarguments rawArgumentsQ T�9T  S  kl�9  5  � ignore everything else and return a minimal record containing only `help` and `version` properties, one or both of which are true, so must be dealt with accordingly by `run` handler (i.e. format+log help text and return and/or return version number)   6 �UU�   i g n o r e   e v e r y t h i n g   e l s e   a n d   r e t u r n   a   m i n i m a l   r e c o r d   c o n t a i n i n g   o n l y   ` h e l p `   a n d   ` v e r s i o n `   p r o p e r t i e s ,   o n e   o r   b o t h   o f   w h i c h   a r e   t r u e ,   s o   m u s t   b e   d e a l t   w i t h   a c c o r d i n g l y   b y   ` r u n `   h a n d l e r   ( i . e .   f o r m a t + l o g   h e l p   t e x t   a n d   r e t u r n   a n d / o r   r e t u r n   v e r s i o n   n u m b e r )�M  �L  �N  �[  �Z   V�8V R  u��7WX
�7 .ascrerr ****      � ****W b  �YZY m  �[[ �\\   U n k n o w n   o p t i o n :  Z o  ���6�6 0 
optionname 
optionNameX �5]�4
�5 
errn] o  y~�3�3  0 _argvusererror _ArgvUserError�4  �8   A ; check for default options (help/version), else raise error    �^^ v   c h e c k   f o r   d e f a u l t   o p t i o n s   ( h e l p / v e r s i o n ) ,   e l s e   r a i s e   e r r o r�_  �^  � _`_ r  ��aba c  ��cdc o  ���2�2 $0 optiondefinition optionDefinitiond m  ���1
�1 
****b o      �0�0 $0 optiondefinition optionDefinition` efe r  ��ghg n ��iji o  ���/�/ 0 propertyname propertyNamej o  ���.�. $0 optiondefinition optionDefinitionh o      �-�- 0 propertyname propertyNamef klk l ���,mn�,  m #  now process the option value   n �oo :   n o w   p r o c e s s   t h e   o p t i o n   v a l u el pqp Z  �rs�+tr = ��uvu n ��wxw o  ���*�* 0 	valuetype 	valueTypex o  ���)�) $0 optiondefinition optionDefinitionv m  ���(
�( 
bools Q  ��yz{y r  ��|}| H  ��~~ n ��� o  ���'�' 0 defaultvalue defaultValue� o  ���&�& $0 optiondefinition optionDefinition} o      �%�% 0 thevalue theValuez R      �$�#�"
�$ .ascrerr ****      � ****�#  �"  { R  ���!��
�! .ascrerr ****      � ****� b  ����� m  ���� ��� J B a d   d e f a u l t V a l u e   f o r   b o o l e a n   o p t i o n :  � o  ��� �  0 
optionname 
optionName� ���
� 
errn� m  �����\� ���
� 
erob� l ������ N  ���� n  ����� o  ���� 0 defaultvalue defaultValue� o  ���� $0 optiondefinition optionDefinition�  �  �  �+  t k  ��� ��� Z ������� = ����� o  ���� 0 rawarguments rawArguments� J  ����  � R  �����
� .ascrerr ****      � ****� b  ����� m  ���� ��� 4 M i s s i n g   v a l u e   f o r   o p t i o n :  � o  ���� 0 
optionname 
optionName� ���
� 
errn� o  ����  0 _argvusererror _ArgvUserError�  �  �  � ��� r  ����� I  ������ 0 _unpackvalue _unpackValue� ��� n  ����� 4 ����
� 
cobj� m  ���� � o  ���
�
 0 rawarguments rawArguments� ��	� o  ���� $0 optiondefinition optionDefinition�	  �  � o      �� 0 thevalue theValue� ��� r  ���� n  ���� 1  ��
� 
rest� o  ���� 0 rawarguments rawArguments� o      �� 0 rawarguments rawArguments�  q ��� Z  [����� n 
��� o  	�� 0 islist isList� o  � �  $0 optiondefinition optionDefinition� l 7���� k  7�� ��� r  ��� n ��� I  ������� 0 objectforkey_ objectForKey_� ���� o  ���� 0 propertyname propertyName��  ��  � o  ���� (0 asocparametersdict asocParametersDict� o      ���� 0 thelist theList� ���� Z  7������ = ��� o  ���� 0 thelist theList� m  ��
�� 
msng� r  *��� n (��� I  #(������� $0 arraywithobject_ arrayWithObject_� ���� o  #$���� 0 thevalue theValue��  ��  � n #��� o  #����  0 nsmutablearray NSMutableArray� m  ��
�� misccura� o      ���� 0 thevalue theValue��  � k  -7�� ��� n -3��� I  .3������� 0 
addobject_ 
addObject_� ���� o  ./���� 0 thevalue theValue��  ��  � o  -.���� 0 thelist theList� ���� r  47��� o  45���� 0 thelist theList� o      ���� 0 thevalue theValue��  ��  � = 7 option can appear multiple times, so collect in a list   � ��� n   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s ,   s o   c o l l e c t   i n   a   l i s t� ��� > :D��� l :@������ n :@��� I  ;@������� 0 objectforkey_ objectForKey_� ���� o  ;<���� 0 propertyname propertyName��  ��  � o  :;���� (0 asocparametersdict asocParametersDict��  ��  � m  @C��
�� 
msng� ���� R  GW����
�� .ascrerr ****      � ****� b  QV��� m  QT�� ��� $ D u p l i c a t e   o p t i o n :  � o  TU���� 0 
optionname 
optionName� �����
�� 
errn� o  KP����  0 _argvusererror _ArgvUserError��  ��  �  � ���� n \c��� I  ]c������� &0 setobject_forkey_ setObject_forKey_� ��� o  ]^���� 0 thevalue theValue� ���� o  ^_���� 0 propertyname propertyName��  ��  � o  \]���� (0 asocparametersdict asocParametersDict��  $ =   !��� o    ���� 0 rawarguments rawArguments� J     ����  " ���� L  in�� J  im�� ��� o  ij���� (0 asocparametersdict asocParametersDict� ���� o  jk���� 0 rawarguments rawArguments��  ��  
� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      �� ���� (0 _adddefaultoptions _addDefaultOptions   o      ���� (0 asocparametersdict asocParametersDict �� o      ���� &0 optiondefinitions optionDefinitions��  ��  � k     �  X     ��� k    �		 

 r    " b      l   ���� c     o    ���� 0 recref recRef m    ��
�� 
reco��  ��   K     ���� 0 propertyname propertyName m     �   ���� 0 longname longName m     �   ������ 0 defaultvalue defaultValue o    ���� 0 novalue NoValue��   o      ���� 0 rec    r   # (  n  # &!"! o   $ &���� 0 propertyname propertyName" o   # $���� 0 rec    o      ���� 0 propertyname propertyName #$# Z  ) 8%&����% =  ) ,'(' o   ) *���� 0 propertyname propertyName( m   * +)) �**  & r   / 4+,+ n  / 2-.- o   0 2���� 0 longname longName. o   / 0���� 0 rec  , o      ���� 0 propertyname propertyName��  ��  $ /��/ Z   9 �01����0 =  9 A232 l  9 ?4����4 n  9 ?565 I   : ?��7���� 0 objectforkey_ objectForKey_7 8��8 o   : ;���� 0 propertyname propertyName��  ��  6 o   9 :���� (0 asocparametersdict asocParametersDict��  ��  3 m   ? @��
�� 
msng1 k   D �99 :;: r   D I<=< n  D G>?> o   E G���� 0 defaultvalue defaultValue? o   D E���� 0 rec  = o      ���� 0 defaultvalue defaultValue; @A@ Z   J �BC����B =  J QDED o   J K���� 0 defaultvalue defaultValueE o   K P���� 0 novalue NoValueC l  T �FGHF Z   T �IJ��KI =  T YLML n  T WNON o   U W���� 0 	valuetype 	valueTypeO o   T U���� 0 rec  M m   W X��
�� 
boolJ r   \ _PQP m   \ ]��
�� boovfalsQ o      ���� 0 defaultvalue defaultValue��  K k   b �RR STS r   b iUVU b   b gWXW m   b cYY �ZZ  - -X n  c f[\[ o   d f���� 0 longname longName\ o   c d���� 0 rec  V o      ���� 0 
optionname 
optionNameT ]^] Z  j �_`����_ =  j oaba o   j k���� 0 
optionname 
optionNameb m   k ncc �dd  - -` r   r }efe b   r {ghg m   r uii �jj  -h n  u zklk o   v z���� 0 	shortname 	shortNamel o   u v���� 0 rec  f o      ���� 0 
optionname 
optionName��  ��  ^ m��m R   � ���no
�� .ascrerr ****      � ****n b   � �pqp m   � �rr �ss 2 M i s s i n g   r e q u i r e d   o p t i o n :  q o   � ����� 0 
optionname 
optionNameo ��t��
�� 
errnt o   � �����  0 _argvusererror _ArgvUserError��  ��  G 2 , record doesn't have a defaultValue property   H �uu X   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y��  ��  A vwv Z  � �xy����x =  � �z{z o   � ����� 0 defaultvalue defaultValue{ m   � ���
�� 
msngy r   � �|}| n  � �~~ I   � �������� 0 null  ��  �   n  � ���� o   � ��~�~ 0 nsnull NSNull� m   � ��}
�} misccura} o      �|�| 0 defaultvalue defaultValue��  ��  w ��{� l  � ���z�y� n  � ���� I   � ��x��w�x &0 setobject_forkey_ setObject_forKey_� ��� o   � ��v�v 0 defaultvalue defaultValue� ��u� o   � ��t�t 0 propertyname propertyName�u  �w  � o   � ��s�s (0 asocparametersdict asocParametersDict�z  �y  �{  ��  ��  ��  �� 0 recref recRef o    �r�r &0 optiondefinitions optionDefinitions ��� l  � ��q���q  � k e add default 'help', 'version' properties to parameters dict (record) if not already supplied by user   � ��� �   a d d   d e f a u l t   ' h e l p ' ,   ' v e r s i o n '   p r o p e r t i e s   t o   p a r a m e t e r s   d i c t   ( r e c o r d )   i f   n o t   a l r e a d y   s u p p l i e d   b y   u s e r� ��p� X   � ���o�� Z  � ����n�m� =  � ���� l  � ���l�k� n  � ���� I   � ��j��i�j 0 objectforkey_ objectForKey_� ��h� l  � ���g�f� n  � ���� 1   � ��e
�e 
pcnt� o   � ��d�d "0 propertynameref propertyNameRef�g  �f  �h  �i  � o   � ��c�c (0 asocparametersdict asocParametersDict�l  �k  � m   � ��b
�b 
msng� l  � ���a�`� n  � ���� I   � ��_��^�_ &0 setobject_forkey_ setObject_forKey_� ��� m   � ��]
�] boovfals� ��\� l  � ���[�Z� n  � ���� 1   � ��Y
�Y 
pcnt� o   � ��X�X "0 propertynameref propertyNameRef�[  �Z  �\  �^  � o   � ��W�W (0 asocparametersdict asocParametersDict�a  �`  �n  �m  �o "0 propertynameref propertyNameRef� J   � ��� ��� m   � ��� ���  h e l p� ��V� m   � ��� ���  v e r s i o n�V  �p  � ��� l     �U�T�S�U  �T  �S  � ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O�N�M�O  �N  �M  � ��� l     �L�K�J�L  �K  �J  � ��� i  � ���� I      �I��H�I  0 _ordinalnumber _ordinalNumber� ��G� o      �F�F 0 n  �G  �H  � Z     7���E�� F     ��� E    ��� J     �� ��� m     �D�D � ��� m    �C�C � ��B� m    �A�A �B  � J    
�� ��@� `    ��� o    �?�? 0 n  � m    �>�> 
�@  � H    �� E   ��� J    �� ��� m    �=�= � ��� m    �<�< � ��;� m    �:�: �;  � J    �� ��9� `    ��� o    �8�8 0 n  � m    �7�7 d�9  � L    .�� b    -��� l   "��6�5� c    "��� o     �4�4 0 n  � m     !�3
�3 
ctxt�6  �5  � n   " ,��� 4   ' ,�2�
�2 
cobj� l  ( +��1�0� `   ( +��� o   ( )�/�/ 0 n  � m   ) *�.�. 
�1  �0  � J   " '�� ��� m   " #�� ���  s t� ��� m   # $�� ���  n d� ��-� m   $ %�� ���  r d�-  �E  � L   1 7�� b   1 6��� l  1 4��,�+� c   1 4��� o   1 2�*�* 0 n  � m   2 3�)
�) 
ctxt�,  �+  � m   4 5�� ���  t h� ��� l     �(�'�&�(  �'  �&  � ��� i  � �   I      �%�$�% 20 _normalizetrailingspace _normalizeTrailingSpace �# o      �"�" 0 thetext theText�#  �$   l    % k     % 	 P     "
�!
 l   ! Z   !� � F     ?    
 n    1    �
� 
leng o    �� 0 thetext theText m    	��   >    n    4    �
� 
cha  m    ���� o    �� 0 thetext theText m     �   r     b     !  o    �� 0 thetext theText! 1    �
� 
spac o      �� 0 thetext theText�   �   8 2 (hyphens, punctuation must already be considered)    �"" d   ( h y p h e n s ,   p u n c t u a t i o n   m u s t   a l r e a d y   b e   c o n s i d e r e d )�!   ��
� conswhit�  	 #�# L   # %$$ o   # $�� 0 thetext theText�   - ' append space to text only if necessary    �%% N   a p p e n d   s p a c e   t o   t e x t   o n l y   i f   n e c e s s a r y� &'& l     ����  �  �  ' ()( l     ����  �  �  ) *+* i  � �,-, I      �.�
� "0 _parsearguments _parseArguments. /0/ o      �	�	 0 argumentslist argumentsList0 121 o      �� *0 argumentdefinitions argumentDefinitions2 3�3 o      �� (0 asocparametersdict asocParametersDict�  �
  - k    �44 565 l     �78�  7 q k parse the remaining raw arguments, converting to the required type and adding to the parameters dictionary   8 �99 �   p a r s e   t h e   r e m a i n i n g   r a w   a r g u m e n t s ,   c o n v e r t i n g   t o   t h e   r e q u i r e d   t y p e   a n d   a d d i n g   t o   t h e   p a r a m e t e r s   d i c t i o n a r y6 :;: r     <=< m     ��  = o      �� 0 i  ; >?> r    	@A@ n   BCB 1    �
� 
lengC o    �� 0 argumentslist argumentsListA o      � �  0 argcount argCount? DED l  
 FGHF r   
 IJI m   
 ��
�� boovfalsJ o      ����  0 mustbeoptional mustBeOptionalG � � repeat loop will throw invalid argument definition error if an optional argument definition is followed by a required argument definition   H �KK   r e p e a t   l o o p   w i l l   t h r o w   i n v a l i d   a r g u m e n t   d e f i n i t i o n   e r r o r   i f   a n   o p t i o n a l   a r g u m e n t   d e f i n i t i o n   i s   f o l l o w e d   b y   a   r e q u i r e d   a r g u m e n t   d e f i n i t i o nE LML X   kN��ON k   fPP QRQ r    #STS [    !UVU o    ���� 0 i  V m     ���� T o      ���� 0 i  R WXW r   $ <YZY b   $ :[\[ l  $ )]����] c   $ )^_^ n  $ '`a` 1   % '��
�� 
pcnta o   $ %���� 0 argref argRef_ m   ' (��
�� 
reco��  ��  \ K   ) 9bb ��cd�� 0 propertyname propertyNamec m   * +ee �ff  d ��gh�� 0 	valuetype 	valueTypeg m   , -��
�� 
ctxth ��ij�� 0 islist isListi m   . /��
�� boovfalsj ��kl�� 0 defaultvalue defaultValuek o   0 5���� 0 novalue NoValuel ��m���� $0 valueplaceholder valuePlaceholderm m   6 7nn �oo  ��  Z o      ���� (0 argumentdefinition argumentDefinitionX pqp Z   = wrst��r >  = Fuvu n  = @wxw o   > @���� 0 defaultvalue defaultValuex o   = >���� (0 argumentdefinition argumentDefinitionv o   @ E���� 0 novalue NoValues r   I Lyzy m   I J��
�� boovtruez o      ����  0 mustbeoptional mustBeOptionalt {|{ F   O ^}~} o   O P����  0 mustbeoptional mustBeOptional~ =  S \� n  S V��� o   T V���� 0 defaultvalue defaultValue� o   S T���� (0 argumentdefinition argumentDefinition� o   V [���� 0 novalue NoValue| ���� R   a s����
�� .ascrerr ****      � ****� m   o r�� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( a   n o n - o p t i o n a l   a r g u m e n t   c a n n o t   f o l l o w   a n   o p t i o n a l   a r g u m e n t ) .� ����
�� 
errn� m   e h�����Y� �����
�� 
erob� o   k l���� 0 argref argRef��  ��  ��  q ��� Z  x �������� =  x ��� n  x {��� o   y {���� 0 propertyname propertyName� o   x y���� (0 argumentdefinition argumentDefinition� m   { ~�� ���  � R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   p r o p e r t y N a m e   p r o p e r t y ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 argref argRef��  ��  ��  � ��� Z   ������� =   � ���� o   � ����� 0 argumentslist argumentsList� J   � �����  � k   � ��� ��� r   � ���� n  � ���� o   � ����� 0 defaultvalue defaultValue� o   � ����� (0 argumentdefinition argumentDefinition� o      ���� 0 thevalue theValue� ���� Z   � �������� =  � ���� o   � ����� 0 thevalue theValue� o   � ����� 0 novalue NoValue� l  � ����� k   � ��� ��� r   � ���� n  � ���� o   � ����� $0 valueplaceholder valuePlaceholder� o   � ����� (0 argumentdefinition argumentDefinition� o      ���� "0 placeholdertext placeholderText� ��� Z  � �������� =   � ���� n  � ���� 1   � ���
�� 
leng� o   � ����� "0 placeholdertext placeholderText� m   � �����  � r   � ���� I   � �������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� "0 placeholdertext placeholderText��  ��  � ���� R   � �����
�� .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���  M i s s i n g  � I   � ��������  0 _ordinalnumber _ordinalNumber� ���� o   � ����� 0 i  ��  ��  � m   � ��� ��� :   r e q u i r e d   a r g u m e n t   ( e x p e c t e d  � o   � ����� "0 placeholdertext placeholderText� m   � ��� ���  ) .� �����
�� 
errn� o   � �����  0 _argvusererror _ArgvUserError��  ��  � W Q record doesn't have a defaultValue property, so user should've supplied argument   � ��� �   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y ,   s o   u s e r   s h o u l d ' v e   s u p p l i e d   a r g u m e n t��  ��  ��  ��  � k   ��� ��� r   � ���� I   � �������� 0 _unpackvalue _unpackValue� ��� n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 argumentslist argumentsList� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� 0 thevalue theValue� ���� r   ���� n   ���� 1   ���
�� 
rest� o   � ����� 0 argumentslist argumentsList� o      ���� 0 argumentslist argumentsList��  � ��� Z  \������� n 
��� o  	���� 0 islist isList� o  ���� (0 argumentdefinition argumentDefinition� k  X�� ��� Z +������� A  ��� o  ���� 0 i  � n  ��� 1  ��
�� 
leng� o  ���� *0 argumentdefinitions argumentDefinitions� R  '����
�� .ascrerr ****      � ****� m  #&�� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( o n l y   t h e   l a s t   a r g u m e n t   d e f i n i t i o n   m a y   c o n t a i n   a n    i s L i s t : t r u e    p r o p e r t y ) .� ����
�� 
errn� m  �����Y� �� ��
�� 
erob  o   ���� 0 argref argRef��  ��  ��  �  r  ,1 J  ,/ �� o  ,-���� 0 thevalue theValue��   o      ���� 0 thevalue theValue  X  2S	��
	 r  BN I  BK������ 0 _unpackvalue _unpackValue  n CF 1  DF��
�� 
pcnt o  CD���� 0 aref aRef �� o  FG���� (0 argumentdefinition argumentDefinition��  ��   n        ;  LM o  KL���� 0 thevalue theValue�� 0 aref aRef
 o  56���� 0 argumentslist argumentsList �� r  TX J  TV����   o      ���� 0 argumentslist argumentsList��  ��  ��  � �� l ]f���� n ]f I  ^f����� &0 setobject_forkey_ setObject_forKey_  o  ^_�~�~ 0 thevalue theValue �} l _b �|�{  n _b!"! o  `b�z�z 0 propertyname propertyName" o  _`�y�y (0 argumentdefinition argumentDefinition�|  �{  �}  �   o  ]^�x�x (0 asocparametersdict asocParametersDict��  ��  ��  �� 0 argref argRefO o    �w�w *0 argumentdefinitions argumentDefinitionsM #�v# Z l�$%�u�t$ > lp&'& o  lm�s�s 0 argumentslist argumentsList' J  mo�r�r  % R  s��q()
�q .ascrerr ****      � ****( b  }�*+* b  }�,-, b  }�./. b  }�010 m  }�22 �33 : T o o   m a n y   a r g u m e n t s   ( e x p e c t e d  1 n  ��454 1  ���p
�p 
leng5 o  ���o�o *0 argumentdefinitions argumentDefinitions/ m  ��66 �77    b u t   r e c e i v e d  - o  ���n�n 0 argcount argCount+ m  ��88 �99  ) .) �m:�l
�m 
errn: o  w|�k�k  0 _argvusererror _ArgvUserError�l  �u  �t  �v  + ;<; l     �j�i�h�j  �i  �h  < =>= l     �g�f�e�g  �f  �e  > ?@? l     �dAB�d  A  -----   B �CC 
 - - - - -@ DED l     �cFG�c  F ) # format built-in help documentation   G �HH F   f o r m a t   b u i l t - i n   h e l p   d o c u m e n t a t i o nE IJI l     �b�a�`�b  �a  �`  J KLK i  � �MNM I      �_O�^�_  0 _formatoptions _formatOptionsO PQP o      �]�] &0 optiondefinitions optionDefinitionsQ RSR o      �\�\ 0 vtstyle vtStyleS T�[T o      �Z�Z &0 hasdefaultoptions hasDefaultOptions�[  �^  N k    +UU VWV l     �YXY�Y  X ] W generates OPTIONS section, along with options synopsis for inclusion in autogenerated    Y �ZZ �   g e n e r a t e s   O P T I O N S   s e c t i o n ,   a l o n g   w i t h   o p t i o n s   s y n o p s i s   f o r   i n c l u s i o n   i n   a u t o g e n e r a t e d  W [\[ Z    ]^�X�W] F     _`_ =    aba o     �V�V &0 optiondefinitions optionDefinitionsb J    �U�U  ` H    	cc o    �T�T &0 hasdefaultoptions hasDefaultOptions^ L    dd J    ee fgf m    hh �ii  g j�Sj m    kk �ll  �S  �X  �W  \ mnm r    3opo J    qq rsr m    tt �uu  s vwv m    xx �yy  w z�Rz m    {{ �||  �R  p J      }} ~~ o      �Q�Q  0 defaultoptions defaultOptions ��� o      �P�P  0 booleanoptions booleanOptions� ��O� o      �N�N 0 otheroptions otherOptions�O  n ��� r   4 ?��� b   4 =��� b   4 9��� n  4 7��� o   5 7�M�M 0 b  � o   4 5�L�L 0 vtstyle vtStyle� m   7 8�� ���  O P T I O N S� n  9 <��� o   : <�K�K 0 n  � o   9 :�J�J 0 vtstyle vtStyle� o      �I�I  0 optionssection optionsSection� ��� X   @S��H�� k   PN�� ��� r   P ~��� b   P |��� l  P S��G�F� c   P S��� o   P Q�E�E 0 	optionref 	optionRef� m   Q R�D
�D 
reco�G  �F  � K   S {�� �C���C 0 	shortname 	shortName� m   T U�� ���  � �B���B 0 longname longName� m   V Y�� ���  � �A���A 0 	valuetype 	valueType� m   \ _�@
�@ 
ctxt� �?���? 0 islist isList� m   b c�>
�> boovfals� �=���= 0 defaultvalue defaultValue� o   f k�<�< 0 novalue NoValue� �;���; $0 valueplaceholder valuePlaceholder� m   n q�� ���  � �:��9�: $0 valuedescription valueDescription� m   t w�� ���  �9  � o      �8�8 $0 optiondefinition optionDefinition� ��� Q    ����� k   � ��� ��� r   � ���� c   � ���� n  � ���� o   � ��7�7 0 	shortname 	shortName� o   � ��6�6 $0 optiondefinition optionDefinition� m   � ��5
�5 
ctxt� o      �4�4 0 	shortname 	shortName� ��� r   � ���� c   � ���� n  � ���� o   � ��3�3 0 longname longName� o   � ��2�2 $0 optiondefinition optionDefinition� m   � ��1
�1 
ctxt� o      �0�0 0 longname longName� ��� r   � ���� I   � ��/��.�/ 0 _asvaluetype _asValueType� ��-� n  � ���� o   � ��,�, 0 	valuetype 	valueType� o   � ��+�+ $0 optiondefinition optionDefinition�-  �.  � o      �*�* 0 	valuetype 	valueType� ��� r   � ���� c   � ���� n  � ���� o   � ��)�) 0 islist isList� o   � ��(�( $0 optiondefinition optionDefinition� m   � ��'
�' 
bool� o      �&�& 0 islist isList� ��� r   � ���� c   � ���� n  � ���� o   � ��%�% $0 valueplaceholder valuePlaceholder� o   � ��$�$ $0 optiondefinition optionDefinition� m   � ��#
�# 
ctxt� o      �"�" $0 valueplaceholder valuePlaceholder� ��!� r   � ���� I   � �� ���  20 _normalizetrailingspace _normalizeTrailingSpace� ��� c   � ���� n  � ���� o   � ��� $0 valuedescription valueDescription� o   � ��� $0 optiondefinition optionDefinition� m   � ��
� 
ctxt�  �  � o      �� $0 valuedescription valueDescription�!  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� d      �� m      ����  � n  � ���� I   � ����� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��� &0 optiondefinitions optionDefinitions� ��� m   � ��� ���  o p t i o n s� ��� m   � ��
� 
list� ��� b   � ���� m   � ��� ��� | n o t   a   v a l i d   l i s t   o f    c o m m a n d   l i n e   o p t i o n   d e f i n i t i o n    r e c o r d s :  � o   � ��� 0 etext eText�  �  � o   � ��� 0 _support  �    r   � � b   � � b   � � o   � ���  0 optionssection optionsSection o   � ��� 
0 lf2 LF2 o   � ��� 0 indent1 Indent1 o      �
�
  0 optionssection optionsSection 	 Z   �W
�	
 =  � � o   � ��� 0 	shortname 	shortName m   � � �   k  /  Z �� =  o  �� 0 longname longName m   �   R  	�
� .ascrerr ****      � **** m   � � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) . �
� 
errn m  ���Y � � 
� 
erob  o  ���� 0 	optionref 	optionRef�   �  �   !"! r   %#$# o   !���� 0 longname longName$ o      ���� 0 
optionname 
optionName" %��% r  &/&'& b  &-()( b  &+*+* o  &'����  0 optionssection optionsSection+ m  '*,, �--  - -) o  +,���� 0 longname longName' o      ����  0 optionssection optionsSection��  �	   k  2W.. /0/ r  27121 o  23���� 0 	shortname 	shortName2 o      ���� 0 
optionname 
optionName0 343 r  8A565 b  8?787 b  8=9:9 o  89����  0 optionssection optionsSection: m  9<;; �<<  -8 o  =>���� 0 	shortname 	shortName6 o      ����  0 optionssection optionsSection4 =��= Z BW>?����> > BG@A@ o  BC���� 0 longname longNameA m  CFBB �CC  ? r  JSDED b  JQFGF b  JOHIH o  JK����  0 optionssection optionsSectionI m  KNJJ �KK  ,   - -G o  OP���� 0 longname longNameE o      ����  0 optionssection optionsSection��  ��  ��  	 LML Z  X2NO��PN = X[QRQ o  XY���� 0 	valuetype 	valueTypeR m  YZ��
�� 
boolO l ^eSTUS r  ^eVWV b  ^cXYX o  ^_����  0 booleanoptions booleanOptionsY o  _b���� 0 
optionname 
optionNameW o      ����  0 booleanoptions booleanOptionsT ) # group all boolean flags as "[-N�]"   U �ZZ F   g r o u p   a l l   b o o l e a n   f l a g s   a s   " [ - N & ] "��  P k  h2[[ \]\ r  hw^_^ > hs`a` n hmbcb o  im���� 0 defaultvalue defaultValuec o  hi���� $0 optiondefinition optionDefinitiona o  mr���� 0 novalue NoValue_ o      ���� 0 
isoptional 
isOptional] ded r  xfgf b  x}hih o  xy���� 0 otheroptions otherOptionsi 1  y|��
�� 
spacg o      ���� 0 otheroptions otherOptionse jkj Z ��lm����l o  ������ 0 
isoptional 
isOptionalm r  ��non b  ��pqp o  ������ 0 otheroptions otherOptionsq m  ��rr �ss  [o o      ���� 0 otheroptions otherOptions��  ��  k tut r  ��vwv b  ��xyx b  ��z{z o  ������ 0 otheroptions otherOptions{ m  ��|| �}}  -y o  ������ 0 
optionname 
optionNamew o      ���� 0 otheroptions otherOptionsu ~~ r  ����� o  ������ $0 valueplaceholder valuePlaceholder� o      ���� $0 valueplaceholder valuePlaceholder ��� Z ��������� = ����� o  ������ $0 valueplaceholder valuePlaceholder� m  ���� ���  � r  ����� I  ��������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� o  ������ $0 optiondefinition optionDefinition��  ��  � o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� r  ����� b  ����� b  ����� n ����� o  ������ 0 u  � o  ������ 0 vtstyle vtStyle� o  ������ $0 valueplaceholder valuePlaceholder� n ����� o  ������ 0 n  � o  ������ 0 vtstyle vtStyle� o      ���� $0 valueplaceholder valuePlaceholder� ��� r  ����� b  ����� b  ����� o  ������ 0 otheroptions otherOptions� 1  ����
�� 
spac� o  ������ $0 valueplaceholder valuePlaceholder� o      ���� 0 otheroptions otherOptions� ��� Z ��������� o  ������ 0 
isoptional 
isOptional� r  ����� b  ����� o  ������ 0 otheroptions otherOptions� m  ���� ���  ]� o      ���� 0 otheroptions otherOptions��  ��  � ��� r  ����� b  ����� b  ����� o  ������  0 optionssection optionsSection� 1  ����
�� 
spac� o  ������ $0 valueplaceholder valuePlaceholder� o      ����  0 optionssection optionsSection� ��� Z �������� = ����� n ����� m  ����
�� 
pcls� o  ������ 0 	valuetype 	valueType� m  ����
�� 
list� r  ���� b  ����� o  ������ $0 valuedescription valueDescription� I  ��������� (0 _formatenumeration _formatEnumeration� ���� o  ������ 0 	valuetype 	valueType��  ��  � o      ���� $0 valuedescription valueDescription��  ��  � ��� Z "������� > ��� n ��� o  ���� 0 defaultvalue defaultValue� o  ���� $0 optiondefinition optionDefinition� o  ���� 0 novalue NoValue� r  ��� b  ��� o  ���� $0 valuedescription valueDescription� I  ������� *0 _formatdefaultvalue _formatDefaultValue� ���� o  ���� $0 optiondefinition optionDefinition��  ��  � o      ���� $0 valuedescription valueDescription��  ��  � ���� Z #2������� o  #$���� 0 islist isList� r  '.��� b  ',��� o  '(���� $0 valuedescription valueDescription� m  (+�� ��� N T h i s   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s .  � o      ���� $0 valuedescription valueDescription��  ��  ��  M ���� Z 3N������� > 38��� o  34���� $0 valuedescription valueDescription� m  47�� ���  � r  ;J��� b  ;H��� b  ;F��� b  ;@��� o  ;<����  0 optionssection optionsSection� 1  <?��
�� 
lnfd� o  @E���� 0 indent2 Indent2� o  FG���� $0 valuedescription valueDescription� o      ����  0 optionssection optionsSection��  ��  ��  �H 0 	optionref 	optionRef� o   C D���� &0 optiondefinitions optionDefinitions� ��� l TT������  � � document default -h and -v options as needed (these will appear at bottom of OPTIONS section, which isn't aesthetically ideal but is simplest to implement and avoids messing with the order of the option definitions specified by the shell script's author)   � ����   d o c u m e n t   d e f a u l t   - h   a n d   - v   o p t i o n s   a s   n e e d e d   ( t h e s e   w i l l   a p p e a r   a t   b o t t o m   o f   O P T I O N S   s e c t i o n ,   w h i c h   i s n ' t   a e s t h e t i c a l l y   i d e a l   b u t   i s   s i m p l e s t   t o   i m p l e m e n t   a n d   a v o i d s   m e s s i n g   w i t h   t h e   o r d e r   o f   t h e   o p t i o n   d e f i n i t i o n s   s p e c i f i e d   b y   t h e   s h e l l   s c r i p t ' s   a u t h o r )� ��� Z  T�������� o  TU���� &0 hasdefaultoptions hasDefaultOptions� k  X��� ��� Z  X�������� H  X^�� E  X]��� o  XY����  0 booleanoptions booleanOptions� m  Y\�� ���  h� k  a��� ��� r  ah��� b  af   m  ad �  h o  de����  0 defaultoptions defaultOptions� o      ����  0 defaultoptions defaultOptions� �� r  i� b  i� b  i�	
	 b  i~ b  iz b  iv b  ip o  ij����  0 optionssection optionsSection o  jo���� 
0 lf2 LF2 o  pu���� 0 indent1 Indent1 m  vy �  - h ,   - - h e l p 1  z}��
�� 
lnfd
 o  ~����� 0 indent2 Indent2 m  �� � 2 P r i n t   t h i s   h e l p   a n d   e x i t . o      ����  0 optionssection optionsSection��  ��  ��  � �� Z  ������ H  �� E  �� o  ������  0 booleanoptions booleanOptions m  �� �  v k  ��  !  r  ��"#" b  ��$%$ o  ������  0 defaultoptions defaultOptions% m  ��&& �''  v# o      ��  0 defaultoptions defaultOptions! (�~( r  ��)*) b  ��+,+ b  ��-.- b  ��/0/ b  ��121 b  ��343 b  ��565 o  ���}�}  0 optionssection optionsSection6 o  ���|�| 
0 lf2 LF24 o  ���{�{ 0 indent1 Indent12 m  ��77 �88  - v ,   - - v e r s i o n0 1  ���z
�z 
lnfd. o  ���y�y 0 indent2 Indent2, m  ��99 �:: < P r i n t   v e r s i o n   n u m b e r   a n d   e x i t .* o      �x�x  0 optionssection optionsSection�~  ��  ��  ��  ��  ��  � ;<; r  ��=>= m  ��?? �@@  > o      �w�w "0 optionssynopsis optionsSynopsis< ABA Z ��CD�v�uC > ��EFE o  ���t�t  0 defaultoptions defaultOptionsF m  ��GG �HH  D r  ��IJI b  ��KLK b  ��MNM b  ��OPO o  ���s�s "0 optionssynopsis optionsSynopsisP m  ��QQ �RR    [ -N o  ���r�r  0 defaultoptions defaultOptionsL m  ��SS �TT  ]J o      �q�q "0 optionssynopsis optionsSynopsis�v  �u  B UVU Z �WX�p�oW > ��YZY o  ���n�n  0 booleanoptions booleanOptionsZ m  ��[[ �\\  X r  �	]^] b  �_`_ b  �aba b  ��cdc o  ���m�m "0 optionssynopsis optionsSynopsisd m  ��ee �ff    [ -b o  � �l�l  0 booleanoptions booleanOptions` m  gg �hh  ]^ o      �k�k "0 optionssynopsis optionsSynopsis�p  �o  V iji Z #kl�j�ik > mnm o  �h�h 0 otheroptions otherOptionsn m  oo �pp  l r  qrq b  sts o  �g�g "0 optionssynopsis optionsSynopsist o  �f�f 0 otheroptions otherOptionsr o      �e�e "0 optionssynopsis optionsSynopsis�j  �i  j u�du L  $+vv J  $*ww xyx o  $'�c�c "0 optionssynopsis optionsSynopsisy z�bz o  '(�a�a  0 optionssection optionsSection�b  �d  L {|{ l     �`�_�^�`  �_  �^  | }~} l     �]�\�[�]  �\  �[  ~ � i  � ���� I      �Z��Y�Z $0 _formatarguments _formatArguments� ��� o      �X�X *0 argumentdefinitions argumentDefinitions� ��W� o      �V�V 0 vtstyle vtStyle�W  �Y  � k    s�� ��� Z    ���U�T� =    ��� o     �S�S *0 argumentdefinitions argumentDefinitions� J    �R�R  � L    �� J    �� ��� m    �� ���  � ��Q� m    	�� ���  �Q  �U  �T  � ��� r    ��� m    �� ���  � o      �P�P &0 argumentssynopsis argumentsSynopsis� ��� r     ��� b    ��� b    ��� n   ��� o    �O�O 0 b  � o    �N�N 0 vtstyle vtStyle� m    �� ���  A R G U M E N T S� n   ��� o    �M�M 0 n  � o    �L�L 0 vtstyle vtStyle� o      �K�K $0 argumentssection argumentsSection� ��� X   !i��J�� k   1d�� ��� r   1 M��� b   1 K��� l  1 4��I�H� c   1 4��� o   1 2�G�G 0 argumentref argumentRef� m   2 3�F
�F 
reco�I  �H  � K   4 J�� �E���E 0 	valuetype 	valueType� m   5 6�D
�D 
ctxt� �C���C 0 islist isList� m   7 8�B
�B boovfals� �A���A 0 defaultvalue defaultValue� o   9 >�@�@ 0 novalue NoValue� �?���? $0 valueplaceholder valuePlaceholder� m   ? @�� ���  � �>��=�> $0 valuedescription valueDescription� m   C F�� ���  �=  � o      �<�< (0 argumentdefinition argumentDefinition� ��� Q   N ����� k   Q |�� ��� r   Q [��� I   Q Y�;��:�; 0 _asvaluetype _asValueType� ��9� n  R U��� o   S U�8�8 0 	valuetype 	valueType� o   R S�7�7 (0 argumentdefinition argumentDefinition�9  �:  � o      �6�6 0 	valuetype 	valueType� ��� r   \ e��� c   \ c��� n  \ _��� o   ] _�5�5 0 islist isList� o   \ ]�4�4 (0 argumentdefinition argumentDefinition� m   _ b�3
�3 
bool� o      �2�2 0 islist isList� ��� r   f m��� c   f k��� n  f i��� o   g i�1�1 $0 valueplaceholder valuePlaceholder� o   f g�0�0 (0 argumentdefinition argumentDefinition� m   i j�/
�/ 
ctxt� o      �.�. $0 valueplaceholder valuePlaceholder� ��-� r   n |��� I   n z�,��+�, 20 _normalizetrailingspace _normalizeTrailingSpace� ��*� c   o v��� n  o t��� o   p t�)�) $0 valuedescription valueDescription� o   o p�(�( (0 argumentdefinition argumentDefinition� m   t u�'
�' 
ctxt�*  �+  � o      �&�& $0 valuedescription valueDescription�-  � R      �%�$�
�% .ascrerr ****      � ****�$  � �#��"
�# 
errn� d      �� m      �!�!��"  � n  � ���� I   � �� ���  60 throwinvalidparametertype throwInvalidParameterType� ��� o   � ��� *0 argumentdefinitions argumentDefinitions� ��� m   � ��� ���  a r g u m e n t s� ��� m   � ��
� 
reco� ��� m   � ��� ��� d l i s t   o f    c o m m a n d   l i n e   a r g u m e n t   d e f i n i t i o n    r e c o r d s�  �  � o   � ��� 0 _support  � � � Z  � ��� =  � � o   � ��� $0 valueplaceholder valuePlaceholder m   � � �   r   � � I   � ��	�� 40 _defaultvalueplaceholder _defaultValuePlaceholder	 
�
 o   � ��� (0 argumentdefinition argumentDefinition�  �   o      �� $0 valueplaceholder valuePlaceholder�  �     r   � � b   � � b   � � n  � � o   � ��� 0 u   o   � ��� 0 vtstyle vtStyle o   � ��� $0 valueplaceholder valuePlaceholder n  � � o   � ��� 0 n   o   � ��� 0 vtstyle vtStyle o      �� $0 valueplaceholder valuePlaceholder  Z  � ��� o   � ��
�
 0 islist isList r   � � b   � � o   � ��	�	 $0 valueplaceholder valuePlaceholder m   � � �      . . . o      �� $0 valueplaceholder valuePlaceholder�  �   !"! r   � �#$# b   � �%&% b   � �'(' b   � �)*) o   � ��� $0 argumentssection argumentsSection* o   � ��� 
0 lf2 LF2( o   � ��� 0 indent1 Indent1& o   � ��� $0 valueplaceholder valuePlaceholder$ o      �� $0 argumentssection argumentsSection" +,+ Z  � �-.��- =  � �/0/ n  � �121 m   � �� 
�  
pcls2 o   � ����� 0 	valuetype 	valueType0 m   � ���
�� 
list. r   � �343 b   � �565 o   � ����� $0 valuedescription valueDescription6 I   � ���7���� (0 _formatenumeration _formatEnumeration7 8��8 o   � ����� 0 	valuetype 	valueType��  ��  4 o      ���� $0 valuedescription valueDescription�  �  , 9:9 Z  �;<����; >  �=>= n  � �?@? o   � ����� 0 defaultvalue defaultValue@ o   � ����� (0 argumentdefinition argumentDefinition> o   � ���� 0 novalue NoValue< r  ABA b  CDC o  ���� $0 valuedescription valueDescriptionD I  ��E���� *0 _formatdefaultvalue _formatDefaultValueE F��F o  ���� (0 argumentdefinition argumentDefinition��  ��  B o      ���� $0 valuedescription valueDescription��  ��  : GHG Z "IJ����I o  ���� 0 islist isListJ r  KLK b  MNM o  ���� $0 valuedescription valueDescriptionN m  OO �PP R T h i s   a r g u m e n t   c a n   a p p e a r   m u l t i p l e   t i m e s .  L o      ���� $0 valuedescription valueDescription��  ��  H QRQ Z #>ST����S > #(UVU o  #$���� $0 valuedescription valueDescriptionV m  $'WW �XX  T r  +:YZY b  +8[\[ b  +6]^] b  +0_`_ o  +,���� $0 argumentssection argumentsSection` 1  ,/��
�� 
lnfd^ o  05���� 0 indent2 Indent2\ o  67���� $0 valuedescription valueDescriptionZ o      ���� $0 argumentssection argumentsSection��  ��  R aba Z ?Zcd����c > ?Hefe n ?Bghg o  @B���� 0 defaultvalue defaultValueh o  ?@���� (0 argumentdefinition argumentDefinitionf o  BG���� 0 novalue NoValued r  KViji b  KTklk b  KPmnm m  KNoo �pp  [n o  NO���� $0 valueplaceholder valuePlaceholderl m  PSqq �rr  ]j o      ���� $0 valueplaceholder valuePlaceholder��  ��  b s��s r  [dtut b  [bvwv b  [`xyx o  [\���� &0 argumentssynopsis argumentsSynopsisy 1  \_��
�� 
spacw o  `a���� $0 valueplaceholder valuePlaceholderu o      ���� &0 argumentssynopsis argumentsSynopsis��  �J 0 argumentref argumentRef� o   $ %���� *0 argumentdefinitions argumentDefinitions� z��z L  js{{ J  jr|| }~} b  jo� m  jm�� ��� 
   [ - - ]� o  mn���� &0 argumentssynopsis argumentsSynopsis~ ���� o  op���� $0 argumentssection argumentsSection��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ��������  ��  ��  � ��� i  � ���� I     ����
�� .Fil:Argvnull���     ****� l 
    ������ o      ���� 0 argv  ��  ��  � ����
�� 
OpsD� |����������  ��  � o      ���� &0 optiondefinitions optionDefinitions��  � l 
    ������ J      ����  ��  ��  � ����
�� 
OpsA� |����������  ��  � o      ���� *0 argumentdefinitions argumentDefinitions��  � l 
    ������ J      ����  ��  ��  � �����
�� 
DefO� |����������  ��  � o      ���� &0 hasdefaultoptions hasDefaultOptions��  � l     ������ m      ��
�� boovtrue��  ��  ��  � k     ��� ��� l     ������  ��� note: while NSUserDefaults provides some argument parsing support (see its NSArgumentDomain), it uses an atypical syntax and reads directly from argv, making it difficult both to omit arguments provided to osascript itself and to extract any arguments remaining after options are parsed; thus, this handler implements its own argv parser that avoids NSUserDefaults' deficiencies while also providing a better optparse-style UI/UX to both shell script authors and users   � ����   n o t e :   w h i l e   N S U s e r D e f a u l t s   p r o v i d e s   s o m e   a r g u m e n t   p a r s i n g   s u p p o r t   ( s e e   i t s   N S A r g u m e n t D o m a i n ) ,   i t   u s e s   a n   a t y p i c a l   s y n t a x   a n d   r e a d s   d i r e c t l y   f r o m   a r g v ,   m a k i n g   i t   d i f f i c u l t   b o t h   t o   o m i t   a r g u m e n t s   p r o v i d e d   t o   o s a s c r i p t   i t s e l f   a n d   t o   e x t r a c t   a n y   a r g u m e n t s   r e m a i n i n g   a f t e r   o p t i o n s   a r e   p a r s e d ;   t h u s ,   t h i s   h a n d l e r   i m p l e m e n t s   i t s   o w n   a r g v   p a r s e r   t h a t   a v o i d s   N S U s e r D e f a u l t s '   d e f i c i e n c i e s   w h i l e   a l s o   p r o v i d i n g   a   b e t t e r   o p t p a r s e - s t y l e   U I / U X   t o   b o t h   s h e l l   s c r i p t   a u t h o r s   a n d   u s e r s� ���� P     ����� k    ��� ��� r    
��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ���� Q    ����� k    m�� ��� l   ������  � ) # first, ensure parameters are lists   � ��� F   f i r s t ,   e n s u r e   p a r a m e t e r s   a r e   l i s t s� ��� r    ��� n   ��� I    ������� "0 aslistparameter asListParameter� ��� o    ���� 0 argv  � ���� m    �� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 argv  � ��� r    )��� n   '��� I   ! '������� "0 aslistparameter asListParameter� ��� o   ! "���� &0 optiondefinitions optionDefinitions� ���� m   " #�� ���  ��  ��  � o    !���� 0 _support  � o      ���� &0 optiondefinitions optionDefinitions� ��� r   * 7��� n  * 5��� I   / 5������� "0 aslistparameter asListParameter� ��� o   / 0���� *0 argumentdefinitions argumentDefinitions� ���� m   0 1�� ���  ��  ��  � o   * /���� 0 _support  � o      ���� *0 argumentdefinitions argumentDefinitions� ��� l  8 8������  � � � next iterate over the raw argument list, identifying option names and (if non-boolean) values, returning a NSMutableDictionary of parsed option values plus a list of any remaining (i.e. non-option) arguments   � ����   n e x t   i t e r a t e   o v e r   t h e   r a w   a r g u m e n t   l i s t ,   i d e n t i f y i n g   o p t i o n   n a m e s   a n d   ( i f   n o n - b o o l e a n )   v a l u e s ,   r e t u r n i n g   a   N S M u t a b l e D i c t i o n a r y   o f   p a r s e d   o p t i o n   v a l u e s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s� ��� r   8 Q��� I      ������ 0 _parseoptions _parseOptions� ��� n   9 <��� 2  : <�
� 
cobj� o   9 :�� 0 argv  � ��� o   < =�� &0 optiondefinitions optionDefinitions� ��� o   = >�� &0 hasdefaultoptions hasDefaultOptions�  �  � J      �� ��� o      �� (0 asocparametersdict asocParametersDict� ��� o      �� 0 argumentslist argumentsList�  � ��� l  R R����  � v p add default values for any missing options to asocParametersDict, raising error if a required option is missing   � ��� �   a d d   d e f a u l t   v a l u e s   f o r   a n y   m i s s i n g   o p t i o n s   t o   a s o c P a r a m e t e r s D i c t ,   r a i s i n g   e r r o r   i f   a   r e q u i r e d   o p t i o n   i s   m i s s i n g� ��� I   R Y���� (0 _adddefaultoptions _addDefaultOptions� ��� o   S T�� (0 asocparametersdict asocParametersDict�  �  o   T U�� &0 optiondefinitions optionDefinitions�  �  �  l  Z Z��   b \ parse the remaining arguments as named positional parameters, adding them to the dictionary    � �   p a r s e   t h e   r e m a i n i n g   a r g u m e n t s   a s   n a m e d   p o s i t i o n a l   p a r a m e t e r s ,   a d d i n g   t h e m   t o   t h e   d i c t i o n a r y  I   Z b��~� "0 _parsearguments _parseArguments 	
	 o   [ \�}�} 0 argumentslist argumentsList
  o   \ ]�|�| *0 argumentdefinitions argumentDefinitions �{ o   ] ^�z�z (0 asocparametersdict asocParametersDict�{  �~    r   c h o   c d�y�y 0 oldtids oldTIDs n      1   e g�x
�x 
txdl 1   d e�w
�w 
ascr �v l  i m L   i m c   i l o   i j�u�u (0 asocparametersdict asocParametersDict m   j k�t
�t 
**** : 4 coerce the dictionary to an AS record and return it    � h   c o e r c e   t h e   d i c t i o n a r y   t o   a n   A S   r e c o r d   a n d   r e t u r n   i t�v  � R      �s
�s .ascrerr ****      � **** o      �r�r 0 etext eText �q
�q 
errn o      �p�p 0 enumber eNumber �o !
�o 
erob  o      �n�n 0 efrom eFrom! �m"�l
�m 
errt" o      �k�k 
0 eto eTo�l  � k   u �## $%$ r   u z&'& o   u v�j�j 0 oldtids oldTIDs' n     ()( 1   w y�i
�i 
txdl) 1   v w�h
�h 
ascr% *�g* Z   { �+,�f-+ =   { �./. o   { |�e�e 0 enumber eNumber/ o   | ��d�d  0 _argvusererror _ArgvUserError, R   � ��c01
�c .ascrerr ****      � ****0 o   � ��b�b 0 etext eText1 �a23
�a 
errn2 o   � ��`�` 0 enumber eNumber3 �_45
�_ 
erob4 o   � ��^�^ 0 efrom eFrom5 �]6�\
�] 
errt6 o   � ��[�[ 
0 eto eTo�\  �f  - I   � ��Z7�Y�Z 
0 _error  7 898 m   � �:: �;; 8 p a r s e   c o m m a n d   l i n e   a r g u m e n t s9 <=< o   � ��X�X 0 etext eText= >?> o   � ��W�W 0 enumber eNumber? @A@ o   � ��V�V 0 efrom eFromA B�UB o   � ��T�T 
0 eto eTo�U  �Y  �g  ��  � �SC
�S conscaseC �RD
�R consdiacD �QE
�Q conshyphE �PF
�P conspuncF �O�N
�O conswhit�N  � �M�L
�M consnume�L  ��  � GHG l     �K�J�I�K  �J  �I  H IJI l     �H�G�F�H  �G  �F  J KLK i  � �MNM I     �E�DO
�E .Fil:FHlpnull��� ��� null�D  O �CPQ
�C 
NameP |�B�AR�@S�B  �A  R o      �?�? 0 commandname commandName�@  S l 
    T�>�=T l     U�<�;U m      VV �WW  �<  �;  �>  �=  Q �:XY
�: 
SummX |�9�8Z�7[�9  �8  Z o      �6�6 $0 shortdescription shortDescription�7  [ l 
    \�5�4\ l     ]�3�2] m      ^^ �__  �3  �2  �5  �4  Y �1`a
�1 
Usag` |�0�/b�.c�0  �/  b o      �-�- "0 commandsynopses commandSynopses�.  c l 
    d�,�+d J      �*�*  �,  �+  a �)ef
�) 
OpsDe |�(�'g�&h�(  �'  g o      �%�% &0 optiondefinitions optionDefinitions�&  h l 
    i�$�#i J      �"�"  �$  �#  f �!jk
�! 
OpsAj |� �l�m�   �  l o      �� *0 argumentdefinitions argumentDefinitions�  m l 
    n��n J      ��  �  �  k �op
� 
Docuo |��q�r�  �  q o      �� "0 longdescription longDescription�  r l 
    s��s l     t��t m      uu �vv  �  �  �  �  p �wx
� 
VFmtw |��y�z�  �  y o      �� 0 isstyled isStyled�  z l 
    {��
{ l     |�	�| m      �
� boovtrue�	  �  �  �
  x �}�
� 
DefO} |��~��  �  ~ o      �� &0 hasdefaultoptions hasDefaultOptions�   l     �� ��� m      ��
�� boovtrue�   ��  �  N P    *���� Q   )���� k   �� ��� r    ��� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    ���� 0 commandname commandName� ���� m    �� ���  n a m e��  ��  � o    ���� 0 _support  � o      ���� 0 commandname commandName� ��� r    #��� n   !��� I    !������� "0 aslistparameter asListParameter� ��� o    ���� &0 optiondefinitions optionDefinitions� ���� m    �� ���  ��  ��  � o    ���� 0 _support  � o      ���� &0 optiondefinitions optionDefinitions� ��� r   $ 1��� n  $ /��� I   ) /������� "0 aslistparameter asListParameter� ��� o   ) *���� *0 argumentdefinitions argumentDefinitions� ���� m   * +�� ���  ��  ��  � o   $ )���� 0 _support  � o      ���� *0 argumentdefinitions argumentDefinitions� ��� r   2 ?��� n  2 =��� I   7 =������� "0 aslistparameter asListParameter� ��� o   7 8���� "0 commandsynopses commandSynopses� ���� m   8 9�� ���  ��  ��  � o   2 7���� 0 _support  � o      ���� "0 commandsynopses commandSynopses� ��� r   @ M��� n  @ K��� I   E K������� "0 astextparameter asTextParameter� ��� o   E F���� $0 shortdescription shortDescription� ���� m   F G�� ���  s u m m a r y��  ��  � o   @ E���� 0 _support  � o      ���� $0 shortdescription shortDescription� ��� r   N [��� n  N Y��� I   S Y������� "0 astextparameter asTextParameter� ��� o   S T���� "0 longdescription longDescription� ���� m   T U�� ���  d o c u m e n t a t i o n��  ��  � o   N S���� 0 _support  � o      ���� "0 longdescription longDescription� ��� Z   \ ������� n  \ g��� I   a g������� (0 asbooleanparameter asBooleanParameter� ��� o   a b���� 0 isstyled isStyled� ���� m   b c�� ���  t e r m i n a l   s t y l e s��  ��  � o   \ a���� 0 _support  � l  j ����� r   j ���� K   j ��� ������ 0 n  � I   k q������� 0 vt100 VT100� ���� m   l m����  ��  ��  � ������ 0 b  � I   r x������� 0 vt100 VT100� ���� m   s t���� ��  ��  � ������� 0 u  � I   y �������� 0 vt100 VT100� ���� m   z }���� ��  ��  ��  � o      ���� 0 vtstyle vtStyle�   normal, bold, underline   � ��� 0   n o r m a l ,   b o l d ,   u n d e r l i n e��  � r   � ���� K   � ��� ������ 0 n  � m   � ��� ���  � ������ 0 b  � m   � ��� ���  � ������ 0 u  � m   � ��� ���  �  � o      �� 0 vtstyle vtStyle� ��� l  � ��� �  � %  construct NAME summary section     � >   c o n s t r u c t   N A M E   s u m m a r y   s e c t i o n�  Z   � ��� =  � � o   � ��� 0 commandname commandName m   � � �		   l  � �

 Q   � � r   � � n   � � 4   � ��
� 
cobj m   � ����� l  � ��� I  � ���
� .Fil:SplPnull���     ctxt l  � ��� n   � � o   � ��� 0 _   l  � ��� I  � ����
� .Fil:EnVanull��� ��� null�  �  �  �  �  �  �  �  �   o      �� 0 commandname commandName R      ���
� .ascrerr ****      � ****�  �   l  � � r   � � m   � �   �!!  C O M M A N D o      �� 0 commandname commandName T N fallback on the offchance the above should fail to get the script's file name    �"" �   f a l l b a c k   o n   t h e   o f f c h a n c e   t h e   a b o v e   s h o u l d   f a i l   t o   g e t   t h e   s c r i p t ' s   f i l e   n a m e B < use the AppleScript shell script's own file name by default    �## x   u s e   t h e   A p p l e S c r i p t   s h e l l   s c r i p t ' s   o w n   f i l e   n a m e   b y   d e f a u l t�  �   $%$ r   � �&'& b   � �()( b   � �*+* b   � �,-, b   � �./. b   � �010 n  � �232 o   � ��� 0 b  3 o   � ��� 0 vtstyle vtStyle1 m   � �44 �55  N A M E/ n  � �676 o   � ��� 0 n  7 o   � ��� 0 vtstyle vtStyle- o   � ��� 
0 lf2 LF2+ o   � ��� 0 indent1 Indent1) o   � ��� 0 commandname commandName' o      �� 0 helptext helpText% 898 Z   � �:;��: >  � �<=< o   � ��� $0 shortdescription shortDescription= m   � �>> �??  ; r   � �@A@ b   � �BCB b   � �DED o   � ��� 0 helptext helpTextE m   � �FF �GG    - -  C o   � ��� $0 shortdescription shortDescriptionA o      �� 0 helptext helpText�  �  9 HIH l   �JK�  J B < construct default SYNOPSIS, OPTIONS, and ARGUMENTS sections   K �LL x   c o n s t r u c t   d e f a u l t   S Y N O P S I S ,   O P T I O N S ,   a n d   A R G U M E N T S   s e c t i o n sI MNM r   OPO I      �Q��  0 _formatoptions _formatOptionsQ RSR o  �� &0 optiondefinitions optionDefinitionsS TUT o  �� 0 vtstyle vtStyleU V�V o  �� &0 hasdefaultoptions hasDefaultOptions�  �  P J      WW XYX o      �� 00 defaultoptionssynopsis defaultOptionsSynopsisY Z�Z o      ��  0 optionssection optionsSection�  N [\[ r  6]^] I      �_�� $0 _formatarguments _formatArguments_ `a` o  �� *0 argumentdefinitions argumentDefinitionsa b�b o  �� 0 vtstyle vtStyle�  �  ^ J      cc ded o      �� 40 defaultargumentssynopsis defaultArgumentsSynopsise f�f o      �� $0 argumentssection argumentsSection�  \ ghg r  7Liji b  7Jklk b  7Fmnm b  7Bopo b  7>qrq o  78�� 0 helptext helpTextr o  8=�� 
0 lf2 LF2p n >Asts o  ?A�� 0 b  t o  >?�� 0 vtstyle vtStylen m  BEuu �vv  S Y N O P S I Sl n FIwxw o  GI�� 0 n  x o  FG�� 0 vtstyle vtStylej o      �� 0 helptext helpTexth yzy Z  Ma{|��~{ = MQ}~} o  MN�}�} "0 commandsynopses commandSynopses~ J  NP�|�|  | r  T]� J  T[�� ��{� b  TY��� b  TW��� o  TU�z�z 0 commandname commandName� o  UV�y�y 00 defaultoptionssynopsis defaultOptionsSynopsis� o  WX�x�x 40 defaultargumentssynopsis defaultArgumentsSynopsis�{  � o      �w�w "0 commandsynopses commandSynopses�  �~  z ��� Q  b����� X  e���v�� r  y���� b  y���� b  y���� b  y���� o  yz�u�u 0 helptext helpText� o  z�t�t 
0 lf2 LF2� o  ���s�s 0 indent1 Indent1� o  ���r�r 0 textref textRef� o      �q�q 0 helptext helpText�v 0 textref textRef� o  hi�p�p "0 commandsynopses commandSynopses� R      �o�n�
�o .ascrerr ****      � ****�n  � �m��l
�m 
errn� d      �� m      �k�k��l  � n ����� I  ���j��i�j 60 throwinvalidparametertype throwInvalidParameterType� ��� o  ���h�h "0 commandsynopses commandSynopses� ��� m  ���� ���  s y n o p s i s� ��� m  ���g
�g 
list� ��f� m  ���� ���  l i s t   o f   t e x t�f  �i  � o  ���e�e 0 _support  � ��� Z �����d�c� > ����� o  ���b�b  0 optionssection optionsSection� m  ���� ���  � r  ����� b  ����� b  ����� o  ���a�a 0 helptext helpText� o  ���`�` 
0 lf2 LF2� o  ���_�_  0 optionssection optionsSection� o      �^�^ 0 helptext helpText�d  �c  � ��� Z �����]�\� > ����� o  ���[�[ $0 argumentssection argumentsSection� m  ���� ���  � r  ����� b  ����� b  ����� o  ���Z�Z 0 helptext helpText� o  ���Y�Y 
0 lf2 LF2� o  ���X�X $0 argumentssection argumentsSection� o      �W�W 0 helptext helpText�]  �\  � ��� l ���V���V  � - ' add long DESCRIPTION section, if given   � ��� N   a d d   l o n g   D E S C R I P T I O N   s e c t i o n ,   i f   g i v e n� ��� Z  ����U�T� > ����� o  ���S�S "0 longdescription longDescription� m  ���� ���  � r  ���� b  � ��� b  ����� b  ����� b  ����� b  ����� b  ����� o  ���R�R 0 helptext helpText� o  ���Q�Q 
0 lf2 LF2� n ����� o  ���P�P 0 b  � o  ���O�O 0 vtstyle vtStyle� m  ���� ���  D E S C R I P T I O N� n ����� o  ���N�N 0 n  � o  ���M�M 0 vtstyle vtStyle� o  ���L�L 
0 lf2 LF2� o  ���K�K "0 longdescription longDescription� o      �J�J 0 helptext helpText�U  �T  � ��I� L  �� b  ��� o  �H�H 0 helptext helpText� 1  �G
�G 
lnfd�I  � R      �F��
�F .ascrerr ****      � ****� o      �E�E 0 etext eText� �D��
�D 
errn� o      �C�C 0 enumber eNumber� �B��
�B 
erob� o      �A�A 0 efrom eFrom� �@��?
�@ 
errt� o      �>�> 
0 eto eTo�?  � I  )�=��<�= 
0 _error  � ��� m  �� ��� 0 f o r m a t   c o m m a n d   l i n e   h e l p� ��� o  �;�; 0 etext eText� ��� o  �:�: 0 enumber eNumber� ��� o   �9�9 0 efrom eFrom� ��8� o   #�7�7 
0 eto eTo�8  �<  � �6�
�6 conscase� �5�
�5 consdiac� �4�
�4 conshyph� �3�
�3 conspunc� �2�1
�2 conswhit�1  � �0�/
�0 consnume�/  L � � l     �.�-�,�.  �-  �,     l     �+�*�)�+  �*  �)    l     �(�'�&�(  �'  �&    i  � � I     �%�$�#
�% .Fil:CurFnull��� ��� null�$  �#   Q     :	
	 k    (  r     n    I   
 �"�!� �" ,0 currentdirectorypath currentDirectoryPath�!  �    n   
 I    
����  0 defaultmanager defaultManager�  �   n    o    �� 0 nsfilemanager NSFileManager m    �
� misccura o      �� 0 asocpath asocPath  Z   !�� =    o    �� 0 asocpath asocPath m    �
� 
msng R    �
� .ascrerr ****      � **** m     �    N o t   a v a i l a b l e . �!�
� 
errn! m    ���@�  �  �   "�" L   " (## c   " '$%$ c   " %&'& o   " #�� 0 asocpath asocPath' m   # $�
� 
ctxt% m   % &�
� 
psxf�  
 R      �()
� .ascrerr ****      � ****( o      �� 0 etext eText) �*+
� 
errn* o      �
�
 0 enumber eNumber+ �	,-
�	 
erob, o      �� 0 efrom eFrom- �.�
� 
errt. o      �� 
0 eto eTo�   I   0 :�/�� 
0 _error  / 010 m   1 222 �33 2 c u r r e n t   w o r k i n g   d i r e c t o r y1 454 o   2 3�� 0 etext eText5 676 o   3 4�� 0 enumber eNumber7 898 o   4 5� �  0 efrom eFrom9 :��: o   5 6���� 
0 eto eTo��  �   ;<; l     ��������  ��  ��  < =>= l     ��������  ��  ��  > ?@? i  � �ABA I     ������
�� .Fil:EnVanull��� ��� null��  ��  B L     CC c     DED l    F����F n    GHG I    �������� 0 environment  ��  ��  H n    IJI I    �������� 0 processinfo processInfo��  ��  J n    KLK o    ���� 0 nsprocessinfo NSProcessInfoL m     ��
�� misccura��  ��  E m    ��
�� 
****@ MNM l     ��������  ��  ��  N OPO l     ��������  ��  ��  P QRQ i  � �STS I     ����U
�� .Fil:RSInnull��� ��� null��  U ��VW
�� 
PrmtV |����X��Y��  ��  X o      ���� 0 
prompttext 
promptText��  Y l     Z����Z m      [[ �\\  > >  ��  ��  W ��]��
�� 
ReTo] |����^��_��  ��  ^ o      ���� 0 isinteractive isInteractive��  _ l     `����` m      ��
�� boovfals��  ��  ��  T Q     �abca k    �dd efe r    ghg n   
iji I    
�������� :0 filehandlewithstandardinput fileHandleWithStandardInput��  ��  j n   klk o    ���� 0 nsfilehandle NSFileHandlel m    ��
�� misccurah o      ���� 0 	asocstdin 	asocStdinf mnm Z    =op��qo o    ���� 0 isinteractive isInteractivep k    3rr sts I   ��uv
�� .Fil:WSOunull���     ctxtu o    ���� 0 
prompttext 
promptTextv ��wx
�� 
SLiBw m    ��
�� boovfalsx ��w��
�� 
ALiE��  t yzy r    "{|{ n    }~} I     �������� 0 availabledata availableData��  ��  ~ o    ���� 0 	asocstdin 	asocStdin| o      �� 0 asocdata asocDataz � Z  # 3����� =   # *��� n  # (��� I   $ (���� 
0 length  �  �  � o   # $�� 0 asocdata asocData� m   ( )��  � L   - /�� m   - .�
� 
msng�  �  �  ��  q r   6 =��� n  6 ;��� I   7 ;���� *0 readdatatoendoffile readDataToEndOfFile�  �  � o   6 7�� 0 	asocstdin 	asocStdin� o      �� 0 asocdata asocDatan ��� r   > O��� n  > M��� I   E M���� 00 initwithdata_encoding_ initWithData_encoding_� ��� o   E F�� 0 asocdata asocData� ��� l  F I���� n  F I��� o   G I�� ,0 nsutf8stringencoding NSUTF8StringEncoding� m   F G�
� misccura�  �  �  �  � n  > E��� I   A E���� 	0 alloc  �  �  � n  > A��� o   ? A�� 0 nsstring NSString� m   > ?�
� misccura� o      �� 0 
asocstring 
asocString� ��� Z  P d����� =  P S��� o   P Q�� 0 
asocstring 
asocString� m   Q R�
� 
msng� R   V `���
� .ascrerr ****      � ****� m   \ _�� ��� > I n p u t   i s   n o t   U T F 8 - e n c o d e d   t e x t .� ���
� 
errn� m   X [���\�  �  �  � ��� Z  e ������ n  e m��� I   f m���� 0 
hassuffix_ 
hasSuffix_� ��� 1   f i�
� 
lnfd�  �  � o   e f�� 0 
asocstring 
asocString� r   p ~��� n  p |��� I   q |���� &0 substringtoindex_ substringToIndex_� ��� l  q x���� \   q x��� l  q v���� n  q v��� I   r v���� 
0 length  �  �  � o   q r�� 0 
asocstring 
asocString�  �  � m   v w�� �  �  �  �  � o   p q�� 0 
asocstring 
asocString� o      �� 0 
asocstring 
asocString�  �  � ��� L   � ��� c   � ���� o   � ��� 0 
asocstring 
asocString� m   � ��
� 
ctxt�  b R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� �~��
�~ 
erob� o      �}�} 0 efrom eFrom� �|��{
�| 
errt� o      �z�z 
0 eto eTo�{  c I   � ��y��x�y 
0 _error  � ��� m   � ��� ��� 0 r e a d   f r o m   s t a n d a r d   i n p u t� ��� o   � ��w�w 0 etext eText� ��� o   � ��v�v 0 enumber eNumber� ��� o   � ��u�u 0 efrom eFrom� ��t� o   � ��s�s 
0 eto eTo�t  �x  R ��� l     �r�q�p�r  �q  �p  � ��� l     �o�n�m�o  �n  �m  � ��� i  � ���� I     �l��
�l .Fil:WSOunull���     ctxt� o      �k�k 0 thetext theText� �j��
�j 
SLiB� |�i�h��g��i  �h  � o      �f�f 0 uselinefeeds useLinefeeds�g  � l     ��e�d� m      �c
�c boovtrue�e  �d  � �b��a
�b 
ALiE� |�`�_��^��`  �_  � o      �]�]  0 withlineending withLineEnding�^  � l     ��\�[� m      �Z
�Z boovtrue�\  �[  �a  � Q     ����� k    �� ��� r    ��� n   ��� I    �Y��X�Y &0 asnsmutablestring asNSMutableString� ��W� n   ��� I    �V��U�V "0 astextparameter asTextParameter� ��� o    �T�T 0 thetext theText� ��S� m    �� ���  �S  �U  � o    �R�R 0 _support  �W  �X  � o    �Q�Q 0 _support  � o      �P�P 0 
asocstring 
asocString� ��� Z    I���O�N� o    �M�M 0 uselinefeeds useLinefeeds� k    E�� ��� n   2   I    2�L�K�L l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_  l 
  "�J�I l   "�H�G b    " o     �F
�F 
ret  1     !�E
�E 
lnfd�H  �G  �J  �I   	
	 l  " #�D�C 1   " #�B
�B 
lnfd�D  �C  
  m   # $�A�A   �@ K   $ . �?�? 0 location   m   % &�>�>   �=�<�= 
0 length   n  ' , I   ( ,�;�:�9�; 
0 length  �:  �9   o   ' (�8�8 0 
asocstring 
asocString�<  �@  �K   o    �7�7 0 
asocstring 
asocString� �6 n  3 E I   4 E�5�4�5 l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_  l 
 4 5�3�2 l  4 5�1�0 o   4 5�/
�/ 
ret �1  �0  �3  �2    l  5 6�.�- 1   5 6�,
�, 
lnfd�.  �-    !  m   6 7�+�+  ! "�*" K   7 A## �)$%�) 0 location  $ m   8 9�(�(  % �'&�&�' 
0 length  & n  : ?'(' I   ; ?�%�$�#�% 
0 length  �$  �#  ( o   : ;�"�" 0 
asocstring 
asocString�&  �*  �4   o   3 4�!�! 0 
asocstring 
asocString�6  �O  �N  � )*) Z  J d+,� �+ F   J W-.- o   J K��  0 withlineending withLineEnding. H   N U// l  N T0��0 n  N T121 I   O T�3�� 0 
hassuffix_ 
hasSuffix_3 4�4 1   O P�
� 
lnfd�  �  2 o   N O�� 0 
asocstring 
asocString�  �  , n  Z `565 I   [ `�7�� 0 appendstring_ appendString_7 8�8 1   [ \�
� 
lnfd�  �  6 o   Z [�� 0 
asocstring 
asocString�   �  * 9:9 r   e n;<; n  e l=>= I   h l���� <0 filehandlewithstandardoutput fileHandleWithStandardOutput�  �  > n  e h?@? o   f h�� 0 nsfilehandle NSFileHandle@ m   e f�
� misccura< o      �� 0 
asocstdout 
asocStdout: ABA n  o |CDC I   p |�E�
� 0 
writedata_ 
writeData_E F�	F l  p xG��G n  p xHIH I   q x�J�� (0 datausingencoding_ dataUsingEncoding_J K�K l  q tL��L n  q tMNM o   r t�� ,0 nsutf8stringencoding NSUTF8StringEncodingN m   q r� 
�  misccura�  �  �  �  I o   p q���� 0 
asocstring 
asocString�  �  �	  �
  D o   o p���� 0 
asocstdout 
asocStdoutB O��O L   } ����  ��  � R      ��PQ
�� .ascrerr ****      � ****P o      ���� 0 etext eTextQ ��RS
�� 
errnR o      ���� 0 enumber eNumberS ��TU
�� 
erobT o      ���� 0 efrom eFromU ��V��
�� 
errtV o      ���� 
0 eto eTo��  � I   � ���W���� 
0 _error  W XYX m   � �ZZ �[[ 0 w r i t e   t o   s t a n d a r d   o u t p u tY \]\ o   � ����� 0 etext eText] ^_^ o   � ����� 0 enumber eNumber_ `a` o   � ����� 0 efrom eFroma b��b o   � ����� 
0 eto eTo��  ��  � cdc l     ��������  ��  ��  d e��e l     ��������  ��  ��  ��       &��fghijklmnop��qrstuvwxyz{|}~����������  f $�����������������������������������������������������������������������
�� 
pimr�� 0 _support  �� 
0 _error  �� (0 _nsstringencodings _NSStringEncodings
�� .Fil:Readnull���     file
�� .Fil:Writnull���     file
�� .Fil:ConPnull���     ****
�� .Fil:NorPnull���     ctxt
�� .Fil:JoiPnull���     ****
�� .Fil:SplPnull���     ctxt��  0 _argvusererror _ArgvUserError�� 0 novalue NoValue�� 
0 lf2 LF2�� 0 indent1 Indent1�� 0 indent2 Indent2�� 0 vt100 VT100�� 0 	_jointext 	_joinText�� 0 _asvaluetype _asValueType�� 0 _unpackvalue _unpackValue�� 40 _defaultvalueplaceholder _defaultValuePlaceholder�� *0 _formatdefaultvalue _formatDefaultValue�� (0 _formatenumeration _formatEnumeration�� (0 _buildoptionstable _buildOptionsTable�� 0 _parseoptions _parseOptions�� (0 _adddefaultoptions _addDefaultOptions��  0 _ordinalnumber _ordinalNumber�� 20 _normalizetrailingspace _normalizeTrailingSpace�� "0 _parsearguments _parseArguments��  0 _formatoptions _formatOptions�� $0 _formatarguments _formatArguments
�� .Fil:Argvnull���     ****
�� .Fil:FHlpnull��� ��� null
�� .Fil:CurFnull��� ��� null
�� .Fil:EnVanull��� ��� null
�� .Fil:RSInnull��� ��� null
� .Fil:WSOunull���     ctxtg ��� �  ��� ���
� 
cobj� ��   � 
� 
frmk�  � ���
� 
cobj� ��   �
� 
osax�  h ��   � +
� 
scpti � 5������ 
0 _error  � ��� �  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  � ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  E��� � &0 throwcommanderror throwCommandError� b  ࠡ����+ j � b  �� (0 _nsstringencodings _NSStringEncodings�  ����� ���� 	0 _list  � 	0 _init  � 0 getencoding getEncoding
� 
msng� � s������ 	0 _init  �  �  �  � ,�������������������������������~�}�|�{�z�y�x�w�v�u�t�s�r�q
� FEncFE01
� misccura� ,0 nsutf8stringencoding NSUTF8StringEncoding
� FEncFE02� .0 nsutf16stringencoding NSUTF16StringEncoding
� FEncFE03� @0 nsutf16bigendianstringencoding NSUTF16BigEndianStringEncoding
� FEncFE04� F0 !nsutf16littleendianstringencoding !NSUTF16LittleEndianStringEncoding
� FEncFE05� .0 nsutf32stringencoding NSUTF32StringEncoding
� FEncFE06� @0 nsutf32bigendianstringencoding NSUTF32BigEndianStringEncoding
� FEncFE07� F0 !nsutf32littleendianstringencoding !NSUTF32LittleEndianStringEncoding
� FEncFE11� .0 nsasciistringencoding NSASCIIStringEncoding
� FEncFE12� 60 nsiso2022jpstringencoding NSISO2022JPStringEncoding
� FEncFE13� 60 nsisolatin1stringencoding NSISOLatin1StringEncoding
� FEncFE14� 60 nsisolatin2stringencoding NSISOLatin2StringEncoding
� FEncFE15� :0 nsjapaneseeucstringencoding NSJapaneseEUCStringEncoding
� FEncFE16� 80 nsmacosromanstringencoding NSMacOSRomanStringEncoding
� FEncFE17� >0 nsnonlossyasciistringencoding NSNonLossyASCIIStringEncoding
� FEncFE18�~ 40 nsshiftjisstringencoding NSShiftJISStringEncoding
�} FEncFE19�| 00 nssymbolstringencoding NSSymbolStringEncoding
�{ FEncFE50�z >0 nswindowscp1250stringencoding NSWindowsCP1250StringEncoding
�y FEncFE51�x >0 nswindowscp1251stringencoding NSWindowsCP1251StringEncoding
�w FEncFE52�v >0 nswindowscp1252stringencoding NSWindowsCP1252StringEncoding
�u FEncFE53�t >0 nswindowscp1253stringencoding NSWindowsCP1253StringEncoding
�s FEncFE54�r >0 nswindowscp1254stringencoding NSWindowsCP1254StringEncoding�q � ����,lv���,lv���,lv���,lv���,lv���,lv���,lv��a ,lva �a ,lva �a ,lva �a ,lva �a ,lva �a ,lva �a ,lva �a ,lva �a  ,lva !�a ",lva #�a $,lva %�a &,lva '�a (,lva )�a *,lva +vEc   � �p7�o�n���m�p 0 getencoding getEncoding�o �l��l �  �k�k 0 textencoding textEncoding�n  � �j�i�j 0 textencoding textEncoding�i 0 aref aRef� �h�g�f�e�d�c�b�a��`w�_
�h 
msng�g 	0 _init  
�f 
enum�e 	0 _list  
�d 
kocl
�c 
cobj
�b .corecnte****       ****�a  � �^�]�\
�^ 
errn�]�\�\  
�` 
long�_ >0 throwinvalidconstantparameter throwInvalidConstantParameter�m l Ib   �  
*j+ Y hO��&E�O ))�,[��l kh ��k/�  ��l/EY h[OY��W X   	��&W X  hOb  ��l+ k �[��Z�Y���X
�[ .Fil:Readnull���     file�Z 0 thefile theFile�Y �W��
�W 
Type� {�V�U�T�V 0 datatype dataType�U  
�T 
ctxt� �S��R
�S 
Enco� {�Q�P�O�Q 0 textencoding textEncoding�P  
�O FEncFE01�R  � �N�M�L�K�J�I�H�G�F�E�D�C�N 0 thefile theFile�M 0 datatype dataType�L 0 textencoding textEncoding�K 0 	posixpath 	posixPath�J 0 
asocstring 
asocString�I 0 theerror theError�H 0 fh  �G 0 	theresult 	theResult�F 0 etext eText�E 0 enumber eNumber�D 0 efrom eFrom�C 
0 eto eTo�  ��B��A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+��*�)*�(�'�B ,0 asposixpathparameter asPOSIXPathParameter�A "0 astypeparameter asTypeParameter
�@ 
ctxt
�? FEncFEPE
�> 
bool�= 0 getencoding getEncoding
�< misccura�; 0 nsstring NSString
�: 
obj �9 T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_
�8 
cobj
�7 
msng
�6 
errn�5 0 code  
�4 
erob
�3 
errt�2 �1 ,0 localizeddescription localizedDescription
�0 
psxf
�/ .rdwropenshor       file
�. 
as  
�- .rdwrread****        ****
�, .rdwrclosnull���     ****�+ 0 etext eText� �&�%�
�& 
errn�% 0 enumber eNumber� �$�#�
�$ 
erob�# 0 efrom eFrom� �"�!� 
�" 
errt�! 
0 eto eTo�   �*  �)  �( �' 
0 _error  �X � �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& Ub  �k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�j+ a �a �a �j+ �&Y hO��&Y O�a &j E�O �a �l E�O�j O�W )X   
�j W X  hO)�a �a �a �W X  *a ����a + l �:�����
� .Fil:Writnull���     file� 0 thefile theFile� ���
� 
Data� 0 thedata theData� ���
� 
Type� {���� 0 datatype dataType�  
� 
ctxt� ���
� 
Enco� {���� 0 textencoding textEncoding�  
� FEncFE01�  � �������
�	������ 0 thefile theFile� 0 thedata theData� 0 datatype dataType� 0 textencoding textEncoding� 0 	posixpath 	posixPath� 0 
asocstring 
asocString�
 0 
didsucceed 
didSucceed�	 0 theerror theError� 0 fh  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 'V�b��� ������~��������������������������������������������������������� ,0 asposixpathparameter asPOSIXPathParameter� "0 astypeparameter asTypeParameter
� 
ctxt
�  FEncFEPE
�� 
bool
�� misccura�� 0 nsstring NSString�� "0 astextparameter asTextParameter�� &0 stringwithstring_ stringWithString_�� 0 getencoding getEncoding
�� 
obj �� �� P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_
�� 
cobj
�� 
errn�� 0 code  
�� 
erob
�� 
errt�� �� ,0 localizeddescription localizedDescription
�� 
psxf
�� 
perm
�� .rdwropenshor       file
�� 
set2
�� .rdwrseofnull���     ****
�� 
refn
�� 
as  
�� .rdwrwritnull���     ****
�� .rdwrclosnull���     ****�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  ��  ��  �� �� 
0 _error  �
 �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& i��,b  ��l+ 
k+ E�Ob  �k+ E�O��e���+ E[a k/E�Z[a l/E�ZO� !)a �j+ a �a �a �j+ �&Y hY a�a &a el E�O %�a jl O�a �a �� O�j OhW +X   ! 
�j W X " #hO)a �a �a �a �W X   !*a $����a %+ &m ����������
�� .Fil:ConPnull���     ****�� 0 filepath filePath�� ����
�� 
From� {�������� 0 
fromformat 
fromFormat��  
�� FLCTFLCP� �����
�� 
To__� {�������� 0 toformat toFormat��  
�� FLCTFLCP��  � 	�������������������� 0 filepath filePath�� 0 
fromformat 
fromFormat�� 0 toformat toFormat�� 0 	posixpath 	posixPath�� 0 asocurl asocURL�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� )������9��������������x}�����������������'��
�� 
kocl
�� 
ctxt
�� .corecnte****       ****�� ,0 asposixpathparameter asPOSIXPathParameter
�� FLCTFLCP
� FLCTFLCH
� 
file
� 
psxp
� FLCTFLCU
� misccura� 	0 NSURL  �  0 urlwithstring_ URLWithString_
� 
msng� 0 fileurl fileURL
� 
bool� � .0 throwinvalidparameter throwInvalidParameter� >0 throwinvalidconstantparameter throwInvalidConstantParameter
� 
leng
� FLCTFLCA
� 
psxf
� 
alis
� FLCTFLCX
� FLCTFLCS
� 
ascr� $0 fileurlwithpath_ fileURLWithPath_�  0 absolutestring absoluteString� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ��cN�kv��l j  b  ��l+ E�Y h��  �E�Y \��  *�/�,E�Y K��  8��,�k+ E�O�� 
 
�j+ �& b  �a �a a + Y hY b  �a l+ O�a ,j  b  �a �a a + Y hO��  �Y ��a   �a &a &Y ��a   �a &Y s�a   _ �a &�&/Y Z��  �a &�&Y I��  6��,�k+ E�O��  b  �a  *�a !/m+ Y hO�j+ "�&Y b  �a #l+ W X $ %*a &����a '+ (n �8�����
� .Fil:NorPnull���     ctxt� 0 filepath filePath� ���
� 
ExpT� {����  0 expandingtilde expandingTilde�  
� boovfals� ���
� 
ExpR� {���� &0 expandingrelative expandingRelative�  
� boovfals� ���
� 
ExpA� {����� $0 expandingsymlink expandingSymlink�  
�� boovfals�  � ���������������� 0 filepath filePath��  0 expandingtilde expandingTilde�� &0 expandingrelative expandingRelative�� $0 expandingsymlink expandingSymlink�� 0 etext eText�� 0 enumber eNumber�� 
0 eto eTo� NO[��n��r��x���������������~�}�|���{�z�� ,0 asposixpathparameter asPOSIXPathParameter�� (0 asbooleanparameter asBooleanParameter
�� 
bool
�� .Fil:CurFnull��� ��� null
�� .Fil:JoiPnull���     ****
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_� B0 stringbyresolvingsymlinksinpath stringByResolvingSymlinksInPath
�~ 
ctxt�} 60 stringbystandardizingpath stringByStandardizingPath�| 0 etext eText� �y�x�
�y 
errn�x 0 enumber eNumber� �w�v�u
�w 
errt�v 
0 eto eTo�u  �{ �z 
0 _error  � � ��� �b  ��l+ E�Ob  ��l+ 	 ���& 
�%E�Y hOb  ��l+ 	 ���& *j �lvj E�Y hOb  ��l+  ��,�k+ j+ a &Y ��,�k+ j+ a &VW X  *a ����a + o �t��s�r���q
�t .Fil:JoiPnull���     ****�s  0 pathcomponents pathComponents�r �p��o
�p 
Exte� {�n�m��n 0 fileextension fileExtension�m  �o  � 	�l�k�j�i�h�g�f�e�d�l  0 pathcomponents pathComponents�k 0 fileextension fileExtension�j 0 subpaths subPaths�i 0 aref aRef�h 0 asocpath asocPath�g 0 etext eText�f 0 enumber eNumber�e 0 efrom eFrom�d 
0 eto eTo� ��c�b�a�`�_�^�]�\�[�Z�Y�X�W�V3�U�T�S�RR�QW�P�g�O�N�c "0 aslistparameter asListParameter
�b 
cobj
�a 
kocl
�` .corecnte****       ****
�_ 
pcnt�^ ,0 asposixpathparameter asPOSIXPathParameter�]  �\  
�[ 
list�Z �Y .0 throwinvalidparameter throwInvalidParameter
�X misccura�W 0 nsstring NSString�V *0 pathwithcomponents_ pathWithComponents_�U "0 astextparameter asTextParameter
�T 
leng�S B0 stringbyappendingpathextension_ stringByAppendingPathExtension_
�R 
msng
�Q 
ctxt�P 0 etext eText� �M�L�
�M 
errn�L 0 enumber eNumber� �K�J�
�K 
erob�J 0 efrom eFrom� �I�H�G
�I 
errt�H 
0 eto eTo�G  �O �N 
0 _error  �q � �b  ��l+ �-E�O ;�jv  	)jhY hO %�[��l kh b  ��,�l+ ��,F[OY��W X  	b  �����+ O�a ,�k+ E�Ob  �a l+ E�O�a ,j -��k+ E�O�a   b  �a a a �+ Y hY hO�a &W X  *a ����a + p �Fw�E�D���C
�F .Fil:SplPnull���     ctxt�E 0 filepath filePath�D �B��A
�B 
Upon� {�@�?�>�@ 0 splitposition splitPosition�?  
�> FLSPFLSL�A  � �=�<�;�:�9�8�7�6�= 0 filepath filePath�< 0 splitposition splitPosition�; 0 asocpath asocPath�: 0 matchformat matchFormat�9 0 etext eText�8 0 enumber eNumber�7 0 efrom eFrom�6 
0 eto eTo� �5�4��3�2�1�0�/�.�-�,�+�*�)�(��'�&���%�$
�5 misccura�4 0 nsstring NSString�3 ,0 asposixpathparameter asPOSIXPathParameter�2 &0 stringwithstring_ stringWithString_
�1 FLSPFLSL�0 F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
�/ 
ctxt�. &0 lastpathcomponent lastPathComponent
�- FLSPFLSE�, >0 stringbydeletingpathextension stringByDeletingPathExtension�+ 0 pathextension pathExtension
�* FLSPFLSA�)  0 pathcomponents pathComponents
�( 
list�' >0 throwinvalidconstantparameter throwInvalidConstantParameter�& 0 etext eText� �#�"�
�# 
errn�" 0 enumber eNumber� �!� �
�! 
erob�  0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �% �$ 
0 _error  �C  j��,b  ��l+ k+ E�O��  �j+ �&�j+ �&lvY 8��  �j+ 
�&�j+ �&lvY ��  �j+ �&Y b  ��l+ W X  *a ����a + ��'q �  �� 0 novalue NoValue�  ��  r ���  
 
s ������� 0 vt100 VT100� ��� �  �� 0 
formatcode 
formatCode�  � �� 0 
formatcode 
formatCode� ���24
� 
cha � 
� kfrmID  � )���0�%�%�%t �G������ 0 	_jointext 	_joinText� ��� �  ��� 0 thelist theList� 0 separatortext separatorText�  � �
�	���
 0 thelist theList�	 0 separatortext separatorText� 0 oldtids oldTIDs� 0 thetext theText� ���
� 
ascr
� 
txdl
� 
ctxt� ��,E�O���,FO��&E�O���,FO�u �n����� � 0 _asvaluetype _asValueType� ����� �  ���� 0 	valuetype 	valueType�  � ���� 0 	valuetype 	valueType� �������������������������
�� 
kocl
�� 
list
�� .corecnte****       ****
�� 
leng
�� 
ctxt
�� 
bool
�� 
errn���\
�� 
erob
�� 
errt�� 
�� 
pcls�  @�kv��l k  +��,j 
 ��,���l �& )�������Y hY ��&E�O�v ������������� 0 _unpackvalue _unpackValue�� ����� �  ������ 0 thevalue theValue�� $0 definitionrecord definitionRecord��  � ���������������� 0 thevalue theValue�� $0 definitionrecord definitionRecord�� 0 	valuetype 	valueType�� 0 	theresult 	theResult�� 0 asocformatter asocFormatter�� 0 
asocresult 
asocResult�� 0 basepath basePath� C�����������������������������������������������A��\������������������������������������ �*�����0�� 0 	valuetype 	valueType�� 0 _asvaluetype _asValueType
�� 
pcls
�� 
list
�� 
errn�� 0 	_jointext 	_joinText
�� 
ctxt
�� 
long
�� 
doub
�� 
nmbr
�� misccura�� &0 nsnumberformatter NSNumberFormatter�� 	0 alloc  �� 0 init  �� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�� "0 setnumberstyle_ setNumberStyle_�� 0 nslocale NSLocale�� 0 systemlocale systemLocale�� 0 
setlocale_ 
setLocale_�� &0 numberfromstring_ numberFromString_
�� 
msng
�� 
****
�� 
furl
�� 
alis
�� 
file
�� 
psxf�� 
�� 
bool�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� ,0 currentdirectorypath currentDirectoryPath�� 0 nsstring NSString�� *0 pathwithcomponents_ pathWithComponents_�� &0 stringwithstring_ stringWithString_�� 60 stringbystandardizingpath stringByStandardizingPath�  � ���
� 
errn����  � ��Y
� 
erob
� 
errt
� 
type� ��*��,k+ E�O��,�  2�� *��kv )�b  
l�*��l+ 	%�%�%Y hO�E�VYɢ�  �E�Y����mv�kv ��a ,j+ j+ E�O��a ,k+ O��a ,j+ k+ O��k+ E�O�a   )�b  
la �%Y hO�a &E�O��  %�k#j )�b  
la �%Y hO��&E�Y hY.a a a a  a !v�kv ��a "	 �a #a $& ?�a %,j+ &j+ 'E�O�a   )�b  
la (�%Y hO�a ),��lvk+ *E�Y hO�a ),�k+ +j+ ,�&a  &E�O �a   �a &E�Y hW X - .)�b  
la /�%Y |�a $  [ga 0 Qa 1a 2a 3a 4a 5a 6v�kv eE�Y 0a 7a 8a 9a :a ;a 6v�kv fE�Y )�b  
la <�%VY )�a =a >��,a ?a @a Aa BO�w �E������ 40 _defaultvalueplaceholder _defaultValuePlaceholder� ��� �  �� $0 definitionrecord definitionRecord�  � ��� $0 definitionrecord definitionRecord� 0 	valuetype 	valueType� ����`�p��������������������� 0 	valuetype 	valueType� 0 _asvaluetype _asValueType
� 
pcls
� 
list
� 
ctxt
� 
long
� 
doub
� 
nmbr
� 
furl
� 
alis
� 
file
� 
psxf� 
� 
bool
� 
errn��Y
� 
erob
� 
errt
� 
type� � �*��,k+ E�O��,�  �Y hO��  �Y ^���mv�kv ��  �Y �Y B����a v�kv 	a Y ,�a   	a Y )a a a ��,a a a a x �������� *0 _formatdefaultvalue _formatDefaultValue� ��� �  �� $0 definitionrecord definitionRecord�  � ����� $0 definitionrecord definitionRecord� 0 defaultvalue defaultValue� 0 defaulttext defaultText� 0 asocformatter asocFormatter� ������������������~�}�|�{�z�y�x	P	Y	\	d	f� 0 defaultvalue defaultValue
� 
kocl
� 
list
� .corecnte****       ****
� 
leng
� 
bool
� 
cobj
� 
ctxt
� 
long
� 
doub
� misccura� &0 nsnumberformatter NSNumberFormatter� 	0 alloc  � 0 init  � >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� "0 setnumberstyle_ setNumberStyle_� 0 nslocale NSLocale�~ 0 systemlocale systemLocale�} 0 
setlocale_ 
setLocale_�| &0 stringfromnumber_ stringFromNumber_
�{ 
****
�z 
furl
�y 
alis
�x 
psxp� ��,E�O�kv��l j	 	��,k �& ��k/E�Y hO�kv��l j �E�Y ��kv��l j
 �kv��l j�& 7��,j+ j+ E�O���,k+ O��a ,j+ k+ O��k+ a &E�Y N�kv�a l j
 �kv�a l j�& �a ,E�Y "�e  
a E�Y �f  
a E�Y a Oa �%a %y �w	n�v�u���t�w (0 _formatenumeration _formatEnumeration�v �s��s �  �r�r 0 	valuetype 	valueType�u  � �q�p�o�q 0 	valuetype 	valueType�p 0 enumlist enumList�o 0 textref textRef� �n�m�l	��k	��j	�	�	��i	�
�n 
kocl
�m 
cobj
�l .corecnte****       ****
�k 
pcnt
�j 
leng�i 0 	_jointext 	_joinText�t K�EQ�O �[��l kh ��,%�%��,F[OY��O��,k ��i/%��i/FY hO�*��l+ 
%�%z �h	��g�f���e�h (0 _buildoptionstable _buildOptionsTable�g �d��d �  �c�c &0 optiondefinitions optionDefinitions�f  � �b�a�`�_�^�]�\�[�Z�Y�X�b &0 optiondefinitions optionDefinitions�a 0 
foundnames 
foundNames�` 20 optiondefinitionsbyname optionDefinitionsByName�_ 0 	optionref 	optionRef�^ $0 optiondefinition optionDefinition�] 0 propertyname propertyName�\ 0 	namecount 	nameCount�[ 0 aref aRef�Z 0 thename theName�Y 0 
nameprefix 
namePrefix�X 0 charref charRef� .�W�V�U�T�S�R�Q�P�O	��N	��M	��L�K�J�I�H
�G�F�E��D�C�B
�A
�
�
=
G
T
b
y�@
}
��?
�
�
�
��>
�
�W misccura�V *0 nsmutabledictionary NSMutableDictionary�U 0 
dictionary  
�T 
kocl
�S 
cobj
�R .corecnte****       ****
�Q 
pcnt
�P 
reco�O 0 	shortname 	shortName�N 0 longname longName�M 0 propertyname propertyName�L 0 	valuetype 	valueType
�K 
ctxt�J 0 islist isList�I 0 defaultvalue defaultValue�H 
�G 
errn�F�\�E  � �=�<�;
�= 
errn�<�\�;  �D�Y
�C 
erob�B 
�A 
leng
�@ 
bool
�? 
cha �> &0 setobject_forkey_ setObject_forKey_�e�jvE�O��,j+ E�O�[��l kh ��,�&��������a fa fa %E�O %��,�&E�O��,a   )a a lhY hW X  )a a a �a a O�a ,E�OJ��,a lv��,a lvlv[��l kh �E[�k/E�Z[�l/E�ZO 
��&E�W X  )a a a �a a O�a   ꡨkv )a a a �a a !Y hO��6FOga " ��a ,k  2�a ,k
 a #�a $& )a a a �a a %Y hY w�a ,j 
 a &�a 'k/a $&
 �a (a $& )a a a �a a )Y hO 5�[��l kh 
a *��, )a a a �a a +Y h[OY��VO����%l+ ,Y h[OY��O�a ,�  )a a a �a a -Y h[OY�+O�{ �:
��9�8���7�: 0 _parseoptions _parseOptions�9 �6��6 �  �5�4�3�5 0 rawarguments rawArguments�4 &0 optiondefinitions optionDefinitions�3 &0 hasdefaultoptions hasDefaultOptions�8  � �2�1�0�/�.�-�,�+�*�)�(�'�&�2 0 rawarguments rawArguments�1 &0 optiondefinitions optionDefinitions�0 &0 hasdefaultoptions hasDefaultOptions�/ 20 optiondefinitionsbyname optionDefinitionsByName�. (0 asocparametersdict asocParametersDict�- 0 thearg theArg�, 0 
optionname 
optionName�+ $0 optiondefinition optionDefinition�* 0 ishelp isHelp�) 0 	isversion 	isVersion�( 0 propertyname propertyName�' 0 thevalue theValue�& 0 thelist theList� 4�%�$�#�"�!� �5A����������������$'�D�N�[������
�	����������% (0 _buildoptionstable _buildOptionsTable
�$ misccura�# *0 nsmutabledictionary NSMutableDictionary�" 0 
dictionary  
�! 
ascr
�  
txdl
� 
cobj
� 
rest
� 
citm
� 
kocl
� .corecnte****       ****
� 
ctxt
� 
cha 
� 
bool
� 
leng� 0 objectforkey_ objectForKey_
� 
msng
� 
****� 0 	valuetype 	valueType� $0 removeallobjects removeAllObjects� $0 setvalue_forkey_ setValue_forKey_
� 
errn� 0 propertyname propertyName� 0 defaultvalue defaultValue�  �  ��\
�
 
erob�	 � 0 _unpackvalue _unpackValue� 0 islist isList�  0 nsmutablearray NSMutableArray� $0 arraywithobject_ arrayWithObject_� 0 
addobject_ 
addObject_� &0 setobject_forkey_ setObject_forKey_�7o*�k+  E�O��,j+ E�O���,FONh�jv ��k/E�O�� C��  ��,E�OY hO��k/E�O���l k �[�\[�l/\Zi2��k/FY ��,E�Y ��� ��a  
 a �a l/a & Y hO�[�\[Zk\Zl2E�O�a ,l L�[�\[Zm\Zi2��k/FO��k+ E�O�a 	 �a &a ,a  a & a ��k/%��k/FY hY ��,E�Y O��k+ E�O�a   x� _a a lv�kva a lv�kvlvE[�k/E�Z[�l/E�ZO�
 �a & %�j+ O��a l+  O��a !l+  OjvE�OY hY hO)a "b  
la #�%Y hO�a &E�O�a $,E�O�a ,a   1 �a %,E�W  X & ')a "a (a )�a %,a *a +�%Y 0�jv  )a "b  
la ,�%Y hO*��k/�l+ -E�O��,E�O�a .,E /��k+ E�O�a   �a /,�k+ 0E�Y ��k+ 1O�E�Y #��k+ a  )a "b  
la 2�%Y hO���l+ 3[OY��O��lv| ���� ����� (0 _adddefaultoptions _addDefaultOptions� ����� �  ������ (0 asocparametersdict asocParametersDict�� &0 optiondefinitions optionDefinitions�   � ������������������ (0 asocparametersdict asocParametersDict�� &0 optiondefinitions optionDefinitions�� 0 recref recRef�� 0 rec  �� 0 propertyname propertyName�� 0 defaultvalue defaultValue�� 0 
optionname 
optionName�� "0 propertynameref propertyNameRef� ����������������)��������Yci����r������������
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
reco�� 0 propertyname propertyName�� 0 longname longName�� 0 defaultvalue defaultValue�� �� 0 objectforkey_ objectForKey_
�� 
msng�� 0 	valuetype 	valueType
�� 
bool�� 0 	shortname 	shortName
�� 
errn
�� misccura�� 0 nsnull NSNull�� 0 null  �� &0 setobject_forkey_ setObject_forKey_
�� 
pcnt�� � ��[��l kh ��&�����b  �%E�O��,E�O��  
��,E�Y hO��k+ �  w��,E�O�b    C��,�  fE�Y 2��,%E�O�a   a �a ,%E�Y hO)a b  
la �%Y hO��  a a ,j+ E�Y hO���l+ Y h[OY�PO 9a a lv[��l kh ��a ,k+ �  �f�a ,l+ Y h[OY��} �������������  0 _ordinalnumber _ordinalNumber�� ����� �  ���� 0 n  ��  � ���� 0 n  � ���������������������� 
�� �� �� �� d
�� 
bool
�� 
ctxt
�� 
cobj�� 8klmmv��#kv	 ���mv��#kv�& ��&���mv��#/%Y ��&�%~ ������������ 20 _normalizetrailingspace _normalizeTrailingSpace�� ����� �  ���� 0 thetext theText��  � ���� 0 thetext theText� ��������
�� 
leng
�� 
cha 
�� 
bool
�� 
spac�� &g� ��,j	 
��i/��& 
��%E�Y hVO� ��-���������� "0 _parsearguments _parseArguments�� ����� �  ������� 0 argumentslist argumentsList�� *0 argumentdefinitions argumentDefinitions� (0 asocparametersdict asocParametersDict��  � ������������ 0 argumentslist argumentsList� *0 argumentdefinitions argumentDefinitions� (0 asocparametersdict asocParametersDict� 0 i  � 0 argcount argCount�  0 mustbeoptional mustBeOptional� 0 argref argRef� (0 argumentdefinition argumentDefinition� 0 thevalue theValue� "0 placeholdertext placeholderText� 0 aref aRef� #�������e�����n������������������268
� 
leng
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
reco� 0 propertyname propertyName� 0 	valuetype 	valueType
� 
ctxt� 0 islist isList� 0 defaultvalue defaultValue� $0 valueplaceholder valuePlaceholder� 

� 
bool
� 
errn��Y
� 
erob� � 40 _defaultvalueplaceholder _defaultValuePlaceholder�  0 _ordinalnumber _ordinalNumber� 0 _unpackvalue _unpackValue
� 
rest� &0 setobject_forkey_ setObject_forKey_���jE�O��,E�OfE�O\�[��l kh �kE�O��,�&�����f�b  ���%E�O��,b   eE�Y *�	 ��,b   �& )a a a �a a Y hO��,a   )a a a �a a Y hO�jv  S��,E�O�b    ?��,E�O��,j  *�k+ E�Y hO)a b  
la *�k+ %a %�%a %Y hY *��k/�l+ E�O�a ,E�O��,E P���, )a a a �a a Y hO�kvE�O  �[��l kh 
*��,�l+ �6F[OY��OjvE�Y hO����,l+ [OY��O�jv !)a b  
la  ��,%a !%�%a "%Y h� �N������  0 _formatoptions _formatOptions� ��� �  ���� &0 optiondefinitions optionDefinitions� 0 vtstyle vtStyle� &0 hasdefaultoptions hasDefaultOptions�  � �������������������� &0 optiondefinitions optionDefinitions� 0 vtstyle vtStyle� &0 hasdefaultoptions hasDefaultOptions�  0 defaultoptions defaultOptions�  0 booleanoptions booleanOptions� 0 otheroptions otherOptions�  0 optionssection optionsSection� 0 	optionref 	optionRef� $0 optiondefinition optionDefinition� 0 	shortname 	shortName� 0 longname longName� 0 	valuetype 	valueType� 0 islist isList� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� 0 etext eText� 0 
optionname 
optionName� 0 
isoptional 
isOptional� "0 optionssynopsis optionsSynopsis� J�hktx{����~�}�|�{�z��y��x�w�v�u�t��s��r�q�p�o���n��m�l�k�j�i,;BJ�hr|��g�f��e�d�c���b�&79?GQS[ego
� 
bool
� 
cobj� 0 b  �~ 0 n  
�} 
kocl
�| .corecnte****       ****
�{ 
reco�z 0 	shortname 	shortName�y 0 longname longName�x 0 	valuetype 	valueType
�w 
ctxt�v 0 islist isList�u 0 defaultvalue defaultValue�t $0 valueplaceholder valuePlaceholder�s $0 valuedescription valueDescription�r �q 0 _asvaluetype _asValueType�p 20 _normalizetrailingspace _normalizeTrailingSpace�o 0 etext eText� �a�`�_
�a 
errn�`�\�_  
�n 
list�m �l .0 throwinvalidparameter throwInvalidParameter
�k 
errn�j�Y
�i 
erob
�h 
spac�g 40 _defaultvalueplaceholder _defaultValuePlaceholder�f 0 u  
�e 
pcls�d (0 _formatenumeration _formatEnumeration�c *0 _formatdefaultvalue _formatDefaultValue
�b 
lnfd�,�jv 	 ��& 
��lvY hO���mvE[�k/E�Z[�l/E�Z[�m/E�ZO��,�%��,%E�O�[��l kh ��&���a a a a fa b  a a a a a %E�O L��,a &E�O��,a &E�O*�a ,k+ E�O�a ,�&E�O�a ,a &E�O*�a ,a &k+ E�W X  b  �a a a  �%a !+ "O�b  %b  %E�O�a #  3�a $  )a %a &a '�a !a (Y hO�E^ O�a )%�%E�Y '�E^ O�a *%�%E�O�a + �a ,%�%E�Y hO��  �] %E�Y ̨a ,b  E^ O�_ -%E�O]  �a .%E�Y hO�a /%] %E�O�E�O�a 0  *�k+ 1E�Y hO�a 2,�%��,%E�O�_ -%�%E�O]  �a 3%E�Y hO�_ -%�%E�O�a 4,a   �*�k+ 5%E�Y hO�a ,b   �*�k+ 6%E�Y hO� �a 7%E�Y hO�a 8 �_ 9%b  %�%E�Y h[OY��O� r�a : .a ;�%E�O�b  %b  %a <%_ 9%b  %a =%E�Y hO�a > .�a ?%E�O�b  %b  %a @%_ 9%b  %a A%E�Y hY hOa BE^ O�a C ] a D%�%a E%E^ Y hO�a F ] a G%�%a H%E^ Y hO�a I ] �%E^ Y hO] �lv� �^��]�\���[�^ $0 _formatarguments _formatArguments�] �Z��Z �  �Y�X�Y *0 argumentdefinitions argumentDefinitions�X 0 vtstyle vtStyle�\  � 
�W�V�U�T�S�R�Q�P�O�N�W *0 argumentdefinitions argumentDefinitions�V 0 vtstyle vtStyle�U &0 argumentssynopsis argumentsSynopsis�T $0 argumentssection argumentsSection�S 0 argumentref argumentRef�R (0 argumentdefinition argumentDefinition�Q 0 	valuetype 	valueType�P 0 islist isList�O $0 valueplaceholder valuePlaceholder�N $0 valuedescription valueDescription� +����M��L�K�J�I�H�G�F�E�D�C��B��A�@�?�>�=����<�;�:�9�8�7�6�5OW�4oq�3��M 0 b  �L 0 n  
�K 
kocl
�J 
cobj
�I .corecnte****       ****
�H 
reco�G 0 	valuetype 	valueType
�F 
ctxt�E 0 islist isList�D 0 defaultvalue defaultValue�C $0 valueplaceholder valuePlaceholder�B $0 valuedescription valueDescription�A 
�@ 0 _asvaluetype _asValueType
�? 
bool�> 20 _normalizetrailingspace _normalizeTrailingSpace�=  � �2�1�0
�2 
errn�1�\�0  �< �; 60 throwinvalidparametertype throwInvalidParameterType�: 40 _defaultvalueplaceholder _defaultValuePlaceholder�9 0 u  
�8 
pcls
�7 
list�6 (0 _formatenumeration _formatEnumeration�5 *0 _formatdefaultvalue _formatDefaultValue
�4 
lnfd
�3 
spac�[t�jv  
��lvY hO�E�O��,�%��,%E�OG�[��l kh ��&���f�b  ��a a a %E�O 0*��,k+ E�O��,a &E�O��,�&E�O*�a ,�&k+ E�W X  b  �a �a a + O�a   *�k+ E�Y hO�a ,�%��,%E�O� �a %E�Y hO�b  %b  %�%E�O�a  ,a !  �*�k+ "%E�Y hO��,b   �*�k+ #%E�Y hO� �a $%E�Y hO�a % �_ &%b  %�%E�Y hO��,b   a '�%a (%E�Y hO�_ )%�%E�[OY��Oa *�%�lv� �/��.�-� �,
�/ .Fil:Argvnull���     ****�. 0 argv  �- �+
�+ 
OpsD {�*�)�(�* &0 optiondefinitions optionDefinitions�)  �(   �'
�' 
OpsA {�&�%�$�& *0 argumentdefinitions argumentDefinitions�%  �$   �#�"
�# 
DefO {�!� ��! &0 hasdefaultoptions hasDefaultOptions�   
� boovtrue�"  � ������������ 0 argv  � &0 optiondefinitions optionDefinitions� *0 argumentdefinitions argumentDefinitions� &0 hasdefaultoptions hasDefaultOptions� 0 oldtids oldTIDs� (0 asocparametersdict asocParametersDict� 0 argumentslist argumentsList� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo  ���������������
�	��:��
� 
ascr
� 
txdl� "0 aslistparameter asListParameter
� 
cobj� 0 _parseoptions _parseOptions� (0 _adddefaultoptions _addDefaultOptions� "0 _parsearguments _parseArguments
� 
****� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom � ����
�  
errt�� 
0 eto eTo��  
�
 
errn
�	 
erob
� 
errt� � � 
0 _error  �, ��� ���,E�O db  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�O*��-��m+ 	E[�k/E�Z[�l/E�ZO*��l+ 
O*���m+ O���,FO��&W 8X  ���,FO�b  
  )�a �a �a �Y *a ����a + V� ��N����	
��
�� .Fil:FHlpnull��� ��� null��  �� ��
�� 
Name {����V�� 0 commandname commandName��   ��
�� 
Summ {����^�� $0 shortdescription shortDescription��   ��
�� 
Usag {�������� "0 commandsynopses commandSynopses��  ��   ��
�� 
OpsD {�������� &0 optiondefinitions optionDefinitions��  ��   ��
�� 
OpsA {�������� *0 argumentdefinitions argumentDefinitions��  ��   ��
�� 
Docu {����u�� "0 longdescription longDescription��   ��
�� 
VFmt {�������� 0 isstyled isStyled��  
�� boovtrue ����
�� 
DefO {�������� &0 hasdefaultoptions hasDefaultOptions��  
�� boovtrue��  	 ���������������������������������������� 0 commandname commandName�� $0 shortdescription shortDescription�� "0 commandsynopses commandSynopses�� &0 optiondefinitions optionDefinitions�� *0 argumentdefinitions argumentDefinitions�� "0 longdescription longDescription�� 0 isstyled isStyled�� &0 hasdefaultoptions hasDefaultOptions�� 0 vtstyle vtStyle�� 0 helptext helpText�� 00 defaultoptionssynopsis defaultOptionsSynopsis��  0 optionssection optionsSection�� 40 defaultargumentssynopsis defaultArgumentsSynopsis�� $0 argumentssection argumentsSection�� 0 textref textRef�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo
 4������������������������������������������ 4>F����u������������������������� "0 astextparameter asTextParameter�� "0 aslistparameter asListParameter�� (0 asbooleanparameter asBooleanParameter�� 0 n  �� 0 vt100 VT100�� 0 b  �� 0 u  �� �� 
�� .Fil:EnVanull��� ��� null�� 0 _  
�� .Fil:SplPnull���     ctxt
�� 
cobj��  ��  ��  0 _formatoptions _formatOptions�� $0 _formatarguments _formatArguments
�� 
kocl
�� .corecnte****       **** ������
�� 
errn���\��  
�� 
list�� 60 throwinvalidparametertype throwInvalidParameterType
�� 
lnfd�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��+��'
b  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+  "�*jk+ �*kk+ �*a k+ a E�Y �a �a �a a E�O�a   ) *j a ,j a i/E�W X  a E�Y hO��,a %��,%b  %b  %�%E�O�a  �a %�%E�Y hO*���m+  E[a k/E�Z[a l/E�ZO*��l+ !E[a k/E�Z[a l/E�ZO�b  %��,%a "%��,%E�O�jv  ��%�%kvE�Y hO / )�[a #a l $kh �b  %b  %�%E�[OY��W X  %b  �a &a 'a (a + )O�a * �b  %�%E�Y hO�a + �b  %�%E�Y hO�a , "�b  %��,%a -%��,%b  %�%E�Y hO�_ .%W X / 0*a 1�] ] ] a 2+ 3V� ��������
�� .Fil:CurFnull��� ��� null��  ��   ��������� 0 asocpath asocPath�� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ���������� 2��
� misccura� 0 nsfilemanager NSFileManager�  0 defaultmanager defaultManager� ,0 currentdirectorypath currentDirectoryPath
� 
msng
� 
errn��@
� 
ctxt
� 
psxf� 0 etext eText  ��!
� 
errn� 0 enumber eNumber! ��"
� 
erob� 0 efrom eFrom" ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� ; *��,j+ j+ E�O��  )��l�Y hO��&�&W X 
 *졢���+ � �B��#$�
� .Fil:EnVanull��� ��� null�  �  #  $ �����
� misccura� 0 nsprocessinfo NSProcessInfo� 0 processinfo processInfo� 0 environment  
� 
****� ��,j+ j+ �&� �T��~%&�}
� .Fil:RSInnull��� ��� null�  �~ �|'(
�| 
Prmt' {�{�z[�{ 0 
prompttext 
promptText�z  ( �y)�x
�y 
ReTo) {�w�v�u�w 0 isinteractive isInteractive�v  
�u boovfals�x  % 	�t�s�r�q�p�o�n�m�l�t 0 
prompttext 
promptText�s 0 isinteractive isInteractive�r 0 	asocstdin 	asocStdin�q 0 asocdata asocData�p 0 
asocstring 
asocString�o 0 etext eText�n 0 enumber eNumber�m 0 efrom eFrom�l 
0 eto eTo& �k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[��Z�Y�X�W�V*��U�T
�k misccura�j 0 nsfilehandle NSFileHandle�i :0 filehandlewithstandardinput fileHandleWithStandardInput
�h 
SLiB
�g 
ALiE�f 
�e .Fil:WSOunull���     ctxt�d 0 availabledata availableData�c 
0 length  
�b 
msng�a *0 readdatatoendoffile readDataToEndOfFile�` 0 nsstring NSString�_ 	0 alloc  �^ ,0 nsutf8stringencoding NSUTF8StringEncoding�] 00 initwithdata_encoding_ initWithData_encoding_
�\ 
errn�[�\
�Z 
lnfd�Y 0 
hassuffix_ 
hasSuffix_�X &0 substringtoindex_ substringToIndex_
�W 
ctxt�V 0 etext eText* �S�R+
�S 
errn�R 0 enumber eNumber+ �Q�P,
�Q 
erob�P 0 efrom eFrom, �O�N�M
�O 
errt�N 
0 eto eTo�M  �U �T 
0 _error  �} � ���,j+ E�O� '��f�f� O�j+ E�O�j+ j  �Y hY 	�j+ 
E�O��,j+ ���,l+ E�O��  )�a la Y hO�_ k+  ��j+ kk+ E�Y hO�a &W X  *a ����a + � �L��K�J-.�I
�L .Fil:WSOunull���     ctxt�K 0 thetext theText�J �H/0
�H 
SLiB/ {�G�F�E�G 0 uselinefeeds useLinefeeds�F  
�E boovtrue0 �D1�C
�D 
ALiE1 {�B�A�@�B  0 withlineending withLineEnding�A  
�@ boovtrue�C  - 	�?�>�=�<�;�:�9�8�7�? 0 thetext theText�> 0 uselinefeeds useLinefeeds�=  0 withlineending withLineEnding�< 0 
asocstring 
asocString�; 0 
asocstdout 
asocStdout�: 0 etext eText�9 0 enumber eNumber�8 0 efrom eFrom�7 
0 eto eTo. ��6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%2Z�$�#�6 "0 astextparameter asTextParameter�5 &0 asnsmutablestring asNSMutableString
�4 
ret 
�3 
lnfd�2 0 location  �1 
0 length  �0 �/ l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_�. 0 
hassuffix_ 
hasSuffix_
�- 
bool�, 0 appendstring_ appendString_
�+ misccura�* 0 nsfilehandle NSFileHandle�) <0 filehandlewithstandardoutput fileHandleWithStandardOutput�( ,0 nsutf8stringencoding NSUTF8StringEncoding�' (0 datausingencoding_ dataUsingEncoding_�& 0 
writedata_ 
writeData_�% 0 etext eText2 �"�!3
�" 
errn�! 0 enumber eNumber3 � �4
�  
erob� 0 efrom eFrom4 ���
� 
errt� 
0 eto eTo�  �$ �# 
0 _error  �I � �b  b  ��l+ k+ E�O� ,���%�j�j�j+ ��+ O���j�j�j+ ��+ Y hO�	 ��k+ 	�& ��k+ Y hO��,j+ E�O����,k+ k+ OhW X  *a ����a +  ascr  ��ޭ