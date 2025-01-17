FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Number -- manipulate numeric values and perform common math functions

Notes:

- The Trigonometry and Logarithm handlers are slightly modified versions of handlers found in ESG MathLib <http://www.esglabs.com/>, which in turn are conversions of functions in the Cephes Mathematical Library by Stephen L. Moshier <http://netlib.org/cephes/>.

- see <http://www.unicode.org/reports/tr35/tr35-31/tr35-numbers.html#Number_Format_Patterns> for recognized format patterns when passing text values as `parse/format number`'s `using` parameter

- caution: -[NSNumberFormatter setMinimumFractionDigits:] may be buggy; see workarounds and notes in _setBasicFormat()

     � 	 	$   N u m b e r   - -   m a n i p u l a t e   n u m e r i c   v a l u e s   a n d   p e r f o r m   c o m m o n   m a t h   f u n c t i o n s 
 
 N o t e s : 
 
 -   T h e   T r i g o n o m e t r y   a n d   L o g a r i t h m   h a n d l e r s   a r e   s l i g h t l y   m o d i f i e d   v e r s i o n s   o f   h a n d l e r s   f o u n d   i n   E S G   M a t h L i b   < h t t p : / / w w w . e s g l a b s . c o m / > ,   w h i c h   i n   t u r n   a r e   c o n v e r s i o n s   o f   f u n c t i o n s   i n   t h e   C e p h e s   M a t h e m a t i c a l   L i b r a r y   b y   S t e p h e n   L .   M o s h i e r   < h t t p : / / n e t l i b . o r g / c e p h e s / > . 
 
 -   s e e   < h t t p : / / w w w . u n i c o d e . o r g / r e p o r t s / t r 3 5 / t r 3 5 - 3 1 / t r 3 5 - n u m b e r s . h t m l # N u m b e r _ F o r m a t _ P a t t e r n s >   f o r   r e c o g n i z e d   f o r m a t   p a t t e r n s   w h e n   p a s s i n g   t e x t   v a l u e s   a s   ` p a r s e / f o r m a t   n u m b e r ` ' s   ` u s i n g `   p a r a m e t e r 
 
 -   c a u t i o n :   - [ N S N u m b e r F o r m a t t e r   s e t M i n i m u m F r a c t i o n D i g i t s : ]   m a y   b e   b u g g y ;   s e e   w o r k a r o u n d s   a n d   n o t e s   i n   _ s e t B a s i c F o r m a t ( ) 
 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -     !   l     �� " #��   "   support    # � $ $    s u p p o r t !  % & % l     ��������  ��  ��   &  ' ( ' l      ) * + ) j    �� ,�� 0 _support   , N     - - 4    �� .
�� 
scpt . m     / / � 0 0  T y p e S u p p o r t * "  used for parameter checking    + � 1 1 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g (  2 3 2 l     ��������  ��  ��   3  4 5 4 i   ! 6 7 6 I      �� 8���� 
0 _error   8  9 : 9 o      ���� 0 handlername handlerName :  ; < ; o      ���� 0 etext eText <  = > = o      ���� 0 enumber eNumber >  ? @ ? o      ���� 0 efrom eFrom @  A�� A o      ���� 
0 eto eTo��  ��   7 n     B C B I    �� D���� &0 throwcommanderror throwCommandError D  E F E m     G G � H H  N u m b e r F  I J I o    ���� 0 handlername handlerName J  K L K o    ���� 0 etext eText L  M N M o    	���� 0 enumber eNumber N  O P O o   	 
���� 0 efrom eFrom P  Q�� Q o   
 ���� 
0 eto eTo��  ��   C o     ���� 0 _support   5  R S R l     ��������  ��  ��   S  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X J D--------------------------------------------------------------------    Y � Z Z � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - W  [ \ [ l     �� ] ^��   ]  
 constants    ^ � _ _    c o n s t a n t s \  ` a ` l     ��������  ��  ��   a  b c b l      d e f d j   " $�� g�� 	0 __e__   g m   " # h h @�
�_� e ; 5 the mathematical constant e (natural logarithm base)    f � i i j   t h e   m a t h e m a t i c a l   c o n s t a n t   e   ( n a t u r a l   l o g a r i t h m   b a s e ) c  j k j l     ��������  ��  ��   k  l m l l      n o p n j   % '�� q�� 0 _isequaldelta _isEqualDelta q m   % & r r =q���-� o i c multiplier used by `cmp` to allow for slight differences due to floating point's limited precision    p � s s �   m u l t i p l i e r   u s e d   b y   ` c m p `   t o   a l l o w   f o r   s l i g h t   d i f f e r e n c e s   d u e   t o   f l o a t i n g   p o i n t ' s   l i m i t e d   p r e c i s i o n m  t u t l     ��������  ��  ��   u  v w v l     �� x y��   x � � [positive] numeric range within which `basic format` uses decimal rather than scientific notation when formatting reals (this mimics AS's own behavior); the corresponding negative range is calcuated automatically    y � z z�   [ p o s i t i v e ]   n u m e r i c   r a n g e   w i t h i n   w h i c h   ` b a s i c   f o r m a t `   u s e s   d e c i m a l   r a t h e r   t h a n   s c i e n t i f i c   n o t a t i o n   w h e n   f o r m a t t i n g   r e a l s   ( t h i s   m i m i c s   A S ' s   o w n   b e h a v i o r ) ;   t h e   c o r r e s p o n d i n g   n e g a t i v e   r a n g e   i s   c a l c u a t e d   a u t o m a t i c a l l y w  { | { j   ( *�� }�� $0 _mindecimalrange _minDecimalRange } m   ( ) ~ ~ ?PbM��� |   �  j   + -�� ��� $0 _maxdecimalrange _maxDecimalRange � m   + , � � @È      �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   parse and format    � � � � "   p a r s e   a n d   f o r m a t �  � � � l     ��������  ��  ��   �  � � � i  . 1 � � � I      �� ����� (0 _asintegerproperty _asIntegerProperty �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 propertyname propertyName �  ��� � o      ���� 0 minvalue minValue��  ��   � l    8 � � � � Q     8 � � � � k    & � �  � � � r     � � � c     � � � o    ���� 0 thevalue theValue � m    ��
�� 
long � o      ���� 0 n   �  � � � Z  	 # � ����� � G   	  � � � >   	  � � � o   	 
���� 0 n   � c   
  � � � o   
 ���� 0 thevalue theValue � m    ��
�� 
doub � A     � � � o    ���� 0 n   � o    ���� 0 minvalue minValue � R    ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � m    �����Y��  ��  ��   �  ��� � L   $ & � � o   $ %���� 0 n  ��   � R      ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � d       � � m      �������   � R   . 8�� � �
�� .ascrerr ****      � **** � b   2 7 � � � b   2 5 � � � m   2 3 � � � � � R T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    � o   3 4���� 0 propertyname propertyName � m   5 6 � � � � � R    p r o p e r t y   i s   n o t   a   n o n - n e g a t i v e   i n t e g e r . � �� ���
�� 
errn � m   0 1�����Y��   � � � note that this doesn't set an upper bound, though very large (silly) numbers may or may not work as intended, depending on what NSNumberFormatter decides to make of them    � � � �T   n o t e   t h a t   t h i s   d o e s n ' t   s e t   a n   u p p e r   b o u n d ,   t h o u g h   v e r y   l a r g e   ( s i l l y )   n u m b e r s   m a y   o r   m a y   n o t   w o r k   a s   i n t e n d e d ,   d e p e n d i n g   o n   w h a t   N S N u m b e r F o r m a t t e r   d e c i d e s   t o   m a k e   o f   t h e m �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  2 5 � � � I      �� ����� ,0 _makenumberformatter _makeNumberFormatter �  � � � o      ���� 0 formatstyle formatStyle �  � � � o      ���� 0 
localecode 
localeCode �  ��� � o      ���� 0 	thenumber 	theNumber��  ��   � l   � � � � � k    � � �  � � � l     � � � � r      � � � n     � � � I    �������� 0 init  ��  ��   � n     � � � I    ��~�}� 	0 alloc  �~  �}   � n     � � � o    �|�| &0 nsnumberformatter NSNumberFormatter � m     �{
�{ misccura � o      �z�z 0 asocformatter asocFormatter �	 (note that while NSFormatter provides a global +setDefaultFormatterBehavior: option to change all NSNumberFormatters to use pre-10.4 behavior, we don't bother to call setFormatterBehavior: as it's very unlikely nowadays that a host process would change this)    � � � �   ( n o t e   t h a t   w h i l e   N S F o r m a t t e r   p r o v i d e s   a   g l o b a l   + s e t D e f a u l t F o r m a t t e r B e h a v i o r :   o p t i o n   t o   c h a n g e   a l l   N S N u m b e r F o r m a t t e r s   t o   u s e   p r e - 1 0 . 4   b e h a v i o r ,   w e   d o n ' t   b o t h e r   t o   c a l l   s e t F o r m a t t e r B e h a v i o r :   a s   i t ' s   v e r y   u n l i k e l y   n o w a d a y s   t h a t   a   h o s t   p r o c e s s   w o u l d   c h a n g e   t h i s ) �  � � � Q   � � � � � Z   w � ��y � � =     � � � l    ��x�w � I   �v � �
�v .corecnte****       **** � J     � �  ��u � o    �t�t 0 formatstyle formatStyle�u   � �s ��r
�s 
kocl � m    �q
�q 
reco�r  �x  �w   � m    �p�p  � k   [ � �  � � � r    P � � � n   N � � � I   $ N�o �n�o 60 asoptionalrecordparameter asOptionalRecordParameter   o   $ %�m�m 0 formatstyle formatStyle  K   % G �l
�l 
pcls l  & '�k�j m   & '�i
�i 
MthR�k  �j   �h	
�h 0 basicformat basicFormat	 n  ( / o   - /�g�g 0 requiredvalue RequiredValue o   ( -�f�f 0 _support  
 �e�e ,0 minimumdecimalplaces minimumDecimalPlaces m   0 1�d
�d 
msng �c�c ,0 maximumdecimalplaces maximumDecimalPlaces m   2 3�b
�b 
msng �a�a 40 minimumsignificantdigits minimumSignificantDigits m   4 5�`
�` 
msng �_�_ 40 maximumsignificantdigits maximumSignificantDigits m   6 7�^
�^ 
msng �]�] $0 decimalseparator decimalSeparator m   : ;�\
�\ 
msng �[�[ &0 groupingseparator groupingSeparator m   > ?�Z
�Z 
msng �Y�X�Y $0 roundingbehavior roundingBehavior m   B C�W
�W 
msng�X   �V m   G J � 
 u s i n g�V  �n   � o    $�U�U 0 _support   � o      �T�T 0 formatrecord formatRecord �  I   Q [�S�R�S "0 _setbasicformat _setBasicFormat  !  o   R S�Q�Q 0 asocformatter asocFormatter! "#" n  S V$%$ o   T V�P�P 0 basicformat basicFormat% o   S T�O�O 0 formatrecord formatRecord# &�N& o   V W�M�M 0 	thenumber 	theNumber�N  �R   '(' Z   \ �)*�L�K) >  \ a+,+ n  \ _-.- o   ] _�J�J ,0 minimumdecimalplaces minimumDecimalPlaces. o   \ ]�I�I 0 formatrecord formatRecord, m   _ `�H
�H 
msng* k   d �// 010 n  d u232 I   e u�G4�F�G 60 setminimumfractiondigits_ setMinimumFractionDigits_4 5�E5 I   e q�D6�C�D (0 _asintegerproperty _asIntegerProperty6 787 n  f i9:9 o   g i�B�B ,0 minimumdecimalplaces minimumDecimalPlaces: o   f g�A�A 0 formatrecord formatRecord8 ;<; m   i l== �>> ( m i n i m u m D e c i m a l P l a c e s< ?�@? m   l m�?�?  �@  �C  �E  �F  3 o   d e�>�> 0 asocformatter asocFormatter1 @A@ l  v ~BCDB n  v ~EFE I   w ~�=G�<�= 60 setmaximumfractiondigits_ setMaximumFractionDigits_G H�;H m   w z�:�:��;  �<  F o   v w�9�9 0 asocformatter asocFormatterC L F kludge for NSNumberFormatterBug; see notes in _setBasicFormat() below   D �II �   k l u d g e   f o r   N S N u m b e r F o r m a t t e r B u g ;   s e e   n o t e s   i n   _ s e t B a s i c F o r m a t ( )   b e l o wA J�8J l   �7KL�7  KasocFormatter's setAlwaysShowsDecimalSeparator:true -- note: doesn't work well when significant digits are specified (may leave hanging separator char with no "0" after it), but doesn't seem to be essential when fraction digits are already specified, so just disable/omit it   L �MM$ a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   n o t e :   d o e s n ' t   w o r k   w e l l   w h e n   s i g n i f i c a n t   d i g i t s   a r e   s p e c i f i e d   ( m a y   l e a v e   h a n g i n g   s e p a r a t o r   c h a r   w i t h   n o   " 0 "   a f t e r   i t ) ,   b u t   d o e s n ' t   s e e m   t o   b e   e s s e n t i a l   w h e n   f r a c t i o n   d i g i t s   a r e   a l r e a d y   s p e c i f i e d ,   s o   j u s t   d i s a b l e / o m i t   i t�8  �L  �K  ( NON Z   � �PQ�6�5P >  � �RSR n  � �TUT o   � ��4�4 ,0 maximumdecimalplaces maximumDecimalPlacesU o   � ��3�3 0 formatrecord formatRecordS m   � ��2
�2 
msngQ k   � �VV WXW n  � �YZY I   � ��1[�0�1 60 setmaximumfractiondigits_ setMaximumFractionDigits_[ \�/\ I   � ��.]�-�. (0 _asintegerproperty _asIntegerProperty] ^_^ n  � �`a` o   � ��,�, ,0 maximumdecimalplaces maximumDecimalPlacesa o   � ��+�+ 0 formatrecord formatRecord_ bcb m   � �dd �ee ( m a x i m u m D e c i m a l P l a c e sc f�*f m   � ��)�)  �*  �-  �/  �0  Z o   � ��(�( 0 asocformatter asocFormatterX g�'g l  � ��&hi�&  h B <asocFormatter's setAlwaysShowsDecimalSeparator:true -- ditto   i �jj x a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   d i t t o�'  �6  �5  O klk Z   � �mn�%�$m >  � �opo n  � �qrq o   � ��#�# 40 minimumsignificantdigits minimumSignificantDigitsr o   � ��"�" 0 formatrecord formatRecordp m   � ��!
�! 
msngn k   � �ss tut n  � �vwv I   � �� x��  <0 setminimumsignificantdigits_ setMinimumSignificantDigits_x y�y I   � ��z�� (0 _asintegerproperty _asIntegerPropertyz {|{ n  � �}~} o   � ��� 40 minimumsignificantdigits minimumSignificantDigits~ o   � ��� 0 formatrecord formatRecord| � m   � ��� ��� 0 m i n i m u m S i g n i f i c a n t D i g i t s� ��� m   � ���  �  �  �  �  w o   � ��� 0 asocformatter asocFormatteru ��� n  � ���� I   � ����� 60 setusessignificantdigits_ setUsesSignificantDigits_� ��� m   � ��
� boovtrue�  �  � o   � ��� 0 asocformatter asocFormatter�  �%  �$  l ��� Z   � ������ >  � ���� n  � ���� o   � ��� 40 maximumsignificantdigits maximumSignificantDigits� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
msng� k   � ��� ��� n  � ���� I   � ����
� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_� ��	� I   � ����� (0 _asintegerproperty _asIntegerProperty� ��� n  � ���� o   � ��� 40 maximumsignificantdigits maximumSignificantDigits� o   � ��� 0 formatrecord formatRecord� ��� m   � ��� ��� 0 m a x i m u m S i g n i f i c a n t D i g i t s� ��� m   � ���  �  �  �	  �
  � o   � ��� 0 asocformatter asocFormatter� ��� n  � ���� I   � �� ����  60 setusessignificantdigits_ setUsesSignificantDigits_� ���� m   � ���
�� boovtrue��  ��  � o   � ����� 0 asocformatter asocFormatter�  �  �  � ��� Z   �?������� >  � ���� n  � ���� o   � ����� $0 decimalseparator decimalSeparator� o   � ����� 0 formatrecord formatRecord� m   � ���
�� 
msng� Q   �;���� k   �'�� ��� r   ���� c   ���� n  ���� o   ����� $0 decimalseparator decimalSeparator� o   � ����� 0 formatrecord formatRecord� m  ��
�� 
ctxt� o      ���� 0 s  � ��� Z  ������� =  ��� n ��� 1  	��
�� 
leng� o  	���� 0 s  � m  ����  � R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  �����Y��  ��  ��  � ���� n !'��� I  "'������� ,0 setdecimalseparator_ setDecimalSeparator_� ���� o  "#���� 0 s  ��  ��  � o  !"���� 0 asocformatter asocFormatter��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  /;����
�� .ascrerr ****      � ****� m  7:�� ��� � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    d e c i m a l S e p a r a t o r    p r o p e r t y   i s   n o t   n o n - e m p t y   t e x t .� �����
�� 
errn� m  36�����Y��  ��  ��  � ��� Z  @�������� > @G��� n @E��� o  AE���� &0 groupingseparator groupingSeparator� o  @A���� 0 formatrecord formatRecord� m  EF��
�� 
msng� Q  J����� k  My�� ��� r  MX��� c  MV��� n MR��� o  NR���� &0 groupingseparator groupingSeparator� o  MN���� 0 formatrecord formatRecord� m  RU��
�� 
ctxt� o      ���� 0 s  � ���� Z  Yy������ =  Y`��� n Y^��� 1  Z^��
�� 
leng� o  YZ���� 0 s  � m  ^_����  � n ci��� I  di������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  de��
�� boovfals��  ��  � o  cd���� 0 asocformatter asocFormatter��  � k  ly�� ��� n lr��� I  mr������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  mn��
�� boovtrue��  ��  � o  lm���� 0 asocformatter asocFormatter� ���� n sy��� I  ty������� .0 setgroupingseparator_ setGroupingSeparator_� ���� o  tu���� 0 s  ��  ��  � o  st���� 0 asocformatter asocFormatter��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d         m      �������  � R  ����
�� .ascrerr ****      � **** m  �� � � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    g r o u p i n g S e p a r a t o r    p r o p e r t y   i s   n o t   t e x t . ����
�� 
errn m  �������Y��  ��  ��  � �� Z  �[���� > ��	
	 n �� o  ������ $0 roundingbehavior roundingBehavior o  ������ 0 formatrecord formatRecord
 m  ����
�� 
msng Z  �W = �� n �� o  ������ $0 roundingbehavior roundingBehavior o  ������ 0 formatrecord formatRecord l ������ m  ����
�� MRndRNhE��  ��   n �� I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven m  ����
�� misccura��  ��  ��  ��   o  ������ 0 asocformatter asocFormatter  = ��  n ��!"! o  ������ $0 roundingbehavior roundingBehavior" o  ������ 0 formatrecord formatRecord  l ��#����# m  ����
�� MRndRNhT��  ��   $%$ n ��&'& I  ����(���� $0 setroundingmode_ setRoundingMode_( )��) l ��*����* n ��+,+ o  ������ @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown, m  ����
�� misccura��  ��  ��  ��  ' o  ������ 0 asocformatter asocFormatter% -.- = ��/0/ n ��121 o  ������ $0 roundingbehavior roundingBehavior2 o  ������ 0 formatrecord formatRecord0 l ��3����3 m  ����
�� MRndRNhF��  ��  . 454 n ��676 I  ����8���� $0 setroundingmode_ setRoundingMode_8 9��9 l ��:����: n ��;<; o  ������ <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp< m  ����
�� misccura��  ��  ��  ��  7 o  ������ 0 asocformatter asocFormatter5 =>= = ��?@? n ��ABA o  ������ $0 roundingbehavior roundingBehaviorB o  ������ 0 formatrecord formatRecord@ l ��C����C m  ����
�� MRndRN_T��  ��  > DED n ��FGF I  ����H��� $0 setroundingmode_ setRoundingMode_H I�~I l ��J�}�|J n ��KLK o  ���{�{ 80 nsnumberformatterrounddown NSNumberFormatterRoundDownL m  ���z
�z misccura�}  �|  �~  �  G o  ���y�y 0 asocformatter asocFormatterE MNM =  	OPO n  QRQ o  �x�x $0 roundingbehavior roundingBehaviorR o   �w�w 0 formatrecord formatRecordP l S�v�uS m  �t
�t MRndRN_F�v  �u  N TUT n VWV I  �sX�r�s $0 setroundingmode_ setRoundingMode_X Y�qY l Z�p�oZ n [\[ o  �n�n 40 nsnumberformatterroundup NSNumberFormatterRoundUp\ m  �m
�m misccura�p  �o  �q  �r  W o  �l�l 0 asocformatter asocFormatterU ]^] = "_`_ n aba o  �k�k $0 roundingbehavior roundingBehaviorb o  �j�j 0 formatrecord formatRecord` l !c�i�hc m  !�g
�g MRndRN_U�i  �h  ^ ded n %/fgf I  &/�fh�e�f $0 setroundingmode_ setRoundingMode_h i�di l &+j�c�bj n &+klk o  '+�a�a >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeilingl m  &'�`
�` misccura�c  �b  �d  �e  g o  %&�_�_ 0 asocformatter asocFormattere mnm = 2;opo n 27qrq o  37�^�^ $0 roundingbehavior roundingBehaviorr o  23�]�] 0 formatrecord formatRecordp l 7:s�\�[s m  7:�Z
�Z MRndRN_D�\  �[  n t�Yt n >Huvu I  ?H�Xw�W�X $0 setroundingmode_ setRoundingMode_w x�Vx l ?Dy�U�Ty n ?Dz{z o  @D�S�S :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloor{ m  ?@�R
�R misccura�U  �T  �V  �W  v o  >?�Q�Q 0 asocformatter asocFormatter�Y   R  KW�P|}
�P .ascrerr ****      � ****| m  SV~~ � � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    r o u n d i n g B e h a v i o r    i s   n o t   a n   a l l o w e d   c o n s t a n t .} �O��N
�O 
errn� m  OR�M�M�Y�N  ��  ��  ��  �y   � Q  ^w���� I  ai�L��K�L "0 _setbasicformat _setBasicFormat� ��� o  bc�J�J 0 asocformatter asocFormatter� ��� o  cd�I�I 0 formatstyle formatStyle� ��H� o  de�G�G 0 	thenumber 	theNumber�H  �K  � R      �F�E�
�F .ascrerr ****      � ****�E  � �D��C
�D 
errn� d      �� m      �B�B��C  � R  qw�A��@
�A .ascrerr ****      � ****� m  sv�� ��� ~ N o t   a    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d   o r   a n   a l l o w e d   c o n s t a n t .�@   � R      �?��
�? .ascrerr ****      � ****� o      �>�> 0 etext eText� �=��<
�= 
errn� d      �� m      �;�;��<   � n ���� I  ���:��9�: .0 throwinvalidparameter throwInvalidParameter� ��� o  ���8�8 0 formatstyle formatStyle� ��� m  ���� ��� 
 u s i n g� ��� J  ���� ��� m  ���7
�7 
reco� ��6� m  ���5
�5 
enum�6  � ��4� o  ���3�3 0 etext eText�4  �9  � o  ��2�2 0 _support   � ��� n ����� I  ���1��0�1 0 
setlocale_ 
setLocale_� ��/� l ����.�-� n ����� I  ���,��+�, *0 asnslocaleparameter asNSLocaleParameter� ��� o  ���*�* 0 
localecode 
localeCode� ��)� m  ���� ���  f o r   l o c a l e�)  �+  � o  ���(�( 0 _support  �.  �-  �/  �0  � o  ���'�' 0 asocformatter asocFormatter� ��&� L  ���� o  ���%�% 0 asocformatter asocFormatter�&   � � � theNumber is either the number being formatted or `missing value` when parsing; determines appropriate formatting style based on number's type and value when `native format` is specified    � ���v   t h e N u m b e r   i s   e i t h e r   t h e   n u m b e r   b e i n g   f o r m a t t e d   o r   ` m i s s i n g   v a l u e `   w h e n   p a r s i n g ;   d e t e r m i n e s   a p p r o p r i a t e   f o r m a t t i n g   s t y l e   b a s e d   o n   n u m b e r ' s   t y p e   a n d   v a l u e   w h e n   ` n a t i v e   f o r m a t `   i s   s p e c i f i e d � ��� l     �$�#�"�$  �#  �"  � ��� l     �!� ��!  �   �  � ��� i  6 9��� I      ���� "0 _setbasicformat _setBasicFormat� ��� o      �� 0 asocformatter asocFormatter� ��� o      �� 0 
formatname 
formatName� ��� o      �� 0 	thenumber 	theNumber�  �  � Z    Q����� =    ��� o     �� 0 
formatname 
formatName� m    �
� MthZMth0� Z    ������ =   	��� o    �� 0 	thenumber 	theNumber� m    �
� 
msng� l   ���� n   ��� I    ���� "0 setnumberstyle_ setNumberStyle_� ��� l   ���� n   ��� o    �� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m    �
� misccura�  �  �  �  � o    �� 0 asocformatter asocFormatter� ? 9 parsing always recognizes scientific notation by default   � ��� r   p a r s i n g   a l w a y s   r e c o g n i z e s   s c i e n t i f i c   n o t a t i o n   b y   d e f a u l t�  � l   ����� Z    ������ =   ��� n   ��� m    �
� 
pcls� o    �
�
 0 	thenumber 	theNumber� m    �	
�	 
long� l   '���� n   '��� I     '���� "0 setnumberstyle_ setNumberStyle_� ��� l    #���� n    #��� o   ! #�� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m     !�
� misccura�  �  �  �  � o     �� 0 asocformatter asocFormatter�   format integer   � ���    f o r m a t   i n t e g e r� ��� G   * _��� G   * W��� l 
 * ?�� ��� l  * ?������ F   * ?��� A   * 2��� d   * 0�� o   * /���� $0 _maxdecimalrange _maxDecimalRange� o   0 1���� 0 	thenumber 	theNumber� A   5 =��� o   5 6���� 0 	thenumber 	theNumber� d   6 <�� o   6 ;���� $0 _mindecimalrange _minDecimalRange��  ��  �   ��  � l 
 B U ����  l  B U���� F   B U A   B I o   B G���� $0 _mindecimalrange _minDecimalRange o   G H���� 0 	thenumber 	theNumber A   L S o   L M���� 0 	thenumber 	theNumber o   M R���� $0 _maxdecimalrange _maxDecimalRange��  ��  ��  ��  � =   Z ]	 o   Z [���� 0 	thenumber 	theNumber	 m   [ \����  � 
��
 l  b � k   b �  l  b b����   Y S use {basic format:decimal format, minimum decimal places:1, grouping separator:""}    � �   u s e   { b a s i c   f o r m a t : d e c i m a l   f o r m a t ,   m i n i m u m   d e c i m a l   p l a c e s : 1 ,   g r o u p i n g   s e p a r a t o r : " " }  n  b j I   c j������ "0 setnumberstyle_ setNumberStyle_ �� l  c f���� n  c f o   d f���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle m   c d��
�� misccura��  ��  ��  ��   o   b c���� 0 asocformatter asocFormatter  n  k q  I   l q��!���� 60 setminimumfractiondigits_ setMinimumFractionDigits_! "��" m   l m���� ��  ��    o   k l���� 0 asocformatter asocFormatter #$# l  r x%&'% n  r x()( I   s x��*���� 60 setmaximumfractiondigits_ setMaximumFractionDigits_* +��+ m   s t�������  ��  ) o   r s���� 0 asocformatter asocFormatter&   kludge; see note below   ' �,, .   k l u d g e ;   s e e   n o t e   b e l o w$ -.- n  y /0/ I   z ��1���� 60 setusesgroupingseparator_ setUsesGroupingSeparator_1 2��2 m   z {��
�� boovfals��  ��  0 o   y z���� 0 asocformatter asocFormatter. 3��3 l  � ���45��  4 a [ asocFormatter's setAlwaysShowsDecimalSeparator:true -- see notes in _makeNumberFormatter()   5 �66 �   a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   s e e   n o t e s   i n   _ m a k e N u m b e r F o r m a t t e r ( )��     format real as decimal    �77 .   f o r m a t   r e a l   a s   d e c i m a l��  � l  � �89:8 k   � �;; <=< n  � �>?> I   � ���@���� "0 setnumberstyle_ setNumberStyle_@ A��A l  � �B����B n  � �CDC o   � ����� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyleD m   � ���
�� misccura��  ��  ��  ��  ? o   � ����� 0 asocformatter asocFormatter= EFE l  � �GHIG n  � �JKJ I   � ���L���� 0 
setformat_ 
setFormat_L M��M m   � �NN �OO  # . 0 # E + 0��  ��  K o   � ����� 0 asocformatter asocFormatterH � � for consistency with AS, include '+' in positive exponents (oddly, there doesn't appear to be a property on formatter for setting this)   I �PP   f o r   c o n s i s t e n c y   w i t h   A S ,   i n c l u d e   ' + '   i n   p o s i t i v e   e x p o n e n t s   ( o d d l y ,   t h e r e   d o e s n ' t   a p p e a r   t o   b e   a   p r o p e r t y   o n   f o r m a t t e r   f o r   s e t t i n g   t h i s )F QRQ l  � ���ST��  Srl for consistency with AS, always include minimum 1DP, e.g. "1.0E8", not "1E8"; note: for some reason `setAlwaysShowsDecimalSeparator:true` is ignored, while `setMinimumFractionDigits:1` causes number to be truncated (setting it seems to change maximum as well as minimum, which is wrong) unless maximum is set to a higher value afterwards (NSNumberFormatter bugs?)   T �UU�   f o r   c o n s i s t e n c y   w i t h   A S ,   a l w a y s   i n c l u d e   m i n i m u m   1 D P ,   e . g .   " 1 . 0 E 8 " ,   n o t   " 1 E 8 " ;   n o t e :   f o r   s o m e   r e a s o n   ` s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e `   i s   i g n o r e d ,   w h i l e   ` s e t M i n i m u m F r a c t i o n D i g i t s : 1 `   c a u s e s   n u m b e r   t o   b e   t r u n c a t e d   ( s e t t i n g   i t   s e e m s   t o   c h a n g e   m a x i m u m   a s   w e l l   a s   m i n i m u m ,   w h i c h   i s   w r o n g )   u n l e s s   m a x i m u m   i s   s e t   t o   a   h i g h e r   v a l u e   a f t e r w a r d s   ( N S N u m b e r F o r m a t t e r   b u g s ? )R VWV n  � �XYX I   � ���Z���� 60 setminimumfractiondigits_ setMinimumFractionDigits_Z [��[ m   � ����� ��  ��  Y o   � ����� 0 asocformatter asocFormatterW \]\ n  � �^_^ I   � ���`���� 60 setmaximumfractiondigits_ setMaximumFractionDigits_` a��a m   � ��������  ��  _ o   � ����� 0 asocformatter asocFormatter] b��b l  � ���cd��  c V P asocFormatter's setAlwaysShowsDecimalSeparator:true -- disabled; see above note   d �ee �   a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   d i s a b l e d ;   s e e   a b o v e   n o t e��  9    format real as scientific   : �ff 4   f o r m a t   r e a l   a s   s c i e n t i f i c� Q K formatting switches between notations depending on number's type and value   � �gg �   f o r m a t t i n g   s w i t c h e s   b e t w e e n   n o t a t i o n s   d e p e n d i n g   o n   n u m b e r ' s   t y p e   a n d   v a l u e� hih =  � �jkj o   � ����� 0 
formatname 
formatNamek m   � ���
�� MthZMth3i lml l  � �nopn n  � �qrq I   � ���s���� "0 setnumberstyle_ setNumberStyle_s t��t l  � �u����u n  � �vwv o   � ����� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStylew m   � ���
�� misccura��  ��  ��  ��  r o   � ����� 0 asocformatter asocFormattero   uses exponent notation   p �xx .   u s e s   e x p o n e n t   n o t a t i o nm yzy =  � �{|{ o   � ����� 0 
formatname 
formatName| m   � ���
�� MthZMth1z }~} l  � ��� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter� n h uses plain integer notation (caution: do not use for reals unless rounding to whole number is intended)   � ��� �   u s e s   p l a i n   i n t e g e r   n o t a t i o n   ( c a u t i o n :   d o   n o t   u s e   f o r   r e a l s   u n l e s s   r o u n d i n g   t o   w h o l e   n u m b e r   i s   i n t e n d e d )~ ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth2� ��� l  � ����� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter� 8 2 uses thousands separators by default, no exponent   � ��� d   u s e s   t h o u s a n d s   s e p a r a t o r s   b y   d e f a u l t ,   n o   e x p o n e n t� ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth5� ��� l  � ����� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter�   adds currency symbol   � ��� *   a d d s   c u r r e n c y   s y m b o l� ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth4� ��� l  ����� n  ���� I   �������� "0 setnumberstyle_ setNumberStyle_� ���� l  ������� n  ���� o   ����� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter� ( " multiplies by 100 and appends '%'   � ��� D   m u l t i p l i e s   b y   1 0 0   a n d   a p p e n d s   ' % '� ��� = 	��� o  	
���� 0 
formatname 
formatName� m  
��
�� MthZMth6� ��� l ���� n ��� I  ������� "0 setnumberstyle_ setNumberStyle_� ���� l ������ n ��� o  ���� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle� m  ��
�� misccura��  ��  ��  ��  � o  �� 0 asocformatter asocFormatter�   uses words   � ���    u s e s   w o r d s� ��� >  -��� l +��~�}� I +�|��
�| .corecnte****       ****� J  !�� ��{� o  �z�z 0 
formatname 
formatName�{  � �y��x
�y 
kocl� m  $'�w
�w 
ctxt�x  �~  �}  � m  +,�v�v  � ��u� n 06��� I  16�t��s�t 0 
setformat_ 
setFormat_� ��r� o  12�q�q 0 
formatname 
formatName�r  �s  � o  01�p�p 0 asocformatter asocFormatter�u  � R  9Q�o��
�o .ascrerr ****      � ****� m  MP�� ��� r I n v a l i d    b a s i c   f o r m a t    p r o p e r t y :   n o t   a n   a l l o w e d   c o n s t a n t .� �n��
�n 
errn� m  =@�m�m�Y� �l��
�l 
erob� o  CD�k�k 0 
formatname 
formatName� �j��i
�j 
errt� m  GJ�h
�h 
enum�i  � ��� l     �g�f�e�g  �f  �e  � ��� l     �d�c�b�d  �c  �b  � ��� i  : =��� I      �a��`�a  0 _nameforformat _nameForFormat� ��_� o      �^�^ 0 formatstyle formatStyle�_  �`  � l    H���� Z     H����� =    ��� o     �]�] 0 formatstyle formatStyle� m    �\
�\ MthZMth1� L    �� m    �� ���  i n t e g e r� ��� =   ��� o    �[�[ 0 formatstyle formatStyle� m    �Z
�Z MthZMth2�    L     m     �  d e c i m a l  =    o    �Y�Y 0 formatstyle formatStyle m    �X
�X MthZMth5 	
	 L     m     �  c u r r e n c y
  =  ! $ o   ! "�W�W 0 formatstyle formatStyle m   " #�V
�V MthZMth4  L   ' ) m   ' ( �  p e r c e n t  =  , / o   , -�U�U 0 formatstyle formatStyle m   - .�T
�T MthZMth3  L   2 4 m   2 3 �  s c i e n t i f i c  !  =  7 :"#" o   7 8�S�S 0 formatstyle formatStyle# m   8 9�R
�R MthZMth6! $�Q$ L   = ?%% m   = >&& �''  w o r d�Q  � L   B H(( b   B G)*) b   B E+,+ m   B C-- �..  , o   C D�P�P 0 formatstyle formatStyle* m   E F// �00  � G A used for error reporting; formatStyle is either constant or text   � �11 �   u s e d   f o r   e r r o r   r e p o r t i n g ;   f o r m a t S t y l e   i s   e i t h e r   c o n s t a n t   o r   t e x t� 232 l     �O�N�M�O  �N  �M  3 454 l     �L�K�J�L  �K  �J  5 676 l     �I89�I  8  -----   9 �:: 
 - - - - -7 ;<; l     �H�G�F�H  �G  �F  < =>= i  > A?@? I     �EAB
�E .Mth:FNumnull���     nmbrA o      �D�D 0 	thenumber 	theNumberB �CCD
�C 
UsinC |�B�AE�@F�B  �A  E o      �?�? 0 formatstyle formatStyle�@  F l     G�>�=G m      �<
�< MthZMth0�>  �=  D �;H�:
�; 
LocaH |�9�8I�7J�9  �8  I o      �6�6 0 
localecode 
localeCode�7  J l     K�5�4K m      LL �MM  n o n e�5  �4  �:  @ Q     dNOPN k    NQQ RSR l   "TUVT Z   "WX�3�2W =    YZY l   [�1�0[ I   �/\]
�/ .corecnte****       ****\ J    ^^ _�._ o    �-�- 0 	thenumber 	theNumber�.  ] �,`�+
�, 
kocl` m    �*
�* 
nmbr�+  �1  �0  Z m    �)�)  X n   aba I    �(c�'�( 60 throwinvalidparametertype throwInvalidParameterTypec ded o    �&�& 0 	thenumber 	theNumbere fgf m    hh �ii  g jkj m    �%
�% 
nmbrk l�$l m    mm �nn  n u m b e r�$  �'  b o    �#�# 0 _support  �3  �2  U � � only accept integer or real types (i.e. allowing a text parameter to be coerced to number would defeat the purpose of these handlers, which is to avoid unintended localization behavior)   V �oot   o n l y   a c c e p t   i n t e g e r   o r   r e a l   t y p e s   ( i . e .   a l l o w i n g   a   t e x t   p a r a m e t e r   t o   b e   c o e r c e d   t o   n u m b e r   w o u l d   d e f e a t   t h e   p u r p o s e   o f   t h e s e   h a n d l e r s ,   w h i c h   i s   t o   a v o i d   u n i n t e n d e d   l o c a l i z a t i o n   b e h a v i o r )S pqp r   # -rsr I   # +�"t�!�" ,0 _makenumberformatter _makeNumberFormattert uvu o   $ %� �  0 formatstyle formatStylev wxw o   % &�� 0 
localecode 
localeCodex y�y o   & '�� 0 	thenumber 	theNumber�  �!  s o      �� 0 asocformatter asocFormatterq z{z r   . 6|}| n  . 4~~ I   / 4���� &0 stringfromnumber_ stringFromNumber_� ��� o   / 0�� 0 	thenumber 	theNumber�  �   o   . /�� 0 asocformatter asocFormatter} o      �� 0 
asocstring 
asocString{ ��� l  7 I���� Z  7 I����� =  7 :��� o   7 8�� 0 
asocstring 
asocString� m   8 9�
� 
msng� R   = E���
� .ascrerr ****      � ****� m   C D�� ��� F I n v a l i d   n u m b e r   ( c o n v e r s i o n   f a i l e d ) .� ���
� 
errn� m   ? @���Y� ���
� 
erob� o   A B�� 0 	thenumber 	theNumber�  �  �  � n h shouldn't fail, but -stringFromNumber:'s return type isn't declared as non-nullable so check to be sure   � ��� �   s h o u l d n ' t   f a i l ,   b u t   - s t r i n g F r o m N u m b e r : ' s   r e t u r n   t y p e   i s n ' t   d e c l a r e d   a s   n o n - n u l l a b l e   s o   c h e c k   t o   b e   s u r e� ��� L   J N�� c   J M��� o   J K�
�
 0 
asocstring 
asocString� m   K L�	
�	 
ctxt�  O R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      � �  
0 eto eTo�  P I   V d������� 
0 _error  � ��� m   W Z�� ���  f o r m a t   n u m b e r� ��� o   Z [���� 0 etext eText� ��� o   [ \���� 0 enumber eNumber� ��� o   \ ]���� 0 efrom eFrom� ���� o   ] ^���� 
0 eto eTo��  ��  > ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  B E��� I     ����
�� .Mth:PNumnull���     ctxt� o      ���� 0 thetext theText� ����
�� 
Usin� |����������  ��  � o      ���� 0 formatstyle formatStyle��  � l     ������ m      ��
�� MthZMth0��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      �� ���  n o n e��  ��  ��  � Q     ����� k    ��� ��� l   "���� Z   "������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 thetext theText��  � �����
�� 
kocl� m    ��
�� 
ctxt��  ��  ��  � m    ����  � n   ��� I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thetext theText� ��� m    �� ���  � ��� m    ��
�� 
ctxt� ���� m    �� ���  t e x t��  ��  � o    ���� 0 _support  ��  ��  � 1 + only accept text, for same reason as above   � ��� V   o n l y   a c c e p t   t e x t ,   f o r   s a m e   r e a s o n   a s   a b o v e� ��� r   # -��� I   # +������� ,0 _makenumberformatter _makeNumberFormatter� ��� o   $ %���� 0 formatstyle formatStyle� ��� o   % &���� 0 
localecode 
localeCode� ���� m   & '��
�� 
msng��  ��  � o      ���� 0 asocformatter asocFormatter� ��� r   . 6��� n  . 4��� I   / 4������� &0 numberfromstring_ numberFromString_� ���� o   / 0���� 0 thetext theText��  ��  � o   . /���� 0 asocformatter asocFormatter� o      ���� 0 
asocnumber 
asocNumber� ��� Z   7 �������� =  7 :��� o   7 8���� 0 
asocnumber 
asocNumber� m   8 9��
�� 
msng� k   = ��� ��� r   = J��� c   = H��� n  = F   I   B F�������� $0 localeidentifier localeIdentifier��  ��   n  = B I   > B�������� 
0 locale  ��  ��   o   = >���� 0 asocformatter asocFormatter� m   F G��
�� 
ctxt� o      ���� $0 localeidentifier localeIdentifier�  Z   K `�� =   K P	
	 n  K N 1   L N��
�� 
leng o   K L���� $0 localeidentifier localeIdentifier
 m   N O����   l  S V r   S V m   S T �  n o o      ���� $0 localeidentifier localeIdentifier #  empty string = system locale    � :   e m p t y   s t r i n g   =   s y s t e m   l o c a l e��   r   Y ` b   Y ^ b   Y \ m   Y Z � 
 t h e    o   Z [���� $0 localeidentifier localeIdentifier m   \ ] �   o      ���� $0 localeidentifier localeIdentifier �� R   a ��� !
�� .ascrerr ****      � ****  l  m �"����" b   m �#$# b   m }%&% b   m {'(' b   m w)*) m   m p++ �,, R I n v a l i d   t e x t   ( e x p e c t e d   n u m e r i c a l   t e x t   i n  * I   p v��-����  0 _nameforformat _nameForFormat- .��. o   q r���� 0 formatstyle formatStyle��  ��  ( m   w z// �00    f o r m a t   f o r  & o   { |���� $0 localeidentifier localeIdentifier$ m   } �11 �22    l o c a l e ) .��  ��  ! ��34
�� 
errn3 m   e h�����Y4 ��5��
�� 
erob5 o   k l���� 0 thetext theText��  ��  ��  ��  � 6��6 L   � �77 c   � �898 o   � ����� 0 
asocnumber 
asocNumber9 m   � ���
�� 
****��  � R      ��:;
�� .ascrerr ****      � ****: o      ���� 0 etext eText; ��<=
�� 
errn< o      ���� 0 enumber eNumber= ��>?
�� 
erob> o      ���� 0 efrom eFrom? ��@��
�� 
errt@ o      ���� 
0 eto eTo��  � I   � ���A���� 
0 _error  A BCB m   � �DD �EE  p a r s e   n u m b e rC FGF o   � ����� 0 etext eTextG HIH o   � ����� 0 enumber eNumberI JKJ o   � ����� 0 efrom eFromK L��L o   � ����� 
0 eto eTo��  ��  � MNM l     ��������  ��  ��  N OPO l     ��������  ��  ��  P QRQ l     ��ST��  S J D--------------------------------------------------------------------   T �UU � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -R VWV l     ��XY��  X $  Hexadecimal number conversion   Y �ZZ <   H e x a d e c i m a l   n u m b e r   c o n v e r s i o nW [\[ l     ��������  ��  ��  \ ]^] i  F I_`_ I     ��ab
�� .Mth:NuHenull���     ****a o      ���� 0 	thenumber 	theNumberb ��cd
�� 
Placc |��~e�}f�  �~  e o      �|�| 0 	chunksize 	chunkSize�}  f l     g�{�zg m      �y�y  �{  �z  d �xh�w
�x 
Prefh |�v�ui�tj�v  �u  i o      �s�s 0 	hasprefix 	hasPrefix�t  j l     k�r�qk m      �p
�p boovfals�r  �q  �w  ` Q    lmnl k   �oo pqp r    rsr n   tut I    �ov�n�o (0 asintegerparameter asIntegerParameterv wxw o    	�m�m 0 	chunksize 	chunkSizex y�ly m   	 
zz �{{ 
 w i d t h�l  �n  u o    �k�k 0 _support  s o      �j�j 0 	chunksize 	chunkSizeq |}| l   ~�~ r    ��� n   ��� I    �i��h�i (0 asbooleanparameter asBooleanParameter� ��� o    �g�g 0 	hasprefix 	hasPrefix� ��f� m    �� ���  p r e f i x�f  �h  � o    �e�e 0 _support  � o      �d�d 0 	hasprefix 	hasPrefix � � (users shouldn't concatenate their own prefix as that would result in negative numbers appearing as "0x-N�" instead of "-0xN�")   � ���    ( u s e r s   s h o u l d n ' t   c o n c a t e n a t e   t h e i r   o w n   p r e f i x   a s   t h a t   w o u l d   r e s u l t   i n   n e g a t i v e   n u m b e r s   a p p e a r i n g   a s   " 0 x - N & "   i n s t e a d   o f   " - 0 x N & " )} ��c� Z   ����b�� =    *��� l   (��a�`� I   (�_��
�_ .corecnte****       ****� J    "�� ��^� o     �]�] 0 	thenumber 	theNumber�^  � �\��[
�\ 
kocl� m   # $�Z
�Z 
list�[  �a  �`  � m   ( )�Y�Y  � l  -d���� k   -d�� ��� l  - :���� r   - :��� n  - 8��� I   2 8�X��W�X 00 aswholenumberparameter asWholeNumberParameter� ��� o   2 3�V�V 0 	thenumber 	theNumber� ��U� m   3 4�� ���  �U  �W  � o   - 2�T�T 0 _support  � o      �S�S 0 	thenumber 	theNumber� ^ X numbers greater than 2^30 (max integer size) are okay as long as they're non-fractional   � ��� �   n u m b e r s   g r e a t e r   t h a n   2 ^ 3 0   ( m a x   i n t e g e r   s i z e )   a r e   o k a y   a s   l o n g   a s   t h e y ' r e   n o n - f r a c t i o n a l� ��� l  ; ;�R���R  � � � note that the 1024 max chunk size is somewhat arbitrary (the largest representable number requires ~309 chars; anything more will always be left-hand padding), but prevents completely silly values   � ����   n o t e   t h a t   t h e   1 0 2 4   m a x   c h u n k   s i z e   i s   s o m e w h a t   a r b i t r a r y   ( t h e   l a r g e s t   r e p r e s e n t a b l e   n u m b e r   r e q u i r e s   ~ 3 0 9   c h a r s ;   a n y t h i n g   m o r e   w i l l   a l w a y s   b e   l e f t - h a n d   p a d d i n g ) ,   b u t   p r e v e n t s   c o m p l e t e l y   s i l l y   v a l u e s� ��� Z  ; Z���Q�P� G   ; F��� A   ; >��� o   ; <�O�O 0 	chunksize 	chunkSize� m   < =�N�N  � ?   A D��� o   A B�M�M 0 	chunksize 	chunkSize� m   B C�L�L � n  I V��� I   N V�K��J�K .0 throwinvalidparameter throwInvalidParameter� ��� o   N O�I�I 0 	chunksize 	chunkSize� ��� m   O P�� ��� 
 w i d t h� ��� m   P Q�H
�H 
long� ��G� m   Q R�� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   0   a n d   1 0 2 4 .�G  �J  � o   I N�F�F 0 _support  �Q  �P  � ��� r   [ `��� m   [ ^�� ���  � o      �E�E 0 hextext hexText� ��� Z   a���D�� A   a d��� o   a b�C�C 0 	thenumber 	theNumber� m   b c�B�B  � k   g ��� ��� Z  g ����A�@� F   g w��� ?   g j��� o   g h�?�? 0 	chunksize 	chunkSize� m   h i�>�>  � l  m u��=�<� A   m u��� o   m n�;�; 0 	thenumber 	theNumber� d   n t�� l  n s��:�9� a   n s��� m   n q�8�8 � o   q r�7�7 0 	chunksize 	chunkSize�:  �9  �=  �<  � n  z ���� I    ��6��5�6 .0 throwinvalidparameter throwInvalidParameter� ��� o    ��4�4 0 	thenumber 	theNumber� ��� m   � ��� ���  � ��� m   � ��3
�3 
long� ��2� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s  � o   � ��1�1 0 	chunksize 	chunkSize� m   � �   � J - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n  � _   � � d   � � l  � ��0�/ a   � � m   � ��.�.  o   � ��-�- 0 	chunksize 	chunkSize�0  �/   m   � ��,�, � m   � � �		 
   a n d  � _   � �

 l  � ��+�* \   � � a   � � m   � ��)�)  o   � ��(�( 0 	chunksize 	chunkSize m   � ��'�' �+  �*   m   � ��&�& � m   � � �  ) .�2  �5  � o   z �%�% 0 _support  �A  �@  �  r   � � m   � � �  - o      �$�$ 0 	hexprefix 	hexPrefix �# r   � � d   � � o   � ��"�" 0 	thenumber 	theNumber o      �!�! 0 	thenumber 	theNumber�#  �D  � k   �  r   � � !  m   � �"" �##  ! o      � �  0 	hexprefix 	hexPrefix $�$ Z  �%&��% F   � �'(' ?   � �)*) o   � ��� 0 	chunksize 	chunkSize* m   � ���  ( l  � �+��+ ?   � �,-, o   � ��� 0 	thenumber 	theNumber- \   � �./. a   � �010 m   � ��� 1 o   � ��� 0 	chunksize 	chunkSize/ m   � ��� �  �  & n  �
232 I   �
�4�� .0 throwinvalidparameter throwInvalidParameter4 565 o   � ��� 0 	thenumber 	theNumber6 787 m   � �99 �::  8 ;<; m   � ��
� 
long< =�= b   �>?> b   �@A@ b   � �BCB b   � �DED b   � �FGF b   � �HIH m   � �JJ �KK H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s  I o   � ��� 0 	chunksize 	chunkSizeG m   � �LL �MM J - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n  E _   � �NON d   � �PP l  � �Q��Q a   � �RSR m   � ��� S o   � ��� 0 	chunksize 	chunkSize�  �  O m   � ��
�
 C m   � �TT �UU 
   a n d  A _   �VWV l  � �X�	�X \   � �YZY a   � �[\[ m   � ��� \ o   � ��� 0 	chunksize 	chunkSizeZ m   � ��� �	  �  W m   � �� ? m  ]] �^^  ) .�  �  3 o   � ��� 0 _support  �  �  �  � _`_ Z ab��a o  � �  0 	hasprefix 	hasPrefixb r  cdc b  efe o  ���� 0 	hexprefix 	hexPrefixf m  gg �hh  0 xd o      ���� 0 	hexprefix 	hexPrefix�  �  ` iji V  Fklk k  'Amm non r  '9pqp b  '7rsr l '5t����t n  '5uvu 4  *5��w
�� 
cobjw l -4x����x [  -4yzy `  -2{|{ o  -.���� 0 	thenumber 	theNumber| m  .1���� z m  23���� ��  ��  v m  '*}} �~~   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ��  s o  56���� 0 hextext hexTextq o      ���� 0 hextext hexTexto �� r  :A��� _  :?��� o  :;���� 0 	thenumber 	theNumber� m  ;>���� � o      ���� 0 	thenumber 	theNumber��  l ?  #&��� o  #$���� 0 	thenumber 	theNumber� m  $%����  j ��� V  G_��� r  SZ��� b  SX��� m  SV�� ���  0� o  VW���� 0 hextext hexText� o      ���� 0 hextext hexText� A  KR��� n  KP��� 1  LP��
�� 
leng� o  KL���� 0 hextext hexText� o  PQ���� 0 	chunksize 	chunkSize� ���� L  `d�� b  `c��� o  `a���� 0 	hexprefix 	hexPrefix� o  ab���� 0 hextext hexText��  �   format single number   � ��� *   f o r m a t   s i n g l e   n u m b e r�b  � l g����� k  g��� ��� l g����� Z g�������� G  gr��� A  gj��� o  gh���� 0 	chunksize 	chunkSize� m  hi���� � ?  mp��� o  mn���� 0 	chunksize 	chunkSize� m  no���� � n u���� I  z�������� .0 throwinvalidparameter throwInvalidParameter� ��� o  z{���� 0 	chunksize 	chunkSize� ��� m  {~�� ��� 
 w i d t h� ��� m  ~��
�� 
long� ���� m  ��� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   1   a n d   1 0 2 4 .��  ��  � o  uz���� 0 _support  ��  ��  �   chunksize must be given   � ��� 0   c h u n k s i z e   m u s t   b e   g i v e n� ��� r  ����� J  ���� ��� m  ���� ���  � ���� \  ����� a  ����� m  ������ � o  ������ 0 	chunksize 	chunkSize� m  ������ ��  � J      �� ��� o      ���� 0 padtext padText� ���� o      ���� 0 maxsize maxSize��  � ��� U  ����� r  ����� b  ����� o  ������ 0 padtext padText� m  ���� ���  0� o      ���� 0 padtext padText� o  ������ 0 	chunksize 	chunkSize� ��� h  ������� 0 
resultlist 
resultList� j     	����� 
0 _list_  � n    ��� 2   ��
�� 
cobj� o     ���� 0 	thenumber 	theNumber� ��� Y  ���������� k  ���� ��� Q  �e���� k  ��� ��� r  ����� n ����� 4  �����
�� 
cobj� o  ������ 0 i  � n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultList� o      ���� 0 	thenumber 	theNumber� ��� r  ����� c  ����� o  ������ 0 	thenumber 	theNumber� m  ����
�� 
long� o      ���� 0 
theinteger 
theInteger� ���� Z �������� G  ���� G  ���� >  ����� o  ������ 0 
theinteger 
theInteger� c  ��� � o  ������ 0 	thenumber 	theNumber  m  ����
�� 
doub� A  � o  ������ 0 
theinteger 
theInteger m  � ����  � ?  	 o  ���� 0 
theinteger 
theInteger o  ���� 0 maxsize maxSize� R  ����
�� .ascrerr ****      � ****��   ����
�� 
errn m  �����\��  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d      		 m      �������  � k  $e

  Z  $K�� ?  $' o  $%���� 0 
theinteger 
theInteger o  %&���� 0 maxsize maxSize r  *C b  *A b  *= b  *3 b  */ m  *- � H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s   o  -.���� 0 	chunksize 	chunkSize m  /2 � V - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n   0   a n d   _  3< !  l 3:"����" \  3:#$# a  38%&% m  36���� & o  67���� 0 	chunksize 	chunkSize$ m  89���� ��  ��  ! m  :;����  m  =@'' �((  ) . o      ���� 0 etext eText��   r  FK)*) m  FI++ �,, T N o t   a   n o n - n e g a t i v e ,   n o n - f r a c t i o n a l   n u m b e r .* o      ���� 0 etext eText -��- n Le./. I  Qe��0���� .0 throwinvalidparameter throwInvalidParameter0 121 N  Q\33 n Q[454 4  V[��6
�� 
cobj6 o  YZ���� 0 i  5 n QV787 o  RV���� 
0 _list_  8 o  QR���� 0 
resultlist 
resultList2 9:9 m  \_;; �<<  : =>= m  _`��
�� 
long> ?��? o  `a���� 0 etext eText��  ��  / o  LQ���� 0 _support  ��  � @A@ r  fkBCB m  fiDD �EE  C o      ���� 0 hextext hexTextA FGF V  l�HIH k  t�JJ KLK r  t�MNM b  t�OPO l t�Q����Q n  t�RSR 4  w���T
�� 
cobjT l z�U����U [  z�VWV `  zXYX o  z{���� 0 
theinteger 
theIntegerY m  {~���� W m  ����� ��  ��  S m  twZZ �[[   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ��  P o  ������ 0 hextext hexTextN o      ���� 0 hextext hexTextL \��\ r  ��]^] _  ��_`_ o  ������ 0 
theinteger 
theInteger` m  ������ ^ o      ���� 0 
theinteger 
theInteger��  I ?  psaba o  pq���� 0 
theinteger 
theIntegerb m  qr����  G c��c r  ��ded n ��fgf 7 ����hi
�� 
ctxth d  ��jj o  ������ 0 	chunksize 	chunkSizei m  ��������g l ��k����k b  ��lml o  ���� 0 padtext padTextm o  ���~�~ 0 hextext hexText��  ��  e n     non 4  ���}p
�} 
cobjp o  ���|�| 0 i  o n ��qrq o  ���{�{ 
0 _list_  r o  ���z�z 0 
resultlist 
resultList��  �� 0 i  � m  ���y�y � n ��sts 1  ���x
�x 
lengt n ��uvu o  ���w�w 
0 _list_  v o  ���v�v 0 
resultlist 
resultList��  � wxw r  ��yzy n ��{|{ 1  ���u
�u 
txdl| 1  ���t
�t 
ascrz o      �s�s 0 oldtids oldTIDsx }~} r  ��� m  ���� ���  � n     ��� 1  ���r
�r 
txdl� 1  ���q
�q 
ascr~ ��� Z  �����p�� o  ���o�o 0 	hasprefix 	hasPrefix� r  ����� b  ����� m  ���� ���  0 x� n ����� o  ���n�n 
0 _list_  � o  ���m�m 0 
resultlist 
resultList� o      �l�l 0 hextext hexText�p  � r  ����� c  ����� n ����� o  ���k�k 
0 _list_  � o  ���j�j 0 
resultlist 
resultList� m  ���i
�i 
ctxt� o      �h�h 0 hextext hexText� ��� r  ����� o  ���g�g 0 oldtids oldTIDs� n     ��� 1  ���f
�f 
txdl� 1  ���e
�e 
ascr� ��d� L  ���� o  ���c�c 0 hextext hexText�d  �   format list of number   � ��� ,   f o r m a t   l i s t   o f   n u m b e r�c  m R      �b��
�b .ascrerr ****      � ****� o      �a�a 0 etext eText� �`��
�` 
errn� o      �_�_ 0 enumber eNumber� �^��
�^ 
erob� o      �]�] 0 efrom eFrom� �\��[
�\ 
errt� o      �Z�Z 
0 eto eTo�[  n I  ��Y��X�Y 
0 _error  � ��� m  ��� ���  f o r m a t   h e x� ��� o  �W�W 0 etext eText� ��� o  �V�V 0 enumber eNumber� ��� o  �U�U 0 efrom eFrom� ��T� o  �S�S 
0 eto eTo�T  �X  ^ ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O�N�M�O  �N  �M  � ��� i  J M��� I     �L��
�L .Mth:HeNunull���     ctxt� o      �K�K 0 hextext hexText� �J��
�J 
Plac� |�I�H��G��I  �H  � o      �F�F 0 	chunksize 	chunkSize�G  � l     ��E�D� m      �C�C  �E  �D  � �B��A
�B 
Prec� |�@�?��>��@  �?  � o      �=�= 0 	isprecise 	isPrecise�>  � l     ��<�;� m      �:
�: boovfals�<  �;  �A  � Q    `���� P   J���� k   I�� ��� r    ��� n   ��� I    �9��8�9 "0 astextparameter asTextParameter� ��� o    �7�7 0 hextext hexText� ��6� m    �� ���  �6  �8  � o    �5�5 0 _support  � o      �4�4 0 hextext hexText� ��� r    #��� n   !��� I    !�3��2�3 (0 asintegerparameter asIntegerParameter� ��� o    �1�1 0 	chunksize 	chunkSize� ��0� m    �� ��� 
 w i d t h�0  �2  � o    �/�/ 0 _support  � o      �.�. 0 	chunksize 	chunkSize� ��� Z  $ C���-�,� G   $ /��� A   $ '��� o   $ %�+�+ 0 	chunksize 	chunkSize� m   % &�*�*  � ?   * -��� o   * +�)�) 0 	chunksize 	chunkSize� m   + ,�(�( � n  2 ?��� I   7 ?�'��&�' .0 throwinvalidparameter throwInvalidParameter� ��� o   7 8�%�% 0 	chunksize 	chunkSize� ��� m   8 9�� ��� 
 w i d t h� ��� m   9 :�$
�$ 
long� ��#� m   : ;�� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   0   a n d   1 0 2 4 .�#  �&  � o   2 7�"�" 0 _support  �-  �,  � ��� r   D R   H   D P n  D O I   I O�!� �! (0 asbooleanparameter asBooleanParameter  o   I J�� 0 	isprecise 	isPrecise � m   J K		 �

  p r e c i s i o n   l o s s�  �    o   D I�� 0 _support   o      �� 0 	isprecise 	isPrecise� � Z   SI� =   S V o   S T�� 0 	chunksize 	chunkSize m   T U��   l  YA k   YA  Q   Y k   \ �  r   \ _ m   \ ]��   o      �� 0 	thenumber 	theNumber   r   ` e!"! C   ` c#$# o   ` a�� 0 hextext hexText$ m   a b%% �&&  -" o      �� 0 
isnegative 
isNegative  '(' Z  f })*��) o   f g�� 0 
isnegative 
isNegative* r   j y+,+ n   j w-.- 7  k w�/0
� 
ctxt/ m   q s�� 0 m   t v����. o   j k�� 0 hextext hexText, o      �� 0 hextext hexText�  �  ( 121 Z  ~ �34��
3 C   ~ �565 o   ~ �	�	 0 hextext hexText6 m    �77 �88  0 x4 r   � �9:9 n   � �;<; 7  � ��=>
� 
ctxt= m   � ��� > m   � �����< o   � ��� 0 hextext hexText: o      �� 0 hextext hexText�  �
  2 ?�? X   � �@�A@ k   � �BB CDC r   � �EFE ]   � �GHG o   � ��� 0 	thenumber 	theNumberH m   � �� �  F o      ���� 0 	thenumber 	theNumberD IJI r   � �KLK I  � �M��NM z����
�� .sysooffslong    ��� null
�� misccura��  N ��OP
�� 
psofO o   � ����� 0 charref charRefP ��Q��
�� 
psinQ m   � �RR �SS   0 1 2 3 4 5 6 7 8 9 A B C D E F��  L o      ���� 0 i  J TUT Z  � �VW����V =   � �XYX o   � ����� 0 i  Y m   � �����  W R   � �����Z
�� .ascrerr ****      � ****��  Z ��[��
�� 
errn[ m   � ������@��  ��  ��  U \��\ r   � �]^] \   � �_`_ [   � �aba o   � ����� 0 	thenumber 	theNumberb o   � ����� 0 i  ` m   � ����� ^ o      ���� 0 	thenumber 	theNumber��  � 0 charref charRefA o   � ����� 0 hextext hexText�   R      ����c
�� .ascrerr ****      � ****��  c ��d��
�� 
errnd d      ee m      �������   l  �fghf n  �iji I   ���k���� .0 throwinvalidparameter throwInvalidParameterk lml o   � ����� 0 hextext hexTextm non m   �pp �qq  o rsr m  ��
�� 
ctxts t��t m  uu �vv N T e x t   i s   n o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .��  ��  j o   � ����� 0 _support  g E ? catch errors if hexText is too short or contains non-hex chars   h �ww ~   c a t c h   e r r o r s   i f   h e x T e x t   i s   t o o   s h o r t   o r   c o n t a i n s   n o n - h e x   c h a r s xyx Z 1z{����z F  |}| o  ���� 0 	isprecise 	isPrecise} l ~����~ =  � o  ���� 0 	thenumber 	theNumber� [  ��� o  ���� 0 	thenumber 	theNumber� m  ���� ��  ��  { n -��� I  -������� .0 throwinvalidparameter throwInvalidParameter� ��� o   ���� 0 hextext hexText� ��� m   #�� ���  � ��� m  #&��
�� 
ctxt� ���� m  &)�� ��� � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   r e p r e s e n t   a s   a   r e a l   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .��  ��  � o  ���� 0 _support  ��  ��  y ��� Z 2>������� o  23���� 0 
isnegative 
isNegative� r  6:��� d  68�� o  67���� 0 	thenumber 	theNumber� o      ���� 0 	thenumber 	theNumber��  ��  � ���� L  ?A�� o  ?@���� 0 	thenumber 	theNumber��     read as single number    ��� ,   r e a d   a s   s i n g l e   n u m b e r�   l DI���� k  DI�� ��� Z Dm������� >  DM��� `  DK��� l DI������ n DI��� 1  EI��
�� 
leng� o  DE���� 0 hextext hexText��  ��  � o  IJ���� 0 	chunksize 	chunkSize� m  KL����  � n Pi��� I  Ui������� .0 throwinvalidparameter throwInvalidParameter� ��� o  UV���� 0 hextext hexText� ��� m  VY�� ���  � ��� m  Y\��
�� 
ctxt� ���� b  \e��� b  \a��� m  \_�� ��� T C a n ' t   s p l i t   h e x a d e c i m a l   t e x t   e x a c t l y   i n t o  � o  _`���� 0 	chunksize 	chunkSize� m  ad�� ���  - d i g i t   c h u n k s .��  ��  � o  PU���� 0 _support  ��  ��  � ��� h  ny����� 0 
resultlist 
resultList� j     ����� 
0 _list_  � J     ����  � ��� Y  zA������� k  �<�� ��� r  ����� m  ������  � o      ���� 0 	thenumber 	theNumber� ��� X  ������� k  ���� ��� r  ����� ]  ����� o  ������ 0 	thenumber 	theNumber� m  ������ � o      ���� 0 	thenumber 	theNumber� ��� r  ����� I ������� z����
�� .sysooffslong    ��� null
�� misccura��  � ����
�� 
psof� o  ������ 0 charref charRef� �����
�� 
psin� m  ���� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F��  � o      ���� 0 i  � ��� Z ��������� =  ����� o  ������ 0 i  � m  ������  � n ����� I  ��������� .0 throwinvalidparameter throwInvalidParameter� ��� o  ������ 0 hextext hexText� ��� m  ���� ���  � ��� m  ����
�� 
ctxt� ���� m  ���� ��� N T e x t   i s   n o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .��  ��  � o  ������ 0 _support  ��  ��  � ���� r  ����� \  ����� [  ����� o  ������ 0 	thenumber 	theNumber� o  ������ 0 i  � m  ������ � o      ���� 0 	thenumber 	theNumber��  �� 0 charref charRef� n ����� 7 ����	 	
�� 
ctxt	  o  ������ 0 i  	 l ��	����	 \  ��			 [  ��			 o  ������ 0 i  	 o  ������ 0 	chunksize 	chunkSize	 m  ������ ��  ��  � o  ������ 0 hextext hexText� 			 Z �3			
����		 F  �			 o  ������ 0 	isprecise 	isPrecise	 l 	����	 =  			 o  ���� 0 	thenumber 	theNumber	 [  			 o  ���� 0 	thenumber 	theNumber	 m  ���� ��  ��  	
 n /			 I  /��	���� .0 throwinvalidparameter throwInvalidParameter	 			 N  "		 n  !			 7 !��		
�� 
ctxt	 o  ���� 0 i  	 l  	����	 \   			 [  		 	 o  ���� 0 i  	  o  ���� 0 	chunksize 	chunkSize	 m  �� ��  ��  	 o  �~�~ 0 hextext hexText	 	!	"	! m  "%	#	# �	$	$  	" 	%	&	% m  %(�}
�} 
ctxt	& 	'�|	' m  (+	(	( �	)	) � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .�|  ��  	 o  �{�{ 0 _support  ��  ��  	 	*�z	* r  4<	+	,	+ o  45�y�y 0 	thenumber 	theNumber	, n      	-	.	-  ;  :;	. n 5:	/	0	/ o  6:�x�x 
0 _list_  	0 o  56�w�w 0 
resultlist 
resultList�z  �� 0 i  � m  }~�v�v � n ~�	1	2	1 1  ��u
�u 
leng	2 o  ~�t�t 0 hextext hexText� o  ���s�s 0 	chunksize 	chunkSize� 	3�r	3 L  BI	4	4 n BH	5	6	5 o  CG�q�q 
0 _list_  	6 o  BC�p�p 0 
resultlist 
resultList�r  �   read as list of numbers   � �	7	7 0   r e a d   a s   l i s t   o f   n u m b e r s�  � �o	8
�o consdiac	8 �n	9
�n conshyph	9 �m	:
�m conspunc	: �l�k
�l conswhit�k  � �j	;
�j conscase	; �i�h
�i consnume�h  � R      �g	<	=
�g .ascrerr ****      � ****	< o      �f�f 0 etext eText	= �e	>	?
�e 
errn	> o      �d�d 0 enumber eNumber	? �c	@	A
�c 
erob	@ o      �b�b 0 efrom eFrom	A �a	B�`
�a 
errt	B o      �_�_ 
0 eto eTo�`  � I  R`�^	C�]�^ 
0 _error  	C 	D	E	D m  SV	F	F �	G	G  p a r s e   h e x	E 	H	I	H o  VW�\�\ 0 etext eText	I 	J	K	J o  WX�[�[ 0 enumber eNumber	K 	L	M	L o  XY�Z�Z 0 efrom eFrom	M 	N�Y	N o  YZ�X�X 
0 eto eTo�Y  �]  � 	O	P	O l     �W�V�U�W  �V  �U  	P 	Q	R	Q l     �T�S�R�T  �S  �R  	R 	S	T	S l     �Q	U	V�Q  	U J D--------------------------------------------------------------------   	V �	W	W � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	T 	X	Y	X l     �P	Z	[�P  	Z !  General numeric operations   	[ �	\	\ 6   G e n e r a l   n u m e r i c   o p e r a t i o n s	Y 	]	^	] l     �O�N�M�O  �N  �M  	^ 	_	`	_ i  N Q	a	b	a I     �L	c�K
�L .Mth:DeRanull���     doub	c o      �J�J 0 x  �K  	b Q     	d	e	f	d L    	g	g ]    
	h	i	h l   	j�I�H	j c    	k	l	k o    �G�G 0 x  	l m    �F
�F 
doub�I  �H  	i l   		m�E�D	m ^    		n	o	n 1    �C
�C 
pi  	o m    �B�B ��E  �D  	e R      �A	p	q
�A .ascrerr ****      � ****	p o      �@�@ 0 etext eText	q �?	r	s
�? 
errn	r o      �>�> 0 enumber eNumber	s �=	t	u
�= 
erob	t o      �<�< 0 efrom eFrom	u �;	v�:
�; 
errt	v o      �9�9 
0 eto eTo�:  	f I    �8	w�7�8 
0 _error  	w 	x	y	x m    	z	z �	{	{  r a d i a n s	y 	|	}	| o    �6�6 0 etext eText	} 	~		~ o    �5�5 0 enumber eNumber	 	�	�	� o    �4�4 0 efrom eFrom	� 	��3	� o    �2�2 
0 eto eTo�3  �7  	` 	�	�	� l     �1�0�/�1  �0  �/  	� 	�	�	� l     �.�-�,�.  �-  �,  	� 	�	�	� i  R U	�	�	� I     �+	��*
�+ .Mth:RaDenull���     doub	� o      �)�) 0 x  �*  	� Q     	�	�	�	� L    	�	� ^    
	�	�	� l   	��(�'	� c    	�	�	� o    �&�& 0 x  	� m    �%
�% 
doub�(  �'  	� l   		��$�#	� ^    		�	�	� 1    �"
�" 
pi  	� m    �!�! ��$  �#  	� R      � 	�	�
�  .ascrerr ****      � ****	� o      �� 0 etext eText	� �	�	�
� 
errn	� o      �� 0 enumber eNumber	� �	�	�
� 
erob	� o      �� 0 efrom eFrom	� �	��
� 
errt	� o      �� 
0 eto eTo�  	� I    �	��� 
0 _error  	� 	�	�	� m    	�	� �	�	�  d e g r e e s	� 	�	�	� o    �� 0 etext eText	� 	�	�	� o    �� 0 enumber eNumber	� 	�	�	� o    �� 0 efrom eFrom	� 	��	� o    �� 
0 eto eTo�  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� l     �
�	��
  �	  �  	� 	�	�	� i  V Y	�	�	� I     �	��
� .Mth:Abs_null���     nmbr	� o      �� 0 x  �  	� Q     )	�	�	�	� k    	�	� 	�	�	� r    	�	�	� c    	�	�	� o    �� 0 x  	� m    �
� 
nmbr	� o      �� 0 x  	� 	��	� Z   	 	�	�� 	�	� A   	 	�	�	� o   	 
���� 0 x  	� m   
 ����  	� L    	�	� d    	�	� o    ���� 0 x  �   	� L    	�	� o    ���� 0 x  �  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	� I    )��	����� 
0 _error  	� 	�	�	� m     !	�	� �	�	�  a b s	� 	�	�	� o   ! "���� 0 etext eText	� 	�	�	� o   " #���� 0 enumber eNumber	� 	�	�	� o   # $���� 0 efrom eFrom	� 	���	� o   $ %���� 
0 eto eTo��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  Z ]	�	�	� I     ��	���
�� .Mth:CmpNnull���     ****	� J      	�	� 	�	�	� o      ���� 0 n1  	� 	���	� o      ���� 0 n2  ��  ��  	� Q     �	�	�	�	� k    �	�	� 	�	�	� Z    �	�	���	�	� =    	�	�	� l   	�����	� I   ��	�	�
�� .corecnte****       ****	� J    	�	� 	�	�	� o    ���� 0 n1  	� 	���	� o    ���� 0 n2  ��  	� ��	���
�� 
kocl	� m    	��
�� 
long��  ��  ��  	� m    ���� 	� Z   	�	�����	� =    	�	�	� o    ���� 0 n1  	� o    ���� 0 n2  	� L    
 
  m    ����  ��  ��  ��  	� k   ! �

 


 r   ! 8


 J   ! )

 


 c   ! $
	


	 o   ! "���� 0 n1  

 m   " #��
�� 
doub
 
��
 c   $ '


 o   $ %���� 0 n2  
 m   % &��
�� 
doub��  
 J      

 


 o      ���� 0 n1  
 
��
 o      ���� 0 n2  ��  
 


 Z   9 T

��

 =   9 <


 o   9 :���� 0 n1  
 m   : ;����  
 r   ? H


 ]   ? F


 o   ? D���� 0 _isequaldelta _isEqualDelta
 o   D E���� 0 n2  
 o      ���� 0 dn  ��  
 r   K T


 ]   K R

 
 o   K P���� 0 _isequaldelta _isEqualDelta
  o   P Q���� 0 n1  
 o      ���� 0 dn  
 
!
"
! r   U Y
#
$
# d   U W
%
% o   U V���� 0 dn  
$ o      ���� 0 dm  
" 
&
'
& Z  Z w
(
)����
( ?   Z ]
*
+
* o   Z [���� 0 dm  
+ o   [ \���� 0 dn  
) r   ` s
,
-
, J   ` d
.
. 
/
0
/ o   ` a���� 0 dm  
0 
1��
1 o   a b���� 0 dn  ��  
- J      
2
2 
3
4
3 o      ���� 0 dn  
4 
5��
5 o      ���� 0 dm  ��  ��  ��  
' 
6
7
6 r   x }
8
9
8 \   x {
:
;
: o   x y���� 0 n2  
; o   y z���� 0 n1  
9 o      ���� 0 d  
7 
<��
< Z  ~ �
=
>����
= F   ~ �
?
@
? ?   ~ �
A
B
A o   ~ ���� 0 d  
B o    ����� 0 dm  
@ A   � �
C
D
C o   � ����� 0 d  
D o   � ����� 0 dn  
> L   � �
E
E m   � �����  ��  ��  ��  	� 
F��
F Z   � �
G
H��
I
G A   � �
J
K
J o   � ����� 0 n1  
K o   � ����� 0 n2  
H L   � �
L
L m   � ���������  
I L   � �
M
M m   � ����� ��  	� R      ��
N
O
�� .ascrerr ****      � ****
N o      ���� 0 etext eText
O ��
P
Q
�� 
errn
P o      ���� 0 enumber eNumber
Q ��
R
S
�� 
erob
R o      ���� 0 efrom eFrom
S ��
T��
�� 
errt
T o      ���� 
0 eto eTo��  	� I   � ���
U���� 
0 _error  
U 
V
W
V m   � �
X
X �
Y
Y  c m p
W 
Z
[
Z o   � ����� 0 etext eText
[ 
\
]
\ o   � ����� 0 enumber eNumber
] 
^
_
^ o   � ����� 0 efrom eFrom
_ 
`��
` o   � ����� 
0 eto eTo��  ��  	� 
a
b
a l     ��������  ��  ��  
b 
c
d
c l     ��������  ��  ��  
d 
e
f
e i  ^ a
g
h
g I     ��
i��
�� .Mth:MinNnull���     ****
i o      ���� 0 thelist theList��  
h Q     �
j
k
l
j k    �
m
m 
n
o
n h    
��
p�� 0 
listobject 
listObject
p j     ��
q�� 
0 _list_  
q n    
r
s
r I    ��
t���� "0 aslistparameter asListParameter
t 
u
v
u o    
���� 0 thelist theList
v 
w��
w m   
 
x
x �
y
y  ��  ��  
s o     ���� 0 _support  
o 
z
{
z Z   &
|
}����
| =    
~

~ n   
�
�
� 1    ��
�� 
leng
� n   
�
�
� o    �� 
0 _list_  
� o    �~�~ 0 
listobject 
listObject
 m    �}�}  
} n   "
�
�
� I    "�|
��{�| .0 throwinvalidparameter throwInvalidParameter
� 
�
�
� o    �z�z 0 thelist theList
� 
�
�
� m    
�
� �
�
�  
� 
�
�
� m    �y
�y 
list
� 
��x
� m    
�
� �
�
� ( L i s t   c a n  t   b e   e m p t y .�x  �{  
� o    �w�w 0 _support  ��  ��  
{ 
�
�
� r   ' *
�
�
� m   ' (�v�v 
� o      �u�u 0 i  
� 
�
�
� Q   + �
�
�
�
� k   . e
�
� 
�
�
� r   . 8
�
�
� c   . 6
�
�
� l  . 4
��t�s
� n   . 4
�
�
� 4   1 4�r
�
�r 
cobj
� m   2 3�q�q 
� n  . 1
�
�
� o   / 1�p�p 
0 _list_  
� o   . /�o�o 0 
listobject 
listObject�t  �s  
� m   4 5�n
�n 
nmbr
� o      �m�m 0 	theresult 	theResult
� 
��l
� Y   9 e
��k
�
��j
� k   H `
�
� 
�
�
� r   H R
�
�
� c   H P
�
�
� n  H N
�
�
� 4   K N�i
�
�i 
cobj
� o   L M�h�h 0 i  
� n  H K
�
�
� o   I K�g�g 
0 _list_  
� o   H I�f�f 0 
listobject 
listObject
� m   N O�e
�e 
nmbr
� o      �d�d 0 n  
� 
��c
� Z  S `
�
��b�a
� A   S V
�
�
� o   S T�`�` 0 n  
� o   T U�_�_ 0 	theresult 	theResult
� r   Y \
�
�
� o   Y Z�^�^ 0 n  
� o      �]�] 0 	theresult 	theResult�b  �a  �c  �k 0 i  
� m   < =�\�\ 
� n  = C
�
�
� 1   @ B�[
�[ 
leng
� n  = @
�
�
� o   > @�Z�Z 
0 _list_  
� o   = >�Y�Y 0 
listobject 
listObject�j  �l  
� R      �X
�
�
�X .ascrerr ****      � ****
� o      �W�W 0 etext eText
� �V
��U
�V 
errn
� d      
�
� m      �T�T��U  
� l  m �
�
�
�
� l  m �
�
�
�
� n  m �
�
�
� I   r ��S
��R�S .0 throwinvalidparameter throwInvalidParameter
� 
�
�
� N   r w
�
� n   r v
�
�
� 4   s v�Q
�
�Q 
cobj
� o   t u�P�P 0 i  
� o   r s�O�O 0 thelist theList
� 
�
�
� m   w x
�
� �
�
�  
� 
�
�
� m   x y�N
�N 
nmbr
� 
��M
� b   y |
�
�
� m   y z
�
� �
�
� 2 L i s t   i t e m   i s   w r o n g   t y p e :  
� o   z {�L�L 0 etext eText�M  �R  
� o   m r�K�K 0 _support  
� note: AS doesn't provide a meaningful reference when `repeat with aRef in  listObject's _list_` is used (e.g. `item 2 of _list_`), so to provide useful error messages a counting loop is used and a readable reference constructed using that (e.g. `item 2 of {3, "x"}`)   
� �
�
�   n o t e :   A S   d o e s n ' t   p r o v i d e   a   m e a n i n g f u l   r e f e r e n c e   w h e n   ` r e p e a t   w i t h   a R e f   i n     l i s t O b j e c t ' s   _ l i s t _ `   i s   u s e d   ( e . g .   ` i t e m   2   o f   _ l i s t _ ` ) ,   s o   t o   p r o v i d e   u s e f u l   e r r o r   m e s s a g e s   a   c o u n t i n g   l o o p   i s   u s e d   a n d   a   r e a d a b l e   r e f e r e n c e   c o n s t r u c t e d   u s i n g   t h a t   ( e . g .   ` i t e m   2   o f   { 3 ,   " x " } ` )
� ( " couldn't coerce an item to number   
� �
�
� D   c o u l d n ' t   c o e r c e   a n   i t e m   t o   n u m b e r
� 
��J
� L   � �
�
� o   � ��I�I 0 	theresult 	theResult�J  
k R      �H
�
�
�H .ascrerr ****      � ****
� o      �G�G 0 etext eText
� �F
�
�
�F 
errn
� o      �E�E 0 enumber eNumber
� �D
�
�
�D 
erob
� o      �C�C 0 efrom eFrom
� �B
��A
�B 
errt
� o      �@�@ 
0 eto eTo�A  
l I   � ��?
��>�? 
0 _error  
� 
�
�
� m   � �
�
� �
�
�  m i n
� 
�
�
� o   � ��=�= 0 etext eText
� 
�
�
� o   � ��<�< 0 enumber eNumber
� 
�
�
� o   � ��;�; 0 efrom eFrom
� 
��:
� o   � ��9�9 
0 eto eTo�:  �>  
f 
�
�
� l     �8�7�6�8  �7  �6  
� 
�
�
� l     �5�4�3�5  �4  �3  
� 
�
�
� i  b e
�
�
� I     �2 �1
�2 .Mth:MaxNnull���     ****  o      �0�0 0 thelist theList�1  
� Q     � k    �  h    
�/�/ 0 
listobject 
listObject j     �.�. 
0 _list_   n    	
	 I    �-�,�- "0 aslistparameter asListParameter  o    
�+�+ 0 thelist theList �* m   
  �  �*  �,  
 o     �)�) 0 _support    Z   &�(�' =     n    1    �&
�& 
leng n    o    �%�% 
0 _list_   o    �$�$ 0 
listobject 
listObject m    �#�#   n   " I    "�"�!�" .0 throwinvalidparameter throwInvalidParameter  o    � �  0 thelist theList  !  m    "" �##  ! $%$ m    �
� 
list% &�& m    '' �(( ( L i s t   c a n  t   b e   e m p t y .�  �!   o    �� 0 _support  �(  �'   )*) r   ' *+,+ m   ' (�� , o      �� 0 i  * -.- Q   + �/01/ k   . e22 343 r   . 8565 c   . 6787 l  . 49��9 n   . 4:;: 4   1 4�<
� 
cobj< m   2 3�� ; n  . 1=>= o   / 1�� 
0 _list_  > o   . /�� 0 
listobject 
listObject�  �  8 m   4 5�
� 
nmbr6 o      �� 0 	theresult 	theResult4 ?�? Y   9 e@�AB�@ k   H `CC DED r   H RFGF c   H PHIH n  H NJKJ 4   K N�L
� 
cobjL o   L M�� 0 i  K n  H KMNM o   I K�� 
0 _list_  N o   H I�� 0 
listobject 
listObjectI m   N O�
� 
nmbrG o      �
�
 0 n  E O�	O Z  S `PQ��P ?   S VRSR o   S T�� 0 n  S o   T U�� 0 	theresult 	theResultQ r   Y \TUT o   Y Z�� 0 n  U o      �� 0 	theresult 	theResult�  �  �	  � 0 i  A m   < =�� B n  = CVWV 1   @ B�
� 
lengW n  = @XYX o   > @� �  
0 _list_  Y o   = >���� 0 
listobject 
listObject�  �  0 R      ��Z[
�� .ascrerr ****      � ****Z o      ���� 0 etext eText[ ��\��
�� 
errn\ d      ]] m      �������  1 n  m �^_^ I   r ���`���� .0 throwinvalidparameter throwInvalidParameter` aba N   r wcc n   r vded 4   s v��f
�� 
cobjf o   t u���� 0 i  e o   r s���� 0 thelist theListb ghg m   w xii �jj  h klk m   x y��
�� 
nmbrl m��m b   y |non m   y zpp �qq 2 L i s t   i t e m   i s   w r o n g   t y p e :  o o   z {���� 0 etext eText��  ��  _ o   m r���� 0 _support  . r��r L   � �ss o   � ����� 0 	theresult 	theResult��   R      ��tu
�� .ascrerr ****      � ****t o      ���� 0 etext eTextu ��vw
�� 
errnv o      ���� 0 enumber eNumberw ��xy
�� 
erobx o      ���� 0 efrom eFromy ��z��
�� 
errtz o      ���� 
0 eto eTo��   I   � ���{���� 
0 _error  { |}| m   � �~~ �  m a x} ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  
� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  f i��� I     ����
�� .Mth:RouNnull���     nmbr� o      ���� 0 num  � ����
�� 
Plac� |����������  ��  � o      ���� 0 decimalplaces decimalPlaces��  � l     ������ m      ����  ��  ��  � �����
�� 
Dire� |����������  ��  � o      ���� &0 roundingdirection roundingDirection��  � l     ������ m      ��
�� MRndRNhE��  ��  ��  � Q    ����� k   ��� ��� r    ��� n   ��� I    ������� "0 asrealparameter asRealParameter� ��� o    	���� 0 num  � ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 num  � ��� r    ��� n   ��� I    ������� (0 asintegerparameter asIntegerParameter� ��� o    ���� 0 decimalplaces decimalPlaces� ���� m    �� ���  t o   p l a c e s��  ��  � o    ���� 0 _support  � o      ���� 0 decimalplaces decimalPlaces� ��� Z    6������� >    "��� o     ���� 0 decimalplaces decimalPlaces� m     !����  � k   % 2�� ��� r   % *��� a   % (��� m   % &���� 
� o   & '���� 0 decimalplaces decimalPlaces� o      ���� 0 themultiplier theMultiplier� ���� l  + 2���� r   + 2��� ]   + 0��� ]   + .��� o   + ,���� 0 num  � m   , -���� d� o   . /���� 0 themultiplier theMultiplier� o      ���� 0 num  ��� multiplying and dividing by 100 before and after applying the multiplier helps avoid poor rounding results for some numbers due to inevitable loss of precision in floating-point math (e.g. `324.21 * 100 div 1 / 100` returns 324.2 but needs to be 324.21), though this hasn't been tested on all possible values for obvious reasons -- TO DO: shouldn't /10 be done after rounding is applied (in which case following calculations should use mod 10, etc)?   � ����   m u l t i p l y i n g   a n d   d i v i d i n g   b y   1 0 0   b e f o r e   a n d   a f t e r   a p p l y i n g   t h e   m u l t i p l i e r   h e l p s   a v o i d   p o o r   r o u n d i n g   r e s u l t s   f o r   s o m e   n u m b e r s   d u e   t o   i n e v i t a b l e   l o s s   o f   p r e c i s i o n   i n   f l o a t i n g - p o i n t   m a t h   ( e . g .   ` 3 2 4 . 2 1   *   1 0 0   d i v   1   /   1 0 0 `   r e t u r n s   3 2 4 . 2   b u t   n e e d s   t o   b e   3 2 4 . 2 1 ) ,   t h o u g h   t h i s   h a s n ' t   b e e n   t e s t e d   o n   a l l   p o s s i b l e   v a l u e s   f o r   o b v i o u s   r e a s o n s   - -   T O   D O :   s h o u l d n ' t   / 1 0   b e   d o n e   a f t e r   r o u n d i n g   i s   a p p l i e d   ( i n   w h i c h   c a s e   f o l l o w i n g   c a l c u l a t i o n s   s h o u l d   u s e   m o d   1 0 ,   e t c ) ?��  ��  ��  � ��� Z   7������ =  7 :��� o   7 8���� &0 roundingdirection roundingDirection� l  8 9������ m   8 9��
�� MRndRNhE��  ��  � Z   = k����� E  = I��� J   = A�� ��� m   = >������� ���� m   > ?���� ��  � J   A H�� ���� `   A F��� l  A D������ ^   A D��� o   A B���� 0 num  � m   B C���� ��  ��  � m   D E���� d��  � l  L Q���� r   L Q��� _   L O��� o   L M���� 0 num  � m   M N���� d� o      ���� 0 num  � T N if num ends in .5 and its div is even then round toward zero so it stays even   � ��� �   i f   n u m   e n d s   i n   . 5   a n d   i t s   d i v   i s   e v e n   t h e n   r o u n d   t o w a r d   z e r o   s o   i t   s t a y s   e v e n� ��� ?   T W��� o   T U���� 0 num  � m   U V����  � ���� l  Z a���� r   Z a��� _   Z _��� l  Z ]������ [   Z ]��� o   Z [���� 0 num  � m   [ \���� 2��  ��  � m   ] ^���� d� o      ���� 0 num  � H B else round to nearest whole digit (.5 will round up if positive�)   � ��� �   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t   ( . 5   w i l l   r o u n d   u p   i f   p o s i t i v e & )��  � l  d k   r   d k _   d i l  d g���� \   d g	 o   d e���� 0 num  	 m   e f���� 2��  ��   m   g h���� d o      ���� 0 num   4 . (�or down if negative to give an even result)    �

 \   ( & o r   d o w n   i f   n e g a t i v e   t o   g i v e   a n   e v e n   r e s u l t )�  =  n q o   n o���� &0 roundingdirection roundingDirection l  o p���� m   o p��
�� MRndRNhT��  ��    Z   t � E  t ~ J   t x  m   t u������ �� m   u v���� 2��   J   x } �� `   x { o   x y���� 0 num   m   y z���� d��   l  � � !"  r   � �#$# _   � �%&% o   � ����� 0 num  & m   � ����� d$ o      ���� 0 num  ! 0 * if num ends in .5 then round towards zero   " �'' T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o ()( ?   � �*+* o   � ����� 0 num  + m   � �����  ) ,�, l  � �-./- r   � �010 _   � �232 l  � �4�~�}4 [   � �565 o   � ��|�| 0 num  6 m   � ��{�{ 2�~  �}  3 m   � ��z�z d1 o      �y�y 0 num  . ( " else round to nearest whole digit   / �77 D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t�   r   � �898 _   � �:;: l  � �<�x�w< \   � �=>= o   � ��v�v 0 num  > m   � ��u�u 2�x  �w  ; m   � ��t�t d9 o      �s�s 0 num   ?@? =  � �ABA o   � ��r�r &0 roundingdirection roundingDirectionB l  � �C�q�pC m   � ��o
�o MRndRNhF�q  �p  @ DED Z   � �FGHIF E  � �JKJ J   � �LL MNM m   � ��n�n��N O�mO m   � ��l�l 2�m  K J   � �PP Q�kQ `   � �RSR o   � ��j�j 0 num  S m   � ��i�i d�k  G l  � �TUVT Z   � �WX�hYW ?   � �Z[Z o   � ��g�g 0 num  [ m   � ��f�f  X r   � �\]\ [   � �^_^ _   � �`a` o   � ��e�e 0 num  a m   � ��d�d d_ m   � ��c�c ] o      �b�b 0 num  �h  Y r   � �bcb \   � �ded _   � �fgf o   � ��a�a 0 num  g m   � ��`�` de m   � ��_�_ c o      �^�^ 0 num  U 0 * if num ends in .5 then round towards zero   V �hh T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r oH iji ?   � �klk o   � ��]�] 0 num  l m   � ��\�\  j m�[m l  � �nopn r   � �qrq _   � �sts l  � �u�Z�Yu [   � �vwv o   � ��X�X 0 num  w m   � ��W�W 2�Z  �Y  t m   � ��V�V dr o      �U�U 0 num  o ( " else round to nearest whole digit   p �xx D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t�[  I r   � �yzy _   � �{|{ l  � �}�T�S} \   � �~~ o   � ��R�R 0 num   m   � ��Q�Q 2�T  �S  | m   � ��P�P dz o      �O�O 0 num  E ��� =  � ���� o   � ��N�N &0 roundingdirection roundingDirection� l  � ���M�L� m   � ��K
�K MRndRN_T�M  �L  � ��� r   � ���� _   � ���� o   � ��J�J 0 num  � m   � ��I�I d� o      �H�H 0 num  � ��� =  � ���� o   � ��G�G &0 roundingdirection roundingDirection� l  � ���F�E� m   � ��D
�D MRndRN_F�F  �E  � ��� Z   �%����� =   ���� `   ���� o   � ��C�C 0 num  � m   � �B�B d� m  �A�A  � r  ��� _  	��� o  �@�@ 0 num  � m  �?�? d� o      �>�> 0 num  � ��� ?  ��� o  �=�= 0 num  � m  �<�<  � ��;� r  ��� [  ��� _  ��� o  �:�: 0 num  � m  �9�9 d� m  �8�8 � o      �7�7 0 num  �;  � r  %��� \  #��� _  !��� o  �6�6 0 num  � m   �5�5 d� m  !"�4�4 � o      �3�3 0 num  � ��� = (+��� o  ()�2�2 &0 roundingdirection roundingDirection� l )*��1�0� m  )*�/
�/ MRndRN_U�1  �0  � ��� l .O���� Z  .O���.�� G  .=��� A  .1��� o  ./�-�- 0 num  � m  /0�,�,  � =  49��� `  47��� o  45�+�+ 0 num  � m  56�*�* d� m  78�)�)  � r  @E��� _  @C��� o  @A�(�( 0 num  � m  AB�'�' d� o      �&�& 0 num  �.  � r  HO��� [  HM��� _  HK��� o  HI�%�% 0 num  � m  IJ�$�$ d� m  KL�#�# � o      �"�" 0 num  �   ceil()   � ���    c e i l ( )� ��� = RW��� o  RS�!�! &0 roundingdirection roundingDirection� l SV�� �� m  SV�
� MRndRN_D�   �  � ��� l Z{���� Z  Z{����� G  Zi��� ?  Z]��� o  Z[�� 0 num  � m  [\��  � =  `e��� `  `c��� o  `a�� 0 num  � m  ab�� d� m  cd��  � r  lq��� _  lo��� o  lm�� 0 num  � m  mn�� d� o      �� 0 num  �  � r  t{��� \  ty��� _  tw��� o  tu�� 0 num  � m  uv�� d� m  wx�� � o      �� 0 num  �   floor()   � ���    f l o o r ( )�  � n ~���� I  ������ >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  ���� &0 roundingdirection roundingDirection� ��� m  ���� ���  b y�  �  � o  ~��� 0 _support  � ��
� Z  ������� =  ����� o  ���	�	 0 decimalplaces decimalPlaces� m  ����  � L  ���� _  ����� o  ���� 0 num  � m  ���� �    A  �� o  ���� 0 decimalplaces decimalPlaces m  ����   � L  �� _  �� o  ���� 0 num   o  ���� 0 themultiplier theMultiplier�  � L  �� ^  ��	
	 o  ��� �  0 num  
 o  ������ 0 themultiplier theMultiplier�
  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I  �������� 
0 _error    m  �� �  r o u n d   n u m b e r  o  ������ 0 etext eText  o  ������ 0 enumber eNumber  o  ������ 0 efrom eFrom �� o  ������ 
0 eto eTo��  ��  �  l     ��������  ��  ��    !  l     ��������  ��  ��  ! "#" l     ��$%��  $ J D--------------------------------------------------------------------   % �&& � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -# '(' l     ��)*��  )   Trigonometry   * �++    T r i g o n o m e t r y( ,-, l     ��������  ��  ��  - ./. i  j m010 I      ��2���� 0 _sin  2 3��3 o      ���� 0 x  ��  ��  1 k     �44 565 l    	7897 r     	:;: ]     <=< l    >����> `     ?@? o     ���� 0 x  @ m    ����h��  ��  = l   A����A ^    BCB 1    ��
�� 
pi  C m    ���� ���  ��  ; o      ���� 0 x  8 &   convert from degrees to radians   9 �DD @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s6 EFE r   
 GHG A   
 IJI o   
 ���� 0 x  J m    ����  H o      ���� 0 isneg isNegF KLK Z   MN����M o    ���� 0 isneg isNegN r    OPO d    QQ o    ���� 0 x  P o      ���� 0 x  ��  ��  L RSR r    &TUT _    $VWV l   "X����X ]    "YZY o    ���� 0 x  Z l   ![����[ ^    !\]\ m    ���� ] 1     ��
�� 
pi  ��  ��  ��  ��  W m   " #���� U o      ���� 0 y  S ^_^ r   ' 2`a` \   ' 0bcb o   ' (���� 0 y  c ]   ( /ded l  ( -f����f _   ( -ghg ]   ( +iji o   ( )���� 0 y  j m   ) *kk ?�      h m   + ,���� ��  ��  e m   - .���� a o      ���� 0 z  _ lml Z   3 Jno����n =  3 8pqp `   3 6rsr o   3 4���� 0 z  s m   4 5���� q m   6 7���� o k   ; Ftt uvu r   ; @wxw [   ; >yzy o   ; <���� 0 z  z m   < =���� x o      ���� 0 z  v {��{ r   A F|}| [   A D~~ o   A B���� 0 y   m   B C���� } o      ���� 0 y  ��  ��  ��  m ��� r   K P��� `   K N��� o   K L���� 0 z  � m   L M���� � o      ���� 0 z  � ��� Z   Q e������� ?   Q T��� o   Q R���� 0 z  � m   R S���� � k   W a�� ��� r   W [��� H   W Y�� o   W X���� 0 isneg isNeg� o      ���� 0 isneg isNeg� ���� r   \ a��� \   \ _��� o   \ ]���� 0 z  � m   ] ^���� � o      ���� 0 z  ��  ��  ��  � ��� r   f u��� \   f s��� l  f o������ \   f o��� l  f k������ \   f k��� o   f g���� 0 x  � ]   g j��� o   g h���� 0 y  � m   h i�� ?�!�?��v��  ��  � ]   k n��� o   k l���� 0 y  � m   l m�� >dD,���J��  ��  � ]   o r��� o   o p���� 0 y  � m   p q�� <�F���P�� o      ���� 0 z2  � ��� r   v {��� ]   v y��� o   v w���� 0 z2  � o   w x���� 0 z2  � o      ���� 0 zz  � ��� Z   | ������� G   | ���� =  | ��� o   | }���� 0 z  � m   } ~���� � =  � ���� o   � ����� 0 z  � m   � ����� � r   � ���� [   � ���� \   � ���� m   � ��� ?�      � ^   � ���� o   � ����� 0 zz  � m   � ����� � ]   � ���� ]   � ���� o   � ����� 0 zz  � o   � ����� 0 zz  � l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ���I���� o   � ����� 0 zz  � m   � ��� >!�{N>���  ��  � o   � ����� 0 zz  � m   � ��� >�~O~�K���  ��  � o   � ����� 0 zz  � m   � ��� >���D���  ��  � o   � ����� 0 zz  � m   � ��� ?V�l�=���  ��  � o   � ����� 0 zz  � m   � ��� ?�UUUV���  ��  � o      ���� 0 y  ��  � r   � ���� [   � ���� o   � ����� 0 z2  � ]   � ���� ]   � ���� o   � ��� 0 z2  � o   � ��~�~ 0 zz  � l  � ���}�|� \   � ���� ]   � ���� l  � ���{�z� [   � ���� ]   � ���� l  � ���y�x� \   � ���� ]   � ���� l  � � �w�v  [   � � ]   � � l  � ��u�t \   � � ]   � �	 m   � �

 =���ќ�	 o   � ��s�s 0 zz   m   � � >Z��)[�u  �t   o   � ��r�r 0 zz   m   � � >��V}H��w  �v  � o   � ��q�q 0 zz  � m   � � ?*�����y  �x  � o   � ��p�p 0 zz  � m   � � ?�"w�{  �z  � o   � ��o�o 0 zz  � m   � � ?�UUUU�?�}  �|  � o      �n�n 0 y  �  Z  � ��m�l o   � ��k�k 0 isneg isNeg r   � � d   � � o   � ��j�j 0 y   o      �i�i 0 y  �m  �l   �h L   � � o   � ��g�g 0 y  �h  /  l     �f�e�d�f  �e  �d    l     �c�b�a�c  �b  �a    l     �`�_�^�`  �_  �^     i  n q!"! I     �]#�\
�] .Mth:Sin_null���     doub# o      �[�[ 0 x  �\  " Q     $%&$ L    '' I    �Z(�Y�Z 0 _sin  ( )�X) c    *+* o    �W�W 0 x  + m    �V
�V 
nmbr�X  �Y  % R      �U,-
�U .ascrerr ****      � ****, o      �T�T 0 etext eText- �S./
�S 
errn. o      �R�R 0 enumber eNumber/ �Q01
�Q 
erob0 o      �P�P 0 efrom eFrom1 �O2�N
�O 
errt2 o      �M�M 
0 eto eTo�N  & I    �L3�K�L 
0 _error  3 454 m    66 �77  s i n5 898 o    �J�J 0 etext eText9 :;: o    �I�I 0 enumber eNumber; <=< o    �H�H 0 efrom eFrom= >�G> o    �F�F 
0 eto eTo�G  �K    ?@? l     �E�D�C�E  �D  �C  @ ABA l     �B�A�@�B  �A  �@  B CDC i  r uEFE I     �?G�>
�? .Mth:Cos_null���     doubG o      �=�= 0 x  �>  F Q      HIJH L    KK I    �<L�;�< 0 _sin  L M�:M [    	NON l   P�9�8P c    QRQ o    �7�7 0 x  R m    �6
�6 
nmbr�9  �8  O m    �5�5 Z�:  �;  I R      �4ST
�4 .ascrerr ****      � ****S o      �3�3 0 etext eTextT �2UV
�2 
errnU o      �1�1 0 enumber eNumberV �0WX
�0 
erobW o      �/�/ 0 efrom eFromX �.Y�-
�. 
errtY o      �,�, 
0 eto eTo�-  J I     �+Z�*�+ 
0 _error  Z [\[ m    ]] �^^  c o s\ _`_ o    �)�) 0 etext eText` aba o    �(�( 0 enumber eNumberb cdc o    �'�' 0 efrom eFromd e�&e o    �%�% 
0 eto eTo�&  �*  D fgf l     �$�#�"�$  �#  �"  g hih l     �!� ��!  �   �  i jkj i  v ylml I     �n�
� .Mth:Tan_null���     doubn o      �� 0 x  �  m k    oo pqp l     �rs�  r a [ note: this starts to lose accuracy between 89.9999999 and 90�, but should be 'good enough'   s �tt �   n o t e :   t h i s   s t a r t s   t o   l o s e   a c c u r a c y   b e t w e e n   8 9 . 9 9 9 9 9 9 9   a n d   9 0 � ,   b u t   s h o u l d   b e   ' g o o d   e n o u g h 'q u�u Q    vwxv k    �yy z{z r    |}| c    ~~ o    �� 0 x   m    �
� 
nmbr} o      �� 0 x  { ��� l  	 #���� Z  	 #����� G   	 ��� =  	 ��� o   	 
�� 0 x  � m   
 �� Z� =   ��� o    �� 0 x  � m    ��� R    ���
� .ascrerr ****      � ****� m    �� ��� F I n v a l i d   n u m b e r   ( r e s u l t   w o u l d   b e  " ) .� ���
� 
errn� m    ���s� ���
� 
erob� o    �� 0 x  �  �  �  � 4 . -2701 normally indicates divide-by-zero error   � ��� \   - 2 7 0 1   n o r m a l l y   i n d i c a t e s   d i v i d e - b y - z e r o   e r r o r� ��� l  $ -���� r   $ -��� ]   $ +��� l  $ '��
�	� `   $ '��� o   $ %�� 0 x  � m   % &��h�
  �	  � l  ' *���� ^   ' *��� 1   ' (�
� 
pi  � m   ( )�� ��  �  � o      �� 0 x  � &   convert from degrees to radians   � ��� @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s� ��� r   . 3��� A   . 1��� o   . /�� 0 x  � m   / 0� �   � o      ���� 0 isneg isNeg� ��� Z  4 @������� o   4 5���� 0 isneg isNeg� r   8 <��� d   8 :�� o   8 9���� 0 x  � o      ���� 0 x  ��  ��  � ��� r   A J��� _   A H��� l  A F������ ^   A F��� o   A B���� 0 x  � l  B E������ ^   B E��� 1   B C��
�� 
pi  � m   C D���� ��  ��  ��  ��  � m   F G���� � o      ���� 0 y  � ��� r   K V��� \   K T��� o   K L���� 0 y  � ]   L S��� l  L Q������ _   L Q��� ]   L O��� o   L M���� 0 y  � m   M N�� ?�      � m   O P���� ��  ��  � m   Q R���� � o      ���� 0 z  � ��� Z   W n������� =  W \��� `   W Z��� o   W X���� 0 z  � m   X Y���� � m   Z [���� � k   _ j�� ��� r   _ d��� [   _ b��� o   _ `���� 0 z  � m   ` a���� � o      ���� 0 z  � ���� r   e j��� [   e h��� o   e f���� 0 y  � m   f g���� � o      ���� 0 y  ��  ��  ��  � ��� r   o ���� \   o ~��� l  o x������ \   o x��� l  o t������ \   o t��� o   o p���� 0 x  � ]   p s��� o   p q���� 0 y  � m   q r�� ?�!�P M��  ��  � ]   t w��� o   t u���� 0 y  � m   u v�� >A�`  ��  ��  � ]   x }��� o   x y���� 0 y  � m   y |�� <��&3\� o      ���� 0 z2  � ��� r   � ���� ]   � ���� o   � ����� 0 z2  � o   � ����� 0 z2  � o      ���� 0 zz  � ��� Z   � ������� ?   � �   o   � ����� 0 zz   m   � � =����+�� r   � � [   � � o   � ����� 0 z2   ^   � � ]   � �	
	 ]   � � o   � ����� 0 z2   o   � ����� 0 zz  
 l  � ����� \   � � ]   � � l  � ����� [   � � ]   � � m   � � �ɒ��O?D o   � ����� 0 zz   m   � � A1�������  ��   o   � ����� 0 zz   m   � � Aq��)�y��  ��   l  � ����� \   � � ]   � � l  � ����� [   � � !  ]   � �"#" l  � �$����$ \   � �%&% ]   � �'(' l  � �)����) [   � �*+* o   � ����� 0 zz  + m   � �,, @ʸ��et��  ��  ( o   � ����� 0 zz  & m   � �-- A4'�X*����  ��  # o   � ����� 0 zz  ! m   � �.. Awُ������  ��   o   � ����� 0 zz   m   � �// A���<�Z6��  ��   o      ���� 0 y  ��  � r   � �010 o   � ����� 0 z2  1 o      ���� 0 y  � 232 Z  � �45����4 G   � �676 =  � �898 o   � ����� 0 z  9 m   � ����� 7 =  � �:;: o   � ����� 0 z  ; m   � ����� 5 r   � �<=< ^   � �>?> m   � �������? o   � ����� 0 y  = o      ���� 0 y  ��  ��  3 @A@ Z  � �BC����B o   � ����� 0 isneg isNegC r   � �DED d   � �FF o   � ����� 0 y  E o      ���� 0 y  ��  ��  A G��G L   � �HH o   � ����� 0 y  ��  w R      ��IJ
�� .ascrerr ****      � ****I o      ���� 0 etext eTextJ ��KL
�� 
errnK o      ���� 0 enumber eNumberL ��MN
�� 
erobM o      ���� 0 efrom eFromN ��O��
�� 
errtO o      ���� 
0 eto eTo��  x I   ���P���� 
0 _error  P QRQ m   � �SS �TT  t a nR UVU o   � ����� 0 etext eTextV WXW o   � ����� 0 enumber eNumberX YZY o   � ����� 0 efrom eFromZ [��[ o   � ����� 
0 eto eTo��  ��  �  k \]\ l     ��������  ��  ��  ] ^_^ l     ��������  ��  ��  _ `a` l     ��bc��  b  -----   c �dd 
 - - - - -a efe l     ��gh��  g   inverse   h �ii    i n v e r s ef jkj l     ��������  ��  ��  k lml i  z }non I      ��p���� 	0 _asin  p q��q o      ���� 0 x  ��  ��  o k     �rr sts r     uvu A     wxw o     ���� 0 x  x m    ����  v o      ���� 0 isneg isNegt yzy Z   {|����{ o    ���� 0 isneg isNeg| r   
 }~} d   
  o   
 ���� 0 x  ~ o      ���� 0 x  ��  ��  z ��� Z   %������ ?    ��� o    �~�~ 0 x  � m    �}�} � R    !�|��
�| .ascrerr ****      � ****� m     �� ��� T I n v a l i d   n u m b e r   ( n o t   b e t w e e n   - 1 . 0   a n d   1 . 0 ) .� �{��
�{ 
errn� m    �z�z�Y� �y��x
�y 
erob� o    �w�w 0 x  �x  ��  �  � ��� Z   & ������ ?   & )��� o   & '�v�v 0 x  � m   ' (�� ?�      � k   , �� ��� r   , 1��� \   , /��� m   , -�u�u � o   - .�t�t 0 x  � o      �s�s 0 zz  � ��� r   2 W��� ^   2 U��� ]   2 E��� o   2 3�r�r 0 zz  � l  3 D��q�p� [   3 D��� ]   3 B��� l  3 @��o�n� \   3 @��� ]   3 >��� l  3 <��m�l� [   3 <��� ]   3 :��� l  3 8��k�j� \   3 8��� ]   3 6��� m   3 4�� ?hOØ��� o   4 5�i�i 0 zz  � m   6 7�� ?��Y�,��k  �j  � o   8 9�h�h 0 zz  � m   : ;�� @����?��m  �l  � o   < =�g�g 0 zz  � m   > ?�� @9����"�o  �n  � o   @ A�f�f 0 zz  � m   B C�� @<�b@���q  �p  � l  E T��e�d� [   E T��� ]   E R��� l  E P��c�b� \   E P��� ]   E N��� l  E L��a�`� [   E L��� ]   E J��� l  E H��_�^� \   E H��� o   E F�]�] 0 zz  � m   F G�� @5򢶿]R�_  �^  � o   H I�\�\ 0 zz  � m   J K�� @bb�j1�a  �`  � o   L M�[�[ 0 zz  � m   N O�� @w���c��c  �b  � o   P Q�Z�Z 0 zz  � m   R S�� @ug	��D��e  �d  � o      �Y�Y 0 p  � ��� r   X _��� a   X ]��� l  X [��X�W� [   X [��� o   X Y�V�V 0 zz  � o   Y Z�U�U 0 zz  �X  �W  � m   [ \�� ?�      � o      �T�T 0 zz  � ��� r   ` i��� \   ` g��� l  ` e��S�R� ^   ` e��� 1   ` c�Q
�Q 
pi  � m   c d�P�P �S  �R  � o   e f�O�O 0 zz  � o      �N�N 0 z  � ��� r   j s��� \   j q��� ]   j m��� o   j k�M�M 0 zz  � o   k l�L�L 0 p  � m   m p�� <��&3\
� o      �K�K 0 zz  � ��J� r   t ��� [   t }��� \   t w��� o   t u�I�I 0 z  � o   u v�H�H 0 zz  � l  w |��G�F� ^   w |��� 1   w z�E
�E 
pi  � m   z {�D�D �G  �F  � o      �C�C 0 z  �J  � ��� A   � ���� o   � ��B�B 0 x  � m   � ��� >Ey��0�:� ��A� r   � �   o   � ��@�@ 0 x   o      �?�? 0 z  �A  � k   � �  r   � � ]   � � o   � ��>�> 0 x   o   � ��=�= 0 x   o      �<�< 0 zz   	�;	 r   � �

 [   � � ]   � � ^   � � ]   � � o   � ��:�: 0 zz   l  � ��9�8 \   � � ]   � � l  � ��7�6 [   � � ]   � � l  � ��5�4 \   � �  ]   � �!"! l  � �#�3�2# [   � �$%$ ]   � �&'& l  � �(�1�0( \   � �)*) ]   � �+,+ m   � �-- ?qk��v�, o   � ��/�/ 0 zz  * m   � �.. ?�CA3>M��1  �0  ' o   � ��.�. 0 zz  % m   � �// @�K�/�3  �2  " o   � ��-�- 0 zz    m   � �00 @0C1�'���5  �4   o   � ��,�, 0 zz   m   � �11 @3��w���7  �6   o   � ��+�+ 0 zz   m   � �22 @ elΰ8�9  �8   l  � �3�*�)3 \   � �454 ]   � �676 l  � �8�(�'8 [   � �9:9 ]   � �;<; l  � �=�&�%= \   � �>?> ]   � �@A@ l  � �B�$�#B [   � �CDC ]   � �EFE l  � �G�"�!G \   � �HIH o   � �� �  0 zz  I m   � �JJ @-{Y^��"  �!  F o   � ��� 0 zz  D m   � �KK @Q��%��6�$  �#  A o   � ��� 0 zz  ? m   � �LL @be�m5v��&  �%  < o   � ��� 0 zz  : m   � �MM @apV�����(  �'  7 o   � ��� 0 zz  5 m   � �NN @H�"
6��*  �)   o   � ��� 0 x   o   � ��� 0 x   o      �� 0 z  �;  � OPO Z  � �QR��Q o   � ��� 0 isneg isNegR r   � �STS d   � �UU o   � ��� 0 z  T o      �� 0 z  �  �  P V�V L   � �WW ^   � �XYX o   � ��� 0 z  Y l  � �Z��Z ^   � �[\[ 1   � ��
� 
pi  \ m   � ��� ��  �  �  m ]^] l     ����  �  �  ^ _`_ l     �
�	��
  �	  �  ` aba l     ����  �  �  b cdc i  ~ �efe I     �g�
� .Mth:Sinanull���     doubg o      �� 0 x  �  f Q     hijh L    kk I    �l� � 	0 _asin  l m��m c    non o    ���� 0 x  o m    ��
�� 
nmbr��  �   i R      ��pq
�� .ascrerr ****      � ****p o      ���� 0 etext eTextq ��rs
�� 
errnr o      ���� 0 enumber eNumbers ��tu
�� 
erobt o      ���� 0 efrom eFromu ��v��
�� 
errtv o      ���� 
0 eto eTo��  j I    ��w���� 
0 _error  w xyx m    zz �{{  a s i ny |}| o    ���� 0 etext eText} ~~ o    ���� 0 enumber eNumber ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  d ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Cosanull���     doub� o      ���� 0 x  ��  � Q      ���� L    �� \    ��� m    ���� Z� l   ������ I    ������� 	0 _asin  � ���� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I     ������� 
0 _error  � ��� m    �� ���  a c o s� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Tananull���     doub� o      ���� 0 x  ��  � Q     *���� k    �� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 �� I   	 ������� 	0 _asin  � ���� ^   
 ��� o   
 ���� 0 x  � l   ������ a    ��� l   ������ [    ��� ]    ��� o    ���� 0 x  � o    ���� 0 x  � m    ���� ��  ��  � m    �� ?�      ��  ��  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I     *������� 
0 _error  � ��� m   ! "�� ���  a t a n� ��� o   " #���� 0 etext eText� ��� o   # $���� 0 enumber eNumber� ��� o   $ %���� 0 efrom eFrom� ���� o   % &���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  �   hyperbolic   � ���    h y p e r b o l i c� ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Sinhnull���     doub� o      ���� 0 x  ��  � Q     .���� k    �� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 �� ]   	    m   	 
 ?�       l  
 ���� \   
  a   
  o   
 ���� 	0 __e__   o    ���� 0 x   a    	 o    ���� 	0 __e__  	 d    

 o    ���� 0 x  ��  ��  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   $ .������ 
0 _error    m   % & � 
 a s i n h  o   & '���� 0 etext eText  o   ' (�� 0 enumber eNumber  o   ( )�~�~ 0 efrom eFrom �} o   ) *�|�| 
0 eto eTo�}  ��  �  l     �{�z�y�{  �z  �y    !  l     �x�w�v�x  �w  �v  ! "#" i  � �$%$ I     �u&�t
�u .Mth:Coshnull���     doub& o      �s�s 0 x  �t  % Q     .'()' k    ** +,+ r    -.- c    /0/ o    �r�r 0 x  0 m    �q
�q 
nmbr. o      �p�p 0 x  , 1�o1 L   	 22 ]   	 343 m   	 
55 ?�      4 l  
 6�n�m6 [   
 787 a   
 9:9 o   
 �l�l 	0 __e__  : o    �k�k 0 x  8 a    ;<; o    �j�j 	0 __e__  < d    == o    �i�i 0 x  �n  �m  �o  ( R      �h>?
�h .ascrerr ****      � ****> o      �g�g 0 etext eText? �f@A
�f 
errn@ o      �e�e 0 enumber eNumberA �dBC
�d 
erobB o      �c�c 0 efrom eFromC �bD�a
�b 
errtD o      �`�` 
0 eto eTo�a  ) I   $ .�_E�^�_ 
0 _error  E FGF m   % &HH �II 
 a c o s hG JKJ o   & '�]�] 0 etext eTextK LML o   ' (�\�\ 0 enumber eNumberM NON o   ( )�[�[ 0 efrom eFromO P�ZP o   ) *�Y�Y 
0 eto eTo�Z  �^  # QRQ l     �X�W�V�X  �W  �V  R STS l     �U�T�S�U  �T  �S  T UVU i  � �WXW I     �RY�Q
�R .Mth:Tanhnull���     doubY o      �P�P 0 x  �Q  X Q     =Z[\Z k    +]] ^_^ r    `a` c    bcb o    �O�O 0 x  c m    �N
�N 
nmbra o      �M�M 0 x  _ d�Ld L   	 +ee ^   	 *fgf l  	 h�K�Jh \   	 iji a   	 klk o   	 �I�I 	0 __e__  l o    �H�H 0 x  j a    mnm o    �G�G 	0 __e__  n d    oo o    �F�F 0 x  �K  �J  g l   )p�E�Dp [    )qrq a     sts o    �C�C 	0 __e__  t o    �B�B 0 x  r a     (uvu o     %�A�A 	0 __e__  v d   % 'ww o   % &�@�@ 0 x  �E  �D  �L  [ R      �?xy
�? .ascrerr ****      � ****x o      �>�> 0 etext eTexty �=z{
�= 
errnz o      �<�< 0 enumber eNumber{ �;|}
�; 
erob| o      �:�: 0 efrom eFrom} �9~�8
�9 
errt~ o      �7�7 
0 eto eTo�8  \ I   3 =�6�5�6 
0 _error   ��� m   4 5�� ��� 
 a t a n h� ��� o   5 6�4�4 0 etext eText� ��� o   6 7�3�3 0 enumber eNumber� ��� o   7 8�2�2 0 efrom eFrom� ��1� o   8 9�0�0 
0 eto eTo�1  �5  V ��� l     �/�.�-�/  �.  �-  � ��� l     �,�+�*�,  �+  �*  � ��� l     �)���)  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �(���(  �   Logarithms   � ���    L o g a r i t h m s� ��� l     �'�&�%�'  �&  �%  � ��� i  � ���� I      �$��#�$ 
0 _frexp  � ��"� o      �!�! 0 m  �"  �#  � k     n�� ��� Z    ��� �� =    ��� o     �� 0 m  � m    ��  � L    �� J    
�� ��� m    ��         � ��� m    ��  �  �   �  � ��� r    ��� A    ��� o    �� 0 m  � m    ��  � o      �� 0 isneg isNeg� ��� Z   "����� o    �� 0 isneg isNeg� r    ��� d    �� o    �� 0 m  � o      �� 0 m  �  �  � ��� r   # &��� m   # $��  � o      �� 0 e  � ��� W   ' [��� Z   7 V����� @   7 :��� o   7 8�� 0 m  � m   8 9�� � k   = H�� ��� r   = B��� ^   = @��� o   = >�� 0 m  � m   > ?�� � o      �� 0 m  � ��
� r   C H��� [   C F��� o   C D�	�	 0 e  � m   D E�� � o      �� 0 e  �
  �  � k   K V�� ��� r   K P��� ]   K N��� o   K L�� 0 m  � m   L M�� � o      �� 0 m  � ��� r   Q V��� \   Q T��� o   Q R�� 0 e  � m   R S�� � o      � �  0 e  �  � F   + 6��� @   + .��� o   + ,���� 0 m  � m   , -�� ?�      � A   1 4��� o   1 2���� 0 m  � m   2 3���� � ��� Z  \ h������� o   \ ]���� 0 isneg isNeg� r   ` d��� d   ` b�� o   ` a���� 0 m  � o      ���� 0 m  ��  ��  � ���� L   i n�� J   i m�� ��� o   i j���� 0 m  � ���� o   j k���� 0 e  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� 	0 _logn  � ���� o      ���� 0 x  ��  ��  � k    ;�� � � Z    ���� B      o     ���� 0 x   m    ����   R    ��
�� .ascrerr ****      � **** m   
  � 8 I n v a l i d   n u m b e r   ( m u s t   b e   > 0 ) . ��	��
�� 
errn	 m    	�����Y��  ��  ��    

 r    & I      ������ 
0 _frexp   �� o    ���� 0 x  ��  ��   J        o      ���� 0 x   �� o      ���� 0 e  ��    Z   '8�� G   ' 2 A   ' * o   ' (���� 0 e   m   ( )������ ?   - 0 o   - .���� 0 e   m   . /����  k   5 �  !  Z   5 ^"#��$" A   5 8%&% o   5 6���� 0 x  & m   6 7'' ?栞fK�# l  ; N()*( k   ; N++ ,-, r   ; @./. \   ; >010 o   ; <���� 0 e  1 m   < =���� / o      ���� 0 e  - 232 r   A F454 \   A D676 o   A B���� 0 x  7 m   B C88 ?�      5 o      ���� 0 z  3 9��9 r   G N:;: [   G L<=< ]   G J>?> m   G H@@ ?�      ? o   H I���� 0 z  = m   J KAA ?�      ; o      ���� 0 y  ��  )   (2 ^ 0.5) / 2   * �BB    ( 2   ^   0 . 5 )   /   2��  $ k   Q ^CC DED r   Q VFGF \   Q THIH o   Q R���� 0 x  I m   R S���� G o      ���� 0 z  E J��J r   W ^KLK [   W \MNM ]   W ZOPO m   W XQQ ?�      P o   X Y���� 0 x  N m   Z [RR ?�      L o      ���� 0 y  ��  ! STS r   _ dUVU ^   _ bWXW o   _ `���� 0 z  X o   ` a���� 0 y  V o      ���� 0 x  T YZY r   e j[\[ ]   e h]^] o   e f���� 0 x  ^ o   f g���� 0 x  \ o      ���� 0 z  Z _`_ r   k �aba ^   k �cdc ]   k xefe ]   k nghg o   k l���� 0 x  h o   l m���� 0 z  f l  n wi����i \   n wjkj ]   n ulml l  n sn����n [   n sopo ]   n qqrq m   n oss ��D=�l�r o   o p���� 0 z  p m   q rtt @0b�s{���  ��  m o   s t���� 0 z  k m   u vuu @P	"*?��  ��  d l  x �v����v \   x �wxw ]   x �yzy l  x {����{ [   x |}| ]   x }~~ l  x {������ \   x {��� o   x y���� 0 z  � m   y z�� @A�C�l���  ��   o   { |���� 0 z  } m   } ~�� @s��*�
��  ��  z o    ����� 0 z  x m   � ��� @���?;��  ��  b o      ���� 0 z  ` ��� r   � ���� o   � ����� 0 e  � o      ���� 0 y  � ���� r   � ���� [   � ���� [   � ���� \   � ���� o   � ����� 0 z  � ]   � ���� o   � ����� 0 y  � m   � ��� ?+�\a�� o   � ����� 0 x  � ]   � ���� o   � ����� 0 e  � m   � ��� ?�0     � o      ���� 0 z  ��  ��   k   �8�� ��� Z   � ������� A   � ���� o   � ����� 0 x  � m   � ��� ?栞fK�� l  � ����� k   � ��� ��� r   � ���� \   � ���� o   � ����� 0 e  � m   � ����� � o      ���� 0 e  � ���� r   � ���� \   � ���� ]   � ���� m   � ����� � o   � ����� 0 x  � m   � ����� � o      ���� 0 x  ��  �   (2 ^ 0.5) / 2   � ���    ( 2   ^   0 . 5 )   /   2��  � r   � ���� \   � ���� o   � ����� 0 x  � m   � ����� � o      ���� 0 x  � ��� r   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 z  � ��� r   ���� ^   ���� ]   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 z  � l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� m   � ��� ?���� o   � ��� 0 x  � m   � ��� ?���?Vd��  �  � o   � ��� 0 x  � m   � ��� @Һ�i��  �  � o   � ��� 0 x  � m   � ��� @,�r�>���  �  � o   � ��� 0 x  � m   � ��� @1�֒K�R��  ��  � o   � ��� 0 x  � m   � ��� @�c}~ݝ��  ��  � l  ����� [   ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ���~�}� [   � ���� ]   � ���� l  � ���|�{� [   � ���� o   � ��z�z 0 x  � m   � ��� @&� ����|  �{  � o   � ��y�y 0 x  � m   � ��� @F�,N��~  �}  � o   � ��x�x 0 x  � m   � �   @T�3�&���  �  � o   � ��w�w 0 x  � m   � � @Q���^��  �  � o   � ��v�v 0 x  � m   �  @7 
�&5�  �  � o      �u�u 0 y  �  Z  �t�s >   o  �r�r 0 e   m  �q�q   r  	
	 \   o  �p�p 0 y   ]   o  �o�o 0 e   m   ?+�\a�
 o      �n�n 0 y  �t  �s    r   \   o  �m�m 0 y   l �l�k ^   o  �j�j 0 z   m  �i�i �l  �k   o      �h�h 0 y    r  $ [  " o   �g�g 0 x   o   !�f�f 0 y   o      �e�e 0 z   �d Z %8 !�c�b  >  %("#" o  %&�a�a 0 e  # m  &'�`�`  ! r  +4$%$ [  +2&'& o  +,�_�_ 0 z  ' ]  ,1()( o  ,-�^�^ 0 e  ) m  -0** ?�0     % o      �]�] 0 z  �c  �b  �d   +�\+ L  9;,, o  9:�[�[ 0 z  �\  � -.- l     �Z�Y�X�Z  �Y  �X  . /0/ l     �W�V�U�W  �V  �U  0 121 l     �T�S�R�T  �S  �R  2 343 i  � �565 I     �Q7�P
�Q .Mth:Lognnull���     doub7 o      �O�O 0 x  �P  6 Q     89:8 L    ;; I    �N<�M�N 	0 _logn  < =�L= c    >?> o    �K�K 0 x  ? m    �J
�J 
nmbr�L  �M  9 R      �I@A
�I .ascrerr ****      � ****@ o      �H�H 0 etext eTextA �GBC
�G 
errnB o      �F�F 0 enumber eNumberC �EDE
�E 
erobD o      �D�D 0 efrom eFromE �CF�B
�C 
errtF o      �A�A 
0 eto eTo�B  : I    �@G�?�@ 
0 _error  G HIH m    JJ �KK  l o g nI LML o    �>�> 0 etext eTextM NON o    �=�= 0 enumber eNumberO PQP o    �<�< 0 efrom eFromQ R�;R o    �:�: 
0 eto eTo�;  �?  4 STS l     �9�8�7�9  �8  �7  T UVU l     �6�5�4�6  �5  �4  V WXW i  � �YZY I     �3[�2
�3 .Mth:Lo10null���     doub[ o      �1�1 0 x  �2  Z Q     $\]^\ l   _`a_ L    bb ^    cdc ]    efe l   g�0�/g ^    hih I    �.j�-�. 	0 _logn  j k�,k c    lml o    �+�+ 0 x  m m    �*
�* 
nmbr�,  �-  i m    nn @k���T��0  �/  f m    oo @r�     d m    pp @r�    j`   correct for minor drift   a �qq 0   c o r r e c t   f o r   m i n o r   d r i f t] R      �)rs
�) .ascrerr ****      � ****r o      �(�( 0 etext eTexts �'tu
�' 
errnt o      �&�& 0 enumber eNumberu �%vw
�% 
erobv o      �$�$ 0 efrom eFromw �#x�"
�# 
errtx o      �!�! 
0 eto eTo�"  ^ I    $� y��  
0 _error  y z{z m    || �}} 
 l o g 1 0{ ~~ o    �� 0 etext eText ��� o    �� 0 enumber eNumber� ��� o    �� 0 efrom eFrom� ��� o     �� 
0 eto eTo�  �  X ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Mth:Logbnull���     doub� o      �� 0 x  � ���
� 
Base� o      �� 0 b  �  � Q     '���� L    �� ^    ��� I    ���� 	0 _logn  � ��� c    ��� o    �� 0 x  � m    �

�
 
nmbr�  �  � l   ��	�� I    ���� 	0 _logn  � ��� c    ��� o    �� 0 b  � m    �
� 
nmbr�  �  �	  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� � ��
�  
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    '������� 
0 _error  � ��� m    �� ���  l o g b� ��� o     ���� 0 etext eText� ��� o     !���� 0 enumber eNumber� ��� o   ! "���� 0 efrom eFrom� ���� o   " #���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       (������ h r ~ ����������������������������������  � &����������������������������������������������������������������������������
�� 
pimr�� 0 _support  �� 
0 _error  �� 	0 __e__  �� 0 _isequaldelta _isEqualDelta�� $0 _mindecimalrange _minDecimalRange�� $0 _maxdecimalrange _maxDecimalRange�� (0 _asintegerproperty _asIntegerProperty�� ,0 _makenumberformatter _makeNumberFormatter�� "0 _setbasicformat _setBasicFormat��  0 _nameforformat _nameForFormat
�� .Mth:FNumnull���     nmbr
�� .Mth:PNumnull���     ctxt
�� .Mth:NuHenull���     ****
�� .Mth:HeNunull���     ctxt
�� .Mth:DeRanull���     doub
�� .Mth:RaDenull���     doub
�� .Mth:Abs_null���     nmbr
�� .Mth:CmpNnull���     ****
�� .Mth:MinNnull���     ****
�� .Mth:MaxNnull���     ****
�� .Mth:RouNnull���     nmbr�� 0 _sin  
�� .Mth:Sin_null���     doub
�� .Mth:Cos_null���     doub
�� .Mth:Tan_null���     doub�� 	0 _asin  
�� .Mth:Sinanull���     doub
�� .Mth:Cosanull���     doub
�� .Mth:Tananull���     doub
�� .Mth:Sinhnull���     doub
�� .Mth:Coshnull���     doub
�� .Mth:Tanhnull���     doub�� 
0 _frexp  �� 	0 _logn  
�� .Mth:Lognnull���     doub
�� .Mth:Lo10null���     doub
�� .Mth:Logbnull���     doub� ����� �  ��� �����
�� 
cobj� ��   �� 
�� 
frmk��  � ����
�� 
cobj� ��   �
� 
osax�  � ��   � /
� 
scpt� � 7������ 
0 _error  � ��� �  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  � ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  G��� � &0 throwcommanderror throwCommandError� b  ࠡ����+ � � ������� (0 _asintegerproperty _asIntegerProperty� ��� �  ���� 0 thevalue theValue� 0 propertyname propertyName� 0 minvalue minValue�  � ����� 0 thevalue theValue� 0 propertyname propertyName� 0 minvalue minValue� 0 n  � 	������� � �
� 
long
� 
doub
� 
bool
� 
errn��Y�  � ���
� 
errn��Y�  � 9 (��&E�O���&
 ���& )��lhY hO�W X  )��l�%�%� � ������� ,0 _makenumberformatter _makeNumberFormatter� ��� �  ���� 0 formatstyle formatStyle� 0 
localecode 
localeCode� 0 	thenumber 	theNumber�  � �������� 0 formatstyle formatStyle� 0 
localecode 
localeCode� 0 	thenumber 	theNumber� 0 asocformatter asocFormatter� 0 formatrecord formatRecord� 0 s  � 0 etext eText� G����������~�}�|�{�z�y�x�w�v�u�t�s�r=�q�p�o�nd��m�l��k�j�i�h�g�f�e���d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T~���S��R�Q�P��O�N
� misccura� &0 nsnumberformatter NSNumberFormatter� 	0 alloc  � 0 init  
� 
kocl
� 
reco
� .corecnte****       ****
� 
pcls
� 
MthR�~ 0 basicformat basicFormat�} 0 requiredvalue RequiredValue�| ,0 minimumdecimalplaces minimumDecimalPlaces
�{ 
msng�z ,0 maximumdecimalplaces maximumDecimalPlaces�y 40 minimumsignificantdigits minimumSignificantDigits�x 40 maximumsignificantdigits maximumSignificantDigits�w $0 decimalseparator decimalSeparator�v &0 groupingseparator groupingSeparator�u $0 roundingbehavior roundingBehavior�t �s 60 asoptionalrecordparameter asOptionalRecordParameter�r "0 _setbasicformat _setBasicFormat�q (0 _asintegerproperty _asIntegerProperty�p 60 setminimumfractiondigits_ setMinimumFractionDigits_�o��n 60 setmaximumfractiondigits_ setMaximumFractionDigits_�m <0 setminimumsignificantdigits_ setMinimumSignificantDigits_�l 60 setusessignificantdigits_ setUsesSignificantDigits_�k <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_
�j 
ctxt
�i 
leng
�h 
errn�g�Y�f ,0 setdecimalseparator_ setDecimalSeparator_�e  � �M�L�K
�M 
errn�L�\�K  �d 60 setusesgroupingseparator_ setUsesGroupingSeparator_�c .0 setgroupingseparator_ setGroupingSeparator_
�b MRndRNhE�a @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven�` $0 setroundingmode_ setRoundingMode_
�_ MRndRNhT�^ @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown
�] MRndRNhF�\ <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp
�[ MRndRN_T�Z 80 nsnumberformatterrounddown NSNumberFormatterRoundDown
�Y MRndRN_F�X 40 nsnumberformatterroundup NSNumberFormatterRoundUp
�W MRndRN_U�V >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeiling
�U MRndRN_D�T :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloor� �J�I�H
�J 
errn�I�Y�H  �S 0 etext eText
�R 
enum�Q �P .0 throwinvalidparameter throwInvalidParameter�O *0 asnslocaleparameter asNSLocaleParameter�N 0 
setlocale_ 
setLocale_����,j+ j+ E�Ok�kv��l k Ab  ����b  �,��������a �a �a �a a m+ E�O*���,�m+ O��,� !�*��,a jm+ k+ O�a k+ OPY hO��,� �*��,a jm+ k+ OPY hO��,� �*��,a jm+ k+ O�ek+ Y hO��,� �*��,a  jm+ k+ !O�ek+ Y hO�a ,� G 0�a ,a "&E�O�a #,j  )a $a %lhY hO��k+ &W X ' ()a $a %la )Y hO�a ,� H 1�a ,a "&E�O�a #,j  �fk+ *Y �ek+ *O��k+ +W X ' ()a $a %la ,Y hO�a ,� ��a ,a -  ��a .,k+ /Y ��a ,a 0  ��a 1,k+ /Y ��a ,a 2  ��a 3,k+ /Y r�a ,a 4  ��a 5,k+ /Y Y�a ,a 6  ��a 7,k+ /Y @�a ,a 8  ��a 9,k+ /Y '�a ,a :  ��a ;,k+ /Y )a $a %la <Y hY  *���m+ W X ' =)ja >W X ? =b  �a @�a Alv�a B+ CO�b  �a Dl+ Ek+ FO�� �G��F�E���D�G "0 _setbasicformat _setBasicFormat�F �C��C �  �B�A�@�B 0 asocformatter asocFormatter�A 0 
formatname 
formatName�@ 0 	thenumber 	theNumber�E  � �?�>�=�? 0 asocformatter asocFormatter�> 0 
formatname 
formatName�= 0 	thenumber 	theNumber� #�<�;�:�9�8�7�6�5�4�3�2�1�0�/N�.�-�,�+�*�)�(�'�&�%�$�#�"�!� �����
�< MthZMth0
�; 
msng
�: misccura�9 D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�8 "0 setnumberstyle_ setNumberStyle_
�7 
pcls
�6 
long�5 40 nsnumberformatternostyle NSNumberFormatterNoStyle
�4 
bool�3 >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle�2 60 setminimumfractiondigits_ setMinimumFractionDigits_�1��0 60 setmaximumfractiondigits_ setMaximumFractionDigits_�/ 60 setusesgroupingseparator_ setUsesGroupingSeparator_�. 0 
setformat_ 
setFormat_
�- MthZMth3
�, MthZMth1
�+ MthZMth2
�* MthZMth5�) @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle
�( MthZMth4�' >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle
�& MthZMth6�% @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle
�$ 
kocl
�# 
ctxt
�" .corecnte****       ****
�! 
errn� �Y
� 
erob
� 
errt
� 
enum� �DR��  ���  ���,k+ Y ���,�  ���,k+ Y {b  '�	 �b  '�&
 b  �	 �b  �&�&
 �j �& $���,k+ O�kk+ 
O��k+ O�fk+ OPY !���,k+ O��k+ O�kk+ 
O��k+ OPY ��a   ���,k+ Y ��a   ���,k+ Y ��a   ���,k+ Y t�a   ��a ,k+ Y _�a   ��a ,k+ Y J�a   ��a ,k+ Y 5�kva a l j ��k+ Y )a a a �a a  a !a "� ��������  0 _nameforformat _nameForFormat� ��� �  �� 0 formatstyle formatStyle�  � �� 0 formatstyle formatStyle� �������&-/
� MthZMth1
� MthZMth2
� MthZMth5
� MthZMth4
� MthZMth3
� MthZMth6� I��  �Y ?��  �Y 4��  �Y )��  �Y ��  �Y ��  �Y �%�%� �@�����
� .Mth:FNumnull���     nmbr� 0 	thenumber 	theNumber� �
��
�
 
Usin� {�	���	 0 formatstyle formatStyle�  
� MthZMth0� ���
� 
Loca� {��L� 0 
localecode 
localeCode�  �  � 	��� ������������� 0 	thenumber 	theNumber� 0 formatstyle formatStyle�  0 
localecode 
localeCode�� 0 asocformatter asocFormatter�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ������hm���������������������������
�� 
kocl
�� 
nmbr
�� .corecnte****       ****�� �� 60 throwinvalidparametertype throwInvalidParameterType�� ,0 _makenumberformatter _makeNumberFormatter�� &0 stringfromnumber_ stringFromNumber_
�� 
msng
�� 
errn���Y
�� 
erob
�� 
ctxt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � e P�kv��l j  b  �����+ Y hO*���m+ E�O��k+ E�O��  )�����Y hO��&W X  *a ����a + � �����������
�� .Mth:PNumnull���     ctxt�� 0 thetext theText�� ����
�� 
Usin� {�������� 0 formatstyle formatStyle��  
�� MthZMth0� �����
�� 
Loca� {������� 0 
localecode 
localeCode��  ��  � 
���������������������� 0 thetext theText�� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 asocformatter asocFormatter�� 0 
asocnumber 
asocNumber�� $0 localeidentifier localeIdentifier�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ������������������������������+�/1���D��
�� 
kocl
�� 
ctxt
�� .corecnte****       ****�� �� 60 throwinvalidparametertype throwInvalidParameterType
�� 
msng�� ,0 _makenumberformatter _makeNumberFormatter�� &0 numberfromstring_ numberFromString_�� 
0 locale  �� $0 localeidentifier localeIdentifier
�� 
leng
�� 
errn���Y
�� 
erob�  0 _nameforformat _nameForFormat
� 
****� 0 etext eText� �� 
� 
errn� 0 enumber eNumber  ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � ��kv��l j  b  �����+ Y hO*���m+ E�O��k+ 	E�O��  J�j+ 
j+ �&E�O��,j  �E�Y 	�%�%E�O)a a a ��a *�k+ %a %�%a %Y hO�a &W X  *a ����a + � �`���
� .Mth:NuHenull���     ****� 0 	thenumber 	theNumber� �
� 
Plac {���� 0 	chunksize 	chunkSize�  �   ��
� 
Pref {���� 0 	hasprefix 	hasPrefix�  
� boovfals�   ���������������� 0 	thenumber 	theNumber� 0 	chunksize 	chunkSize� 0 	hasprefix 	hasPrefix� 0 hextext hexText� 0 	hexprefix 	hexPrefix� 0 padtext padText� 0 maxsize maxSize� 0 
resultlist 
resultList� 0 i  � 0 
theinteger 
theInteger� 0 etext eText� 0 oldtids oldTIDs� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo Az������������������� "9JLT]g}��������������'+;DZ������	���~� (0 asintegerparameter asIntegerParameter� (0 asbooleanparameter asBooleanParameter
� 
kocl
� 
list
� .corecnte****       ****� 00 aswholenumberparameter asWholeNumberParameter� 
� 
bool
� 
long� � .0 throwinvalidparameter throwInvalidParameter� 
� 
cobj
� 
leng� 0 
resultlist 
resultList �}
�|�{�z
�} .ascrinit****      � ****
 k     	 ��y�y  �|  �{   �x�x 
0 _list_   �w�v
�w 
cobj�v 
0 _list_  �z 
b   �-E�� 
0 _list_  
� 
doub
� 
errn��\�   �u�t�s
�u 
errn�t�\�s  
� 
ctxt
� 
ascr
� 
txdl� 0 etext eText	 �r�q
�r 
errn�q 0 enumber eNumber �p�o
�p 
erob�o 0 efrom eFrom �n�m�l
�n 
errt�m 
0 eto eTo�l  � �~ 
0 _error  ��b  ��l+ E�Ob  ��l+ E�O�kv��l j <b  ��l+ E�O�j
 ���& b  �����+ Y hOa E�O�j Y�j	 �a �$'�& 7b  �a �a �%a %a �$'k"%a %a �$kk"%a %�+ Y hOa E�O�'E�Y Ra E�O�j	 �a �$k�& 7b  �a �a �%a %a �$'k"%a %a �$kk"%a %�+ Y hO� �a %E�Y hO &h�ja a  �a #k/�%E�O�a "E�[OY��O h�a !,�a "�%E�[OY��O��%Y��k
 ���& b  �a #�a $�+ Y hOa %a �$klvE[a  k/E�Z[a  l/E�ZO �kh�a &%E�[OY��Oa 'a (K )S�O �k�a *,a !,Ekh  @�a *,a  �/E�O��&E�O��a +&
 �j�&
 ���& )a ,a -lhY hW HX . /�� a 0�%a 1%a �$kk"%a 2%E�Y a 3E�Ob  �a *,a  �/a 4��+ Oa 5E�O &h�ja 6a  �a #k/�%E�O�a "E�[OY��O��%[a 7\[Z�'\Zi2�a *,a  �/F[OY�)O_ 8a 9,E�Oa :_ 8a 9,FO� a ;�a *,%E�Y �a *,a 7&E�O�_ 8a 9,FO�W X < =*a >����a ?+ @� �k��j�i�h
�k .Mth:HeNunull���     ctxt�j 0 hextext hexText�i �g
�g 
Plac {�f�e�d�f 0 	chunksize 	chunkSize�e  �d   �c�b
�c 
Prec {�a�`�_�a 0 	isprecise 	isPrecise�`  
�_ boovfals�b   �^�]�\�[�Z�Y�X�W�V�U�T�S�^ 0 hextext hexText�] 0 	chunksize 	chunkSize�\ 0 	isprecise 	isPrecise�[ 0 	thenumber 	theNumber�Z 0 
isnegative 
isNegative�Y 0 charref charRef�X 0 i  �W 0 
resultlist 
resultList�V 0 etext eText�U 0 enumber eNumber�T 0 efrom eFrom�S 
0 eto eTo 5����R��Q�P�O��N��M�L	�K%�J7�I�H�G�F�E�D�CR�B�A�@�?pu���>����=����	#	(�<�;	F�:�9�R "0 astextparameter asTextParameter�Q (0 asintegerparameter asIntegerParameter�P 
�O 
bool
�N 
long�M �L .0 throwinvalidparameter throwInvalidParameter�K (0 asbooleanparameter asBooleanParameter
�J 
ctxt
�I 
kocl
�H 
cobj
�G .corecnte****       ****�F 
�E misccura
�D 
psof
�C 
psin
�B .sysooffslong    ��� null
�A 
errn�@�@�?   �8�7�6
�8 
errn�7�@�6  
�> 
leng�= 0 
resultlist 
resultList �5�4�3�2
�5 .ascrinit****      � **** k      ��1�1  �4  �3   �0�0 
0 _list_   �/�/ 
0 _list_  �2 jv��< 
0 _list_  �; 0 etext eText �.�-
�. 
errn�- 0 enumber eNumber �,�+
�, 
erob�+ 0 efrom eFrom �*�)�(
�* 
errt�) 
0 eto eTo�(  �: �9 
0 _error  �haL��Db  ��l+ E�Ob  ��l+ E�O�j
 ���& b  �����+ Y hOb  ��l+ E�O�j  � �jE�O��E�O� �[a \[Zl\Zi2E�Y hO�a  �[a \[Zm\Zi2E�Y hO U�[a a l kh �a  E�Oa  *a �a a � UE�O�j  )a a lhY hO��kE�[OY��W X  b  �a a a  �+ O�	 	��k �& b  �a !a a "�+ Y hO� 	�'E�Y hO�Y�a #,�#j b  �a $a a %�%a &%�+ Y hOa 'a (K )S�O �k�a #,E�h jE�O n�[a \[Z�\Z��k2[a a l kh �a  E�Oa  *a �a a *� UE�O�j  b  �a +a a ,�+ Y hO��kE�[OY��O�	 	��k �& )b  �[a \[Z�\Z��k2a -a a .�+ Y hO��a /,6F[OY�GO�a /,EVW X 0 1*a 2����a 3+ 4� �'	b�&�%�$
�' .Mth:DeRanull���     doub�& 0 x  �%   �#�"�!� ��# 0 x  �" 0 etext eText�! 0 enumber eNumber�  0 efrom eFrom� 
0 eto eTo ���� 	z��
� 
doub
� 
pi  � �� 0 etext eText  ��!
� 
errn� 0 enumber eNumber! ��"
� 
erob� 0 efrom eFrom" ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �$  ��&��! W X  *塢���+ � �	���#$�
� .Mth:RaDenull���     doub� 0 x  �  # ����
�	� 0 x  � 0 etext eText� 0 enumber eNumber�
 0 efrom eFrom�	 
0 eto eTo$ ����%	���
� 
doub
� 
pi  � �� 0 etext eText% ��&
� 
errn� 0 enumber eNumber& � ��'
�  
erob�� 0 efrom eFrom' ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �  ��&��!!W X  *塢���+ � ��	�����()��
�� .Mth:Abs_null���     nmbr�� 0 x  ��  ( ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo) ����*	�����
�� 
nmbr�� 0 etext eText* ����+
�� 
errn�� 0 enumber eNumber+ ����,
�� 
erob�� 0 efrom eFrom, ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� * ��&E�O�j �'Y �W X  *㡢���+ � ��	�����-.��
�� .Mth:CmpNnull���     ****�� ��/�� /  ������ 0 n1  �� 0 n2  ��  - 	�������������������� 0 n1  �� 0 n2  �� 0 dn  �� 0 dm  �� 0 d  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo. ��������������0
X����
�� 
kocl
�� 
long
�� .corecnte****       ****
�� 
doub
�� 
cobj
�� 
bool�� 0 etext eText0 ����1
�� 
errn�� 0 enumber eNumber1 ����2
�� 
erob�� 0 efrom eFrom2 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � ���lv��l l  ��  jY hY s��&��&lvE[�k/E�Z[�l/E�ZO�j  b  � E�Y b  � E�O�'E�O�� ��lvE[�k/E�Z[�l/E�ZY hO��E�O��	 ���& jY hO�� iY kW X  *襦���+ 
� ��
h����34��
�� .Mth:MinNnull���     ****�� 0 thelist theList��  3 	��������������� 0 thelist theList�� 0 
listobject 
listObject�� 0 i  �� 0 	theresult 	theResult� 0 n  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo4 �
p5��
��
������6
�
�7
���� 0 
listobject 
listObject5 �8��9:�
� .ascrinit****      � ****8 k     ;; 
p��  �  �  9 �� 
0 _list_  : 
x��� "0 aslistparameter asListParameter� 
0 _list_  � b  b   �l+ �� 
0 _list_  
� 
leng
� 
list� � .0 throwinvalidparameter throwInvalidParameter
� 
cobj
� 
nmbr� 0 etext eText6 ���
� 
errn��\�  7 ��<
� 
errn� 0 enumber eNumber< ��=
� 
erob� 0 efrom eFrom= ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � ���K S�O��,�,j  b  �����+ 	Y hOkE�O <��,�k/�&E�O +k��,�,Ekh ��,�/�&E�O�� �E�Y h[OY��W X  b  ��/���%�+ 	O�W X  *a ����a + � �
���>?�
� .Mth:MaxNnull���     ****� 0 thelist theList�  > 	���������� 0 thelist theList� 0 
listobject 
listObject� 0 i  � 0 	theresult 	theResult� 0 n  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo? �@��"�'�����AipB~��� 0 
listobject 
listObject@ �C��DE�
� .ascrinit****      � ****C k     FF ��  �  �  D �� 
0 _list_  E ��~� "0 aslistparameter asListParameter�~ 
0 _list_  � b  b   �l+ �� 
0 _list_  
� 
leng
� 
list� � .0 throwinvalidparameter throwInvalidParameter
� 
cobj
� 
nmbr� 0 etext eTextA �}�|�{
�} 
errn�|�\�{  B �z�yG
�z 
errn�y 0 enumber eNumberG �x�wH
�x 
erob�w 0 efrom eFromH �v�u�t
�v 
errt�u 
0 eto eTo�t  � � 
0 _error  � � ���K S�O��,�,j  b  �����+ 	Y hOkE�O <��,�k/�&E�O +k��,�,Ekh ��,�/�&E�O�� �E�Y h[OY��W X  b  ��/���%�+ 	O�W X  *a ����a + � �s��r�qIJ�p
�s .Mth:RouNnull���     nmbr�r 0 num  �q �oKL
�o 
PlacK {�n�m�l�n 0 decimalplaces decimalPlaces�m  �l  L �kM�j
�k 
DireM {�i�h�g�i &0 roundingdirection roundingDirection�h  
�g MRndRNhE�j  I �f�e�d�c�b�a�`�_�f 0 num  �e 0 decimalplaces decimalPlaces�d &0 roundingdirection roundingDirection�c 0 themultiplier theMultiplier�b 0 etext eText�a 0 enumber eNumber�` 0 efrom eFrom�_ 
0 eto eToJ ��^��]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O��N�MN�L�K�^ "0 asrealparameter asRealParameter�] (0 asintegerparameter asIntegerParameter�\ 
�[ d
�Z MRndRNhE�Y���X �W 2
�V MRndRNhT�U��
�T MRndRNhF
�S MRndRN_T
�R MRndRN_F
�Q MRndRN_U
�P 
bool
�O MRndRN_D�N >0 throwinvalidconstantparameter throwInvalidConstantParameter�M 0 etext eTextN �J�IO
�J 
errn�I 0 enumber eNumberO �H�GP
�H 
erob�G 0 efrom eFromP �F�E�D
�F 
errt�E 
0 eto eTo�D  �L �K 
0 _error  �p��b  ��l+ E�Ob  ��l+ E�O�j �$E�O�� � E�Y hO��  3��lv�l!�#kv 
��"E�Y �j ���"E�Y 	���"E�Y��  1��lv��#kv 
��"E�Y �j ���"E�Y 	���"E�Y ��  C��lv��#kv �j ��"kE�Y 	��"kE�Y �j ���"E�Y 	���"E�Y ���  
��"E�Y ���  ,��#j  
��"E�Y �j ��"kE�Y 	��"kE�Y e��  &�j
 ��#j a & 
��"E�Y 	��"kE�Y ;�a   &�j
 ��#j a & 
��"E�Y 	��"kE�Y b  �a l+ O�j  	�k"Y �j 	��"Y ��!W X  *a ����a + � �C1�B�AQR�@�C 0 _sin  �B �?S�? S  �>�> 0 x  �A  Q �=�<�;�:�9�8�= 0 x  �< 0 isneg isNeg�; 0 y  �: 0 z  �9 0 z2  �8 0 zz  R �7�6�5�4k�3�2����1�������
�7h
�6 
pi  �5 ��4 �3 �2 
�1 
bool�@ ��#��! E�O�jE�O� 	�'E�Y hO���! k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��#E�O�m �E�O��E�Y hO��� �� �� E�O�� E�O�k 
 �l �& *�l!�� � �� �� �� a � a  E�Y +��� a � a � a � a � a � a  E�O� 	�'E�Y hO�� �0"�/�.TU�-
�0 .Mth:Sin_null���     doub�/ 0 x  �.  T �,�+�*�)�(�, 0 x  �+ 0 etext eText�* 0 enumber eNumber�) 0 efrom eFrom�( 
0 eto eToU �'�&�%V6�$�#
�' 
nmbr�& 0 _sin  �% 0 etext eTextV �"�!W
�" 
errn�! 0 enumber eNumberW � �X
�  
erob� 0 efrom eFromX ���
� 
errt� 
0 eto eTo�  �$ �# 
0 _error  �-  *��&k+ W X  *䡢���+ � �F��YZ�
� .Mth:Cos_null���     doub� 0 x  �  Y ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToZ ����[]��
� 
nmbr� Z� 0 _sin  � 0 etext eText[ ��\
� 
errn� 0 enumber eNumber\ �
�	]
�
 
erob�	 0 efrom eFrom] ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � ! *��&�k+ W X  *塢���+ � �m��^_�
� .Mth:Tan_null���     doub� 0 x  �  ^ 
�� ����������������� 0 x  �  0 isneg isNeg�� 0 y  �� 0 z  �� 0 z2  �� 0 zz  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo_ �����������������������������,-./����`S����
�� 
nmbr�� Z��
�� 
bool
�� 
errn���s
�� 
erob�� ��h
�� 
pi  �� ��� �� �� 0 etext eText` ����a
�� 
errn�� 0 enumber eNumbera ����b
�� 
erob�� 0 efrom eFromb ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � ��&E�O�� 
 �� �& )�����Y hO��#��! E�O�jE�O� 	�'E�Y hO���!!k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��� �� �a  E�O�� E�O�a  4��� a � a � a  �a � a � a � a !E�Y �E�O�l 
 	�a  �& 
i�!E�Y hO� 	�'E�Y hO�W X  *a ����a + � ��o����cd���� 	0 _asin  �� ��e�� e  ���� 0 x  ��  c ������������ 0 x  �� 0 isneg isNeg�� 0 zz  �� 0 p  �� 0 z  d ������������������������-./012JKLMN��
�� 
errn���Y
�� 
erob�� 
�� 
pi  �� ��� ��jE�O� 	�'E�Y hO�k )�����Y hO�� Xk�E�O�� �� �� �� � ��� �� �� �!E�O���$E�O_ �!�E�O�� a E�O��_ �!E�Y ]�a  �E�Y O�� E�O�a � a � a � a � a � a  �a � a � a � a � a !� �E�O� 	�'E�Y hO�_ a !!� ��f����fg��
�� .Mth:Sinanull���     doub�� 0 x  ��  f ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTog ������hz����
�� 
nmbr�� 	0 _asin  �� 0 etext eTexth ����i
�� 
errn�� 0 enumber eNumberi ��j
� 
erob� 0 efrom eFromj ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  ��  *��&k+ W X  *䡢���+ � ����kl�
� .Mth:Cosanull���     doub� 0 x  �  k ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTol ����m���� Z
� 
nmbr� 	0 _asin  � 0 etext eTextm ��n
� 
errn� 0 enumber eNumbern ��o
� 
erob� 0 efrom eFromo ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � ! �*��&k+ W X  *塢���+ � ����pq�
� .Mth:Tananull���     doub� 0 x  �  p ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToq ����r���
� 
nmbr� 	0 _asin  � 0 etext eTextr ��s
� 
errn� 0 enumber eNumbers ��t
� 
erob� 0 efrom eFromt ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � + ��&E�O*��� k�$!k+ W X  *塢���+ � �������uv��
�� .Mth:Sinhnull���     doub�� 0 x  ��  u ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTov ����w����
�� 
nmbr�� 0 etext eTextw ����x
�� 
errn�� 0 enumber eNumberx ���y
�� 
erob� 0 efrom eFromy �~�}�|
�~ 
errt�} 
0 eto eTo�|  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䡢���+ � �{%�z�yz{�x
�{ .Mth:Coshnull���     doub�z 0 x  �y  z �w�v�u�t�s�w 0 x  �v 0 etext eText�u 0 enumber eNumber�t 0 efrom eFrom�s 
0 eto eTo{ �r5�q|H�p�o
�r 
nmbr�q 0 etext eText| �n�m}
�n 
errn�m 0 enumber eNumber} �l�k~
�l 
erob�k 0 efrom eFrom~ �j�i�h
�j 
errt�i 
0 eto eTo�h  �p �o 
0 _error  �x / ��&E�O�b  �$b  �'$ W X  *䡢���+ � �gX�f�e��d
�g .Mth:Tanhnull���     doub�f 0 x  �e   �c�b�a�`�_�c 0 x  �b 0 etext eText�a 0 enumber eNumber�` 0 efrom eFrom�_ 
0 eto eTo� �^�]���\�[
�^ 
nmbr�] 0 etext eText� �Z�Y�
�Z 
errn�Y 0 enumber eNumber� �X�W�
�X 
erob�W 0 efrom eFrom� �V�U�T
�V 
errt�U 
0 eto eTo�T  �\ �[ 
0 _error  �d > -��&E�Ob  �$b  �'$b  �$b  �'$!W X  *㡢���+ � �S��R�Q���P�S 
0 _frexp  �R �O��O �  �N�N 0 m  �Q  � �M�L�K�M 0 m  �L 0 isneg isNeg�K 0 e  � ���J
�J 
bool�P o�j  
�jlvY hO�jE�O� 	�'E�Y hOjE�O 3h��	 �k�&�k �l!E�O�kE�Y �l E�O�kE�[OY��O� 	�'E�Y hO��lv� �I��H�G���F�I 	0 _logn  �H �E��E �  �D�D 0 x  �G  � �C�B�A�@�C 0 x  �B 0 e  �A 0 z  �@ 0 y  � �?�>�=�<�;�:'8stu������������� 
�? 
errn�>�Y�= 
0 _frexp  
�< 
cobj�;��
�: 
bool�F<�j )��l�Y hO*�k+ E[�k/E�Z[�l/E�ZO��
 �l�& j�� �kE�O��E�O� �E�Y �kE�O� �E�O��!E�O�� E�O�� � �� � ��� �� �!E�O�E�O��� ��a  E�Y ��� �kE�Ol� kE�Y �kE�O�� E�O�� a � a � a � a � a � a  �a � a � a � a � a !E�O�j ��� E�Y hO��l!E�O��E�O�j ��a  E�Y hO�� �96�8�7���6
�9 .Mth:Lognnull���     doub�8 0 x  �7  � �5�4�3�2�1�5 0 x  �4 0 etext eText�3 0 enumber eNumber�2 0 efrom eFrom�1 
0 eto eTo� �0�/�.�J�-�,
�0 
nmbr�/ 	0 _logn  �. 0 etext eText� �+�*�
�+ 
errn�* 0 enumber eNumber� �)�(�
�) 
erob�( 0 efrom eFrom� �'�&�%
�' 
errt�& 
0 eto eTo�%  �- �, 
0 _error  �6  *��&k+ W X  *䡢���+ � �$Z�#�"���!
�$ .Mth:Lo10null���     doub�# 0 x  �"  � � �����  0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 
��nop��|��
� 
nmbr� 	0 _logn  � 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �! % *��&k+ �!� �!W X  *硢���+ 	� �������
� .Mth:Logbnull���     doub� 0 x  � ��
�	
� 
Base�
 0 b  �	  � ������� 0 x  � 0 b  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ��� ������
� 
nmbr� 	0 _logn  �  0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � ( *��&k+ *��&k+ !W X  *䢣���+  ascr  ��ޭ