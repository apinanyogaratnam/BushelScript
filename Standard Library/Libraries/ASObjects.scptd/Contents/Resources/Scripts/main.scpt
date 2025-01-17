FasdUAS 1.101.10   ��   ��    k             l      ��  ��   JD Objects -- additional data structures

Notes:

- DictionaryCollection objects, being native code, are approximately 1/1000 as fast as [kludge-optimized] AppleScript lists when getting and setting items, and use a fixed-size bucket list so degrade in performance roughly in proportion to the number of items added, so are not suitable for heavy duty use where performance is a concern. For tasks where both keys and values are simple data types � numbers, text, booleans � better performance may be obtained using NSMutableDictionary instances via the AppleScriptObjC bridge. 

- NSMutableDictionary should not be used to more complex values � lists, records, object specifiers, script objects, etc. � due to the limitations of the ASOC bridge (e.g. records lose keyword-based properties, object specifiers forget their target application, large numbers of script objects crash ASOC), whereas DictionaryCollection can safely store any AppleScript value without problem.

- DictionaryCollection objects automatically copy date objects that are used as item keys. Item values are never copied.
     � 	 	�   O b j e c t s   - -   a d d i t i o n a l   d a t a   s t r u c t u r e s 
 
 N o t e s : 
 
 -   D i c t i o n a r y C o l l e c t i o n   o b j e c t s ,   b e i n g   n a t i v e   c o d e ,   a r e   a p p r o x i m a t e l y   1 / 1 0 0 0   a s   f a s t   a s   [ k l u d g e - o p t i m i z e d ]   A p p l e S c r i p t   l i s t s   w h e n   g e t t i n g   a n d   s e t t i n g   i t e m s ,   a n d   u s e   a   f i x e d - s i z e   b u c k e t   l i s t   s o   d e g r a d e   i n   p e r f o r m a n c e   r o u g h l y   i n   p r o p o r t i o n   t o   t h e   n u m b e r   o f   i t e m s   a d d e d ,   s o   a r e   n o t   s u i t a b l e   f o r   h e a v y   d u t y   u s e   w h e r e   p e r f o r m a n c e   i s   a   c o n c e r n .   F o r   t a s k s   w h e r e   b o t h   k e y s   a n d   v a l u e s   a r e   s i m p l e   d a t a   t y p e s      n u m b e r s ,   t e x t ,   b o o l e a n s      b e t t e r   p e r f o r m a n c e   m a y   b e   o b t a i n e d   u s i n g   N S M u t a b l e D i c t i o n a r y   i n s t a n c e s   v i a   t h e   A p p l e S c r i p t O b j C   b r i d g e .   
 
 -   N S M u t a b l e D i c t i o n a r y   s h o u l d   n o t   b e   u s e d   t o   m o r e   c o m p l e x   v a l u e s      l i s t s ,   r e c o r d s ,   o b j e c t   s p e c i f i e r s ,   s c r i p t   o b j e c t s ,   e t c .      d u e   t o   t h e   l i m i t a t i o n s   o f   t h e   A S O C   b r i d g e   ( e . g .   r e c o r d s   l o s e   k e y w o r d - b a s e d   p r o p e r t i e s ,   o b j e c t   s p e c i f i e r s   f o r g e t   t h e i r   t a r g e t   a p p l i c a t i o n ,   l a r g e   n u m b e r s   o f   s c r i p t   o b j e c t s   c r a s h   A S O C ) ,   w h e r e a s   D i c t i o n a r y C o l l e c t i o n   c a n   s a f e l y   s t o r e   a n y   A p p l e S c r i p t   v a l u e   w i t h o u t   p r o b l e m . 
 
 -   D i c t i o n a r y C o l l e c t i o n   o b j e c t s   a u t o m a t i c a l l y   c o p y   d a t e   o b j e c t s   t h a t   a r e   u s e d   a s   i t e m   k e y s .   I t e m   v a l u e s   a r e   n e v e r   c o p i e d . 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t      l     ��������  ��  ��        l          j     �� �� 0 _support    N          4     �� !
�� 
scpt ! m     " " � # #  T y p e S u p p o r t  "  used for parameter checking     � $ $ 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g   % & % l     ��������  ��  ��   &  ' ( ' i   
 ) * ) I      �� +���� 
0 _error   +  , - , o      ���� 0 handlername handlerName -  . / . o      ���� 0 etext eText /  0 1 0 o      ���� 0 enumber eNumber 1  2 3 2 o      ���� 0 efrom eFrom 3  4�� 4 o      ���� 
0 eto eTo��  ��   * n     5 6 5 I    �� 7���� &0 throwcommanderror throwCommandError 7  8 9 8 m     : : � ; ;  O b j e c t s 9  < = < o    ���� 0 handlername handlerName =  > ? > o    ���� 0 etext eText ?  @ A @ o    	���� 0 enumber eNumber A  B C B o   	 
���� 0 efrom eFrom C  D�� D o   
 ���� 
0 eto eTo��  ��   6 o     ���� 0 _support   (  E F E l     ��������  ��  ��   F  G H G l     ��������  ��  ��   H  I J I l     �� K L��   K J D--------------------------------------------------------------------    L � M M � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - J  N O N l     �� P Q��   P   Collections    Q � R R    C o l l e c t i o n s O  S T S l     ��������  ��  ��   T  U V U i    W X W I      �� Y����  0 _makeemptylist _makeEmptyList Y  Z�� Z o      ���� 0 n  ��  ��   X l    ! [ \ ] [ k     ! ^ ^  _ ` _ r      a b a J      c c  d�� d m     ��
�� 
msng��   b o      ���� 0 l   `  e f e V     g h g k     i i  j k j r     l m l b     n o n o    ���� 0 l   o o    ���� 0 l   m o      ���� 0 l   k  p�� p r     q r q _     s t s o    ���� 0 n   t m    ����  r o      ���� 0 n  ��   h ?   
  u v u o   
 ���� 0 n   v m    ����  f  w�� w L    ! x x o     ���� 0 l  ��   \ � � make a list of size n where n is a power of two, e.g. _makeBucketList(1024) returns a 1024 (2^10) item list (other values of n are rounded down automatically, e.g. n=1000 gives a 512-item list)    ] � y y�   m a k e   a   l i s t   o f   s i z e   n   w h e r e   n   i s   a   p o w e r   o f   t w o ,   e . g .   _ m a k e B u c k e t L i s t ( 1 0 2 4 )   r e t u r n s   a   1 0 2 4   ( 2 ^ 1 0 )   i t e m   l i s t   ( o t h e r   v a l u e s   o f   n   a r e   r o u n d e d   d o w n   a u t o m a t i c a l l y ,   e . g .   n = 1 0 0 0   g i v e s   a   5 1 2 - i t e m   l i s t ) V  z { z l     ��������  ��  ��   {  | } | l     ��������  ��  ��   }  ~  ~ l     �� � ���   �  -----    � � � � 
 - - - - -   � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I     ������
�� .Obj:Dictnull��� ��� null��  ��   � l     � � � � k      � �  � � � l      �� � ���   �}w
		Create a basic hashmap, analogous to Cocoa's NSDictionary class. Uses NSString to generate key hashes from text-based keys (non-text keys will be coerced to text). Items are stored in a fixed-sized bucket list where each bucket contains either `missing value` or a linked list composed of AS records.

		Note: While Cocoa's NSMutableDictionary class may be used via AppleScript-ObjC, it is really only suitable for storing simple AppleScript values such as text and numbers; other values such as `missing value`, records, references, and script objects cannot reliably cross the ASOC bridge without being corrupted (e.g. references lose their target application information) or crashing (e.g. ASOC can't handle large numbers of script objects). For general-purpose use, it is safest to use a mostly-native AppleScript implementation, using Cocoa APIs only to speed up key hashing.		
	    � � � �� 
 	 	 C r e a t e   a   b a s i c   h a s h m a p ,   a n a l o g o u s   t o   C o c o a ' s   N S D i c t i o n a r y   c l a s s .   U s e s   N S S t r i n g   t o   g e n e r a t e   k e y   h a s h e s   f r o m   t e x t - b a s e d   k e y s   ( n o n - t e x t   k e y s   w i l l   b e   c o e r c e d   t o   t e x t ) .   I t e m s   a r e   s t o r e d   i n   a   f i x e d - s i z e d   b u c k e t   l i s t   w h e r e   e a c h   b u c k e t   c o n t a i n s   e i t h e r   ` m i s s i n g   v a l u e `   o r   a   l i n k e d   l i s t   c o m p o s e d   o f   A S   r e c o r d s . 
 
 	 	 N o t e :   W h i l e   C o c o a ' s   N S M u t a b l e D i c t i o n a r y   c l a s s   m a y   b e   u s e d   v i a   A p p l e S c r i p t - O b j C ,   i t   i s   r e a l l y   o n l y   s u i t a b l e   f o r   s t o r i n g   s i m p l e   A p p l e S c r i p t   v a l u e s   s u c h   a s   t e x t   a n d   n u m b e r s ;   o t h e r   v a l u e s   s u c h   a s   ` m i s s i n g   v a l u e ` ,   r e c o r d s ,   r e f e r e n c e s ,   a n d   s c r i p t   o b j e c t s   c a n n o t   r e l i a b l y   c r o s s   t h e   A S O C   b r i d g e   w i t h o u t   b e i n g   c o r r u p t e d   ( e . g .   r e f e r e n c e s   l o s e   t h e i r   t a r g e t   a p p l i c a t i o n   i n f o r m a t i o n )   o r   c r a s h i n g   ( e . g .   A S O C   c a n ' t   h a n d l e   l a r g e   n u m b e r s   o f   s c r i p t   o b j e c t s ) .   F o r   g e n e r a l - p u r p o s e   u s e ,   i t   i s   s a f e s t   t o   u s e   a   m o s t l y - n a t i v e   A p p l e S c r i p t   i m p l e m e n t a t i o n ,   u s i n g   C o c o a   A P I s   o n l y   t o   s p e e d   u p   k e y   h a s h i n g . 	 	 
 	 �  ��� � h     �� ��� ,0 dictionarycollection DictionaryCollection � k       � �  � � � x     �� �����   � 4    �� �
�� 
frmk � m     � � � � �  F o u n d a t i o n��   �  � � � l     ��������  ��  ��   �  � � � l      � � � � j    �� ��� 0 _buckets   � I    �� �����  0 _makeemptylist _makeEmptyList �  ��� � m    ���� ��  ��   � v p DictionaryCollections currently use a fixed-size bucket list (2^10=1024 items seems to be a reasonable default)    � � � � �   D i c t i o n a r y C o l l e c t i o n s   c u r r e n t l y   u s e   a   f i x e d - s i z e   b u c k e t   l i s t   ( 2 ^ 1 0 = 1 0 2 4   i t e m s   s e e m s   t o   b e   a   r e a s o n a b l e   d e f a u l t ) �  � � � j    �� ��� 	0 _size   � n     � � � 1    ��
�� 
leng � n    � � � o    ���� 0 _buckets   �  f     �  � � � j    �� ��� 
0 _count   � m    ����   �  � � � l     ��������  ��  ��   �  � � � i   ! � � � I      �� ����� 
0 _error   �  � � � o      ���� 0 handlername handlerName �  � � � o      ���� 0 etext eText �  � � � o      ���� 0 enumber eNumber �  � � � o      ���� 0 efrom eFrom �  ��� � o      ���� 
0 eto eTo��  ��   � n     � � � I    �� ����� $0 throwmethoderror throwMethodError �  � � � m     � � � � �  O b j e c t s �  � � � m     � � � � � ( D i c t i o n a r y C o l l e c t i o n �  � � � o    ���� 0 handlername handlerName �  � � � o    	���� 0 etext eText �  � � � o   	 
���� 0 enumber eNumber �  � � � o   
 ���� 0 efrom eFrom �  ��� � o    ���� 
0 eto eTo��  ��   � o     ���� 0 _support   �  � � � l     ��������  ��  ��   �  � � � i  " % � � � I      �� ����� 0 	_keyindex 	_keyIndex �  ��� � o      ���� 0 thekey theKey��  ��   � k    8 � �  � � � l    : � � � � Z    : � ����� � G     + � � � G      � � � >      � � � l    	 ���~ � I    	�} � �
�} .corecnte****       **** � J      � �  ��| � o     �{�{ 0 thekey theKey�|   � �z ��y
�z 
kocl � m    �x
�x 
obj �y  �  �~   � m   	 
�w�w   � >     � � � l    ��v�u � I   �t � �
�t .corecnte****       **** � J     � �  ��s � o    �r�r 0 thekey theKey�s   � �q ��p
�q 
kocl � m    �o
�o 
reco�p  �v  �u   � m    �n�n   � >    ) � � � l   ' ��m�l � I   '�k � �
�k .corecnte****       **** � J    ! � �  �j  o    �i�i 0 thekey theKey�j   � �h�g
�h 
kocl m   " #�f
�f 
scpt�g  �m  �l   � m   ' (�e�e   � R   . 6�d
�d .ascrerr ****      � **** m   4 5 � " I n v a l i d   k e y   t y p e . �c
�c 
errn m   0 1�b�b�Y �a�`
�a 
erob o   2 3�_�_ 0 thekey theKey�`  ��  ��   � K E explicitly disallow types that can redefine their `class` properties    � �		 �   e x p l i c i t l y   d i s a l l o w   t y p e s   t h a t   c a n   r e d e f i n e   t h e i r   ` c l a s s `   p r o p e r t i e s � 

 Z   ;-�^ E  ; F J   ; @  m   ; <�]
�] 
type  m   < =�\
�\ 
pcls �[ m   = >�Z
�Z 
enum�[   J   @ E �Y n  @ C m   A C�X
�X 
pcls o   @ A�W�W 0 thekey theKey�Y   l  I Y r   I Y n  I W !  I   S W�V�U�T�V 0 typecodevalue typeCodeValue�U  �T  ! n  I S"#" I   N S�S$�R�S 0 
asnsobject 
asNSObject$ %�Q% o   N O�P�P 0 thekey theKey�Q  �R  # o   I N�O�O 0 _support   o      �N�N 0 hashnum hashNum caution: coercing a type class or constant symbol to text is problematic, as the resulting string may contain either its literal name or its raw four-char code depending on the terminology available at the time (furthermore, terminology conflicts and synonyms may cause its literal name to change); to avoid these problems, it's better to send the value over the ASOC to convert it to an NSAppleEventDescriptor, from which its raw four-char code can be obtained as an Int32 which can be safely used as its hashNum    �&&   c a u t i o n :   c o e r c i n g   a   t y p e   c l a s s   o r   c o n s t a n t   s y m b o l   t o   t e x t   i s   p r o b l e m a t i c ,   a s   t h e   r e s u l t i n g   s t r i n g   m a y   c o n t a i n   e i t h e r   i t s   l i t e r a l   n a m e   o r   i t s   r a w   f o u r - c h a r   c o d e   d e p e n d i n g   o n   t h e   t e r m i n o l o g y   a v a i l a b l e   a t   t h e   t i m e   ( f u r t h e r m o r e ,   t e r m i n o l o g y   c o n f l i c t s   a n d   s y n o n y m s   m a y   c a u s e   i t s   l i t e r a l   n a m e   t o   c h a n g e ) ;   t o   a v o i d   t h e s e   p r o b l e m s ,   i t ' s   b e t t e r   t o   s e n d   t h e   v a l u e   o v e r   t h e   A S O C   t o   c o n v e r t   i t   t o   a n   N S A p p l e E v e n t D e s c r i p t o r ,   f r o m   w h i c h   i t s   r a w   f o u r - c h a r   c o d e   c a n   b e   o b t a i n e d   a s   a n   I n t 3 2   w h i c h   c a n   b e   s a f e l y   u s e d   a s   i t s   h a s h N u m�^   k   \-'' ()( Z   \*+,-* =  \ c./. n  \ _010 m   ] _�M
�M 
pcls1 o   \ ]�L�L 0 thekey theKey/ m   _ b�K
�K 
ctxt+ r   f z232 n  f x454 I   t x�J�I�H�J 0 hash  �I  �H  5 n  f t676 I   k t�G8�F�G ,0 asnormalizednsstring asNormalizedNSString8 9�E9 c   k p:;: o   k l�D�D 0 thekey theKey; m   l o�C
�C 
ctxt�E  �F  7 o   f k�B�B 0 _support  3 o      �A�A 0 hashnum hashNum, <=< E  } �>?> J   } �@@ ABA m   } ��@
�@ 
longB C�?C m   � ��>
�> 
doub�?  ? J   � �DD E�=E n  � �FGF m   � ��<
�< 
pclsG o   � ��;�; 0 thekey theKey�=  = HIH l  � �JKLJ k   � �MM NON r   � �PQP o   � ��:�: 0 thekey theKeyQ o      �9�9 0 hashnum hashNumO RSR r   � �TUT `   � �VWV o   � ��8�8 0 thekey theKeyW m   � ��7�7 U o      �6�6 0 divnum divNumS XYX Z  � �Z[�5�4Z >   � �\]\ o   � ��3�3 0 divnum divNum] m   � ��2�2  [ r   � �^_^ \   � �`a` o   � ��1�1 0 hashnum hashNuma ^   � �bcb m   � ��0�0 c o   � ��/�/ 0 divnum divNum_ o      �.�. 0 hashnum hashNum�5  �4  Y ded Z  � �fg�-�,f A   � �hih o   � ��+�+ 0 hashnum hashNumi m   � ��*�*  g r   � �jkj d   � �ll o   � ��)�) 0 hashnum hashNumk o      �(�( 0 hashnum hashNum�-  �,  e m�'m Z  � �no�&�%n A   � �pqp o   � ��$�$ 0 hashnum hashNumq m   � �rr it���bZo r   � �sts ]   � �uvu o   � ��#�# 0 hashnum hashNumv m   � ��"�"  J�t o      �!�! 0 hashnum hashNum�&  �%  �'  K � � note: integers and reals that are numerically equal must always produce same hash, since the linked list lookup compares integer and real keys for numeric equality (e.g. 1 = 1.0)    L �wwh   n o t e :   i n t e g e r s   a n d   r e a l s   t h a t   a r e   n u m e r i c a l l y   e q u a l   m u s t   a l w a y s   p r o d u c e   s a m e   h a s h ,   s i n c e   t h e   l i n k e d   l i s t   l o o k u p   c o m p a r e s   i n t e g e r   a n d   r e a l   k e y s   f o r   n u m e r i c   e q u a l i t y   ( e . g .   1   =   1 . 0 )  I xyx =  � �z{z n  � �|}| m   � �� 
�  
pcls} o   � ��� 0 thekey theKey{ m   � ��
� 
ldt y ~�~ k   � ��� r   � ���� n  � ���� I   � ����� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�  �  � n  � ���� I   � ����� 0 
asnsobject 
asNSObject� ��� o   � ��� 0 thekey theKey�  �  � o   � ��� 0 _support  � o      �� 0 hashnum hashNum� ��� Z  � ������ A   � ���� o   � ��� 0 hashnum hashNum� m   � ���  � r   � ���� d   � ��� o   � ��� 0 hashnum hashNum� o      �� 0 hashnum hashNum�  �  � ��� Z  ������ A   � ���� o   � ��
�
 0 hashnum hashNum� m   � ��� it���bZ� r  ��� ]  ��� o  �	�	 0 hashnum hashNum� m  ��  J�� o      �� 0 hashnum hashNum�  �  �  �  - R  ���
� .ascrerr ****      � ****� m  �� ��� " I n v a l i d   k e y   t y p e .� ���
� 
errn� m  ���Y� ���
� 
erob� o  �� 0 thekey theKey�  ) ��� l � ���   � � � `-[NSString hash]` returns UInt64 which ASOC unpacks as Double, so discard least significant bits when precision is lost due to rounding   � ���   ` - [ N S S t r i n g   h a s h ] `   r e t u r n s   U I n t 6 4   w h i c h   A S O C   u n p a c k s   a s   D o u b l e ,   s o   d i s c a r d   l e a s t   s i g n i f i c a n t   b i t s   w h e n   p r e c i s i o n   i s   l o s t   d u e   t o   r o u n d i n g� ���� Z -������� ?  ��� o  ���� 0 hashnum hashNum� m  �� C������� r  ")��� _  "'��� o  "#���� 0 hashnum hashNum� m  #&���� � o      ���� 0 hashnum hashNum��  ��  ��   ���� L  .8�� [  .7��� `  .5��� o  ./���� 0 hashnum hashNum� o  /4���� 	0 _size  � m  56���� ��   � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  & )��� I      �������� 0 
countitems 
countItems��  ��  � L     �� o     ���� 
0 _count  � ��� l     ��������  ��  ��  � ��� i  * -��� I      ������� 0 additem addItem� ��� o      ���� 0 thekey theKey� ���� o      ���� 0 thevalue theValue��  ��  � Q     ����� k    ��� ��� r    ��� I    	������� 0 	_keyindex 	_keyIndex� ���� o    ���� 0 thekey theKey��  ��  � o      ���� 0 keyindex keyIndex� ��� l   ���� s    ��� o    ���� 0 thekey theKey� o      ���� 0 thekey theKey�-' while dates can be used as keys, it's essential that keys stored in linked lists are never mutated so they must be copied first (this is a no-op for text, numbers, and other immutable types, while other types for which copying is problematic, e.g. script objects, are already forbidden as keys)   � ���N   w h i l e   d a t e s   c a n   b e   u s e d   a s   k e y s ,   i t ' s   e s s e n t i a l   t h a t   k e y s   s t o r e d   i n   l i n k e d   l i s t s   a r e   n e v e r   m u t a t e d   s o   t h e y   m u s t   b e   c o p i e d   f i r s t   ( t h i s   i s   a   n o - o p   f o r   t e x t ,   n u m b e r s ,   a n d   o t h e r   i m m u t a b l e   t y p e s ,   w h i l e   o t h e r   t y p e s   f o r   w h i c h   c o p y i n g   i s   p r o b l e m a t i c ,   e . g .   s c r i p t   o b j e c t s ,   a r e   a l r e a d y   f o r b i d d e n   a s   k e y s )� ��� r    ��� n    ��� 4    ���
�� 
cobj� o    ���� 0 keyindex keyIndex� n   ��� o    ���� 0 _buckets  �  f    � o      ���� 0 	founditem 	foundItem� ��� Z    D������� =   ��� o    ���� 0 	founditem 	foundItem� m    ��
�� 
msng� l    @���� k     @�� ��� r     /��� K     (�� ������ 0 k  � o   ! "���� 0 thekey theKey� ������ 0 v  � o   # $���� 0 thevalue theValue� ������� 0 nextitem nextItem� m   % &��
�� 
msng��  � n      ��� 4   + .���
�� 
cobj� o   , -���� 0 keyindex keyIndex� n  ( +   o   ) +���� 0 _buckets    f   ( )�  r   0 = [   0 7 o   0 5���� 
0 _count   m   5 6����  o      ���� 
0 _count   �� L   > @����  ��  �   insert new item   � �		     i n s e r t   n e w   i t e m��  ��  � 
��
 P   E � T   J � k   O �  Z   O {���� =  O T n   O R o   P R���� 0 k   o   O P���� 0 	founditem 	foundItem o   R S���� 0 thekey theKey l  W w k   W w  r   W \ n   W Z !  o   X Z���� 0 v  ! o   W X���� 0 	founditem 	foundItem o      ���� 0 oldvalue oldValue "#" r   ] t$%$ J   ] a&& '(' o   ] ^���� 0 thekey theKey( )��) o   ^ _���� 0 thevalue theValue��  % J      ** +,+ n      -.- o   g i���� 0 k  . o   f g���� 0 	founditem 	foundItem, /��/ n      010 o   p r���� 0 v  1 o   o p���� 0 	founditem 	foundItem��  # 2��2 L   u w����  ��     replace existing item    �33 ,   r e p l a c e   e x i s t i n g   i t e m��  ��   454 Z   | �67����6 =  | �898 n   | :;: o   } ���� 0 nextitem nextItem; o   | }���� 0 	founditem 	foundItem9 m    ���
�� 
msng7 l  � �<=>< k   � �?? @A@ r   � �BCB K   � �DD ��EF�� 0 k  E o   � ����� 0 thekey theKeyF ��GH�� 0 v  G o   � ����� 0 thevalue theValueH ��I���� 0 nextitem nextItemI m   � ���
�� 
msng��  C n      JKJ o   � ����� 0 nextitem nextItemK o   � ����� 0 	founditem 	foundItemA LML r   � �NON [   � �PQP o   � ����� 
0 _count  Q m   � ����� O o      ���� 
0 _count  M R��R L   � �����  ��  =   insert new item   > �SS     i n s e r t   n e w   i t e m��  ��  5 T��T r   � �UVU n   � �WXW o   � ����� 0 nextitem nextItemX o   � ����� 0 	founditem 	foundItemV o      ���� 0 	founditem 	foundItem��   ��Y
�� conscaseY ��Z
�� consdiacZ ��[
�� conshyph[ ��\
�� conspunc\ ����
�� conswhit��   ����
�� consnume��  ��  � R      ��]^
�� .ascrerr ****      � ****] o      ���� 0 etext eText^ ��_`
�� 
errn_ o      ���� 0 enumber eNumber` ��ab
�� 
eroba o      ���� 0 efrom eFromb ��c��
�� 
errtc o      ���� 
0 eto eTo��  � I   � ���d���� 
0 _error  d efe m   � �gg �hh  a d d I t e mf iji o   � ����� 0 etext eTextj klk o   � ����� 0 enumber eNumberl mnm o   � ����� 0 efrom eFromn o��o o   � ����� 
0 eto eTo��  ��  � pqp l     ��~�}�  �~  �}  q rsr i  . 1tut I      �|v�{�| 0 
removeitem 
removeItemv w�zw o      �y�y 0 thekey theKey�z  �{  u Q     �xyzx k    �{{ |}| r    ~~ I    	�x��w�x 0 	_keyindex 	_keyIndex� ��v� o    �u�u 0 thekey theKey�v  �w   o      �t�t 0 keyindex keyIndex} ��� r    ��� n    ��� 4    �s�
�s 
cobj� o    �r�r 0 keyindex keyIndex� n   ��� o    �q�q 0 _buckets  �  f    � o      �p�p 0 	founditem 	foundItem� ��� P    w���� k    v�� ��� r    ��� m    �o
�o 
msng� o      �n�n 0 previtem prevItem� ��m� V    v��� k   & q�� ��� r   & +��� n   & )��� o   ' )�l�l 0 k  � o   & '�k�k 0 	founditem 	foundItem� o      �j�j 0 foundkey foundKey� ��� Z   , g���i�h� =  , /��� o   , -�g�g 0 foundkey foundKey� o   - .�f�f 0 thekey theKey� k   2 c�� ��� r   2 7��� n   2 5��� o   3 5�e�e 0 v  � o   2 3�d�d 0 	founditem 	foundItem� o      �c�c 0 thevalue theValue� ��� Z   8 R���b�� =  8 ;��� o   8 9�a�a 0 previtem prevItem� m   9 :�`
�` 
msng� r   > H��� n   > A��� o   ? A�_�_ 0 nextitem nextItem� o   > ?�^�^ 0 	founditem 	foundItem� n      ��� 4   D G�]�
�] 
cobj� o   E F�\�\ 0 keyindex keyIndex� n  A D��� o   B D�[�[ 0 _buckets  �  f   A B�b  � r   K R��� n   K N��� o   L N�Z�Z 0 nextitem nextItem� o   K L�Y�Y 0 	founditem 	foundItem� n      ��� o   O Q�X�X 0 nextitem nextItem� o   N O�W�W 0 previtem prevItem� ��� r   S `��� \   S Z��� o   S X�V�V 
0 _count  � m   X Y�U�U � o      �T�T 
0 _count  � ��S� l  a c���� L   a c�� o   a b�R�R 0 thevalue theValue�   return the removed value   � ��� 2   r e t u r n   t h e   r e m o v e d   v a l u e�S  �i  �h  � ��� r   h k��� o   h i�Q�Q 0 	founditem 	foundItem� o      �P�P 0 previtem prevItem� ��O� r   l q��� n   l o��� o   m o�N�N 0 nextitem nextItem� o   l m�M�M 0 	founditem 	foundItem� o      �L�L 0 	founditem 	foundItem�O  � >  " %��� o   " #�K�K 0 	founditem 	foundItem� m   # $�J
�J 
msng�m  � �I�
�I conscase� �H�
�H consdiac� �G�
�G conshyph� �F�
�F conspunc� �E�D
�E conswhit�D  � �C�B
�C consnume�B  � ��A� R   x ��@��
�@ .ascrerr ****      � ****� m   ~ �� ���  I t e m   n o t   f o u n d .� �?��
�? 
errn� m   z {�>�>�@� �=��<
�= 
erob� o   | }�;�; 0 thekey theKey�<  �A  y R      �:��
�: .ascrerr ****      � ****� o      �9�9 0 etext eText� �8��
�8 
errn� o      �7�7 0 enumber eNumber� �6��
�6 
erob� o      �5�5 0 efrom eFrom� �4��3
�4 
errt� o      �2�2 
0 eto eTo�3  z I   � ��1��0�1 
0 _error  � ��� m   � ��� ���  r e m o v e I t e m� ��� o   � ��/�/ 0 etext eText� ��� o   � ��.�. 0 enumber eNumber� ��� o   � ��-�- 0 efrom eFrom� ��,� o   � ��+�+ 
0 eto eTo�,  �0  s ��� l     �*�)�(�*  �)  �(  � ��� i  2 5��� I      �'�&�%�'  0 deleteallitems deleteAllItems�&  �%  � k     !�� � � r     
 I     �$�#�$  0 _makeemptylist _makeEmptyList �" m    �!�! �"  �#   n      o    	� �  0 _buckets    f       r    	
	 n     1    �
� 
leng n    o    �� 0 _buckets    f    
 o      �� 	0 _size    r     m    ��   o      �� 
0 _count   � L    !��  �  �  l     ����  �  �    i  6 9 I      ��� 0 getitem getItem � o      �� 0 thekey theKey�  �   Q     Z k    D  !  P    ;"#$" k    :%% &'& r    ()( n    *+* 4    �,
� 
cobj, I    �-�� 0 	_keyindex 	_keyIndex- .�. o    �� 0 thekey theKey�  �  + n   /0/ o   	 �� 0 _buckets  0  f    	) o      �� 0 	founditem 	foundItem' 1�
1 V    :232 k    544 565 Z   /78�	�7 =   #9:9 n    !;<; o    !�� 0 k  < o    �� 0 	founditem 	foundItem: o   ! "�� 0 thekey theKey8 L   & +== n   & *>?> o   ' )�� 0 v  ? o   & '�� 0 	founditem 	foundItem�	  �  6 @�@ r   0 5ABA n   0 3CDC o   1 3�� 0 nextitem nextItemD o   0 1� �  0 	founditem 	foundItemB o      ���� 0 	founditem 	foundItem�  3 >   EFE o    ���� 0 	founditem 	foundItemF m    ��
�� 
msng�
  # ��G
�� conscaseG ��H
�� consdiacH ��I
�� conshyphI ��J
�� conspuncJ ����
�� conswhit��  $ ����
�� consnume��  ! K��K R   < D��LM
�� .ascrerr ****      � ****L m   B CNN �OO  I t e m   n o t   f o u n d .M ��PQ
�� 
errnP m   > ?�����@Q ��R��
�� 
erobR o   @ A���� 0 thekey theKey��  ��   R      ��ST
�� .ascrerr ****      � ****S o      ���� 0 etext eTextT ��UV
�� 
errnU o      ���� 0 enumber eNumberV ��WX
�� 
erobW o      ���� 0 efrom eFromX ��Y��
�� 
errtY o      ���� 
0 eto eTo��   I   L Z��Z���� 
0 _error  Z [\[ m   M P]] �^^  g e t I t e m\ _`_ o   P Q���� 0 etext eText` aba o   Q R���� 0 enumber eNumberb cdc o   R S���� 0 efrom eFromd e��e o   S T���� 
0 eto eTo��  ��   fgf l     ��������  ��  ��  g hih i  : =jkj I      ��l���� 0 containsitem containsIteml m��m o      ���� 0 thekey theKey��  ��  k Q     nopn k    qq rsr I    	��t���� 0 getitem getItemt u��u o    ���� 0 thekey theKey��  ��  s v��v L   
 ww m   
 ��
�� boovtrue��  o R      ����x
�� .ascrerr ****      � ****��  x ��y��
�� 
errny d      zz m      �������  p L    {{ m    ��
�� boovfalsi |}| l     ��������  ��  ��  } ~~ l     ��������  ��  ��   ��� l     ��������  ��  ��  � ��� i  > A��� I      �������� &0 objectdescription objectDescription��  ��  � L     
�� b     	��� b     ��� m     �� ��� 0 � d i c t i o n a r y   c o l l e c t i o n   (� o    ���� 
0 _count  � m    �� ���    i t e m s ) �� ��� l     ��������  ��  ��  � ��� i  B E��� I      �������� 0 
copyobject 
copyObject��  ��  � Q     ����� k    ��� ��� r    
��� I   ������
�� .Obj:Dictnull��� ��� null��  ��  � o      ���� 0 	newobject 	newObject� ��� Z    �������� ?    ��� o    ���� 
0 _count  � m    ����  � k    ��� ��� l   +���� Z   +������� >     ��� n    ��� 1    ��
�� 
leng� n   ��� o    ���� 0 _buckets  �  f    � n    ��� 1    ��
�� 
leng� n   ��� o    ���� 0 _buckets  � o    ���� 0 	newobject 	newObject� R   # '�����
�� .ascrerr ****      � ****� m   % &�� ��� 0 M i s m a t c h e d   b u c k e t   l i s t s .��  ��  ��  � � � sanity check as this copyObject() implementation requires all bucket lists to be same length, and will need revised if growable bucket lists are supported in future   � ���J   s a n i t y   c h e c k   a s   t h i s   c o p y O b j e c t ( )   i m p l e m e n t a t i o n   r e q u i r e s   a l l   b u c k e t   l i s t s   t o   b e   s a m e   l e n g t h ,   a n d   w i l l   n e e d   r e v i s e d   i f   g r o w a b l e   b u c k e t   l i s t s   a r e   s u p p o r t e d   i n   f u t u r e� ���� Y   , ��������� k   ; ��� ��� r   ; C��� n   ; A��� 4   > A���
�� 
cobj� o   ? @���� 0 i  � n  ; >��� o   < >���� 0 _buckets  �  f   ; <� o      ���� 0 	oldbucket 	oldBucket� ���� Z   D �������� >  D G��� o   D E���� 0 	oldbucket 	oldBucket� m   E F��
�� 
msng� l  J ����� k   J ��� ��� r   J X��� K   J V�� ������ 0 k  � n  K N��� o   L N���� 0 k  � o   K L���� 0 	oldbucket 	oldBucket� ������ 0 v  � n  O R��� o   P R���� 0 v  � o   O P���� 0 	oldbucket 	oldBucket� ������� 0 nextitem nextItem� m   S T��
�� 
msng��  � o      ���� 0 	newbucket 	newBucket� ��� r   Y a��� o   Y Z���� 0 	newbucket 	newBucket� n      ��� 4   ] `���
�� 
cobj� o   ^ _���� 0 i  � n  Z ]��� o   [ ]���� 0 _buckets  � o   Z [���� 0 	newobject 	newObject� ���� V   b ���� k   l ��� ��� r   l q��� n   l o��� o   m o���� 0 nextitem nextItem� o   l m���� 0 	oldbucket 	oldBucket� o      ���� 0 	oldbucket 	oldBucket� ��� r   r ���� K   r ~�� ������ 0 k  � n  s v��� o   t v���� 0 k  � o   s t���� 0 	oldbucket 	oldBucket� ������ 0 v  � n  w z��� o   x z���� 0 v  � o   w x���� 0 	oldbucket 	oldBucket� ������� 0 nextitem nextItem� m   { |�
� 
msng��  � o      �~�~ 0 tmp  � � � r   � � o   � ��}�} 0 tmp   n      o   � ��|�| 0 nextitem nextItem o   � ��{�{ 0 	newbucket 	newBucket  �z r   � � o   � ��y�y 0 tmp   o      �x�x 0 	newbucket 	newBucket�z  � >  f k	 n   f i

 o   g i�w�w 0 nextitem nextItem o   f g�v�v 0 	oldbucket 	oldBucket	 m   i j�u
�u 
msng��  � _ Y shallow copy the linked list and add it new newObject's bucket list at the same position   � � �   s h a l l o w   c o p y   t h e   l i n k e d   l i s t   a n d   a d d   i t   n e w   n e w O b j e c t ' s   b u c k e t   l i s t   a t   t h e   s a m e   p o s i t i o n��  ��  ��  �� 0 i  � m   / 0�t�t � n   0 6 1   3 5�s
�s 
leng n  0 3 o   1 3�r�r 0 _buckets    f   0 1��  ��  ��  ��  � �q L   � � o   � ��p�p 0 	newobject 	newObject�q  � R      �o
�o .ascrerr ****      � **** o      �n�n 0 etext eText �m
�m 
errn o      �l�l 0 enumber eNumber �k
�k 
erob o      �j�j 0 efrom eFrom �i�h
�i 
errt o      �g�g 
0 eto eTo�h  � I   � ��f�e�f 
0 _error    m   � � �  c o p y O b j e c t   o   � ��d�d 0 etext eText  !"! o   � ��c�c 0 enumber eNumber" #$# o   � ��b�b 0 efrom eFrom$ %�a% o   � ��`�` 
0 eto eTo�a  �e  � &'& l     �_�^�]�_  �^  �]  ' ()( l     �\�[�Z�\  �[  �Z  ) *+* l     �Y�X�W�Y  �X  �W  + ,-, i  F I./. I      �V0�U�V 0 adddictionary addDictionary0 1�T1 o      �S�S $0 dictionaryobject dictionaryObject�T  �U  / Q    X2342 k   F55 676 Z   C89�R�Q8 ?    
:;: n   <=< I    �P�O�N�P 0 
countitems 
countItems�O  �N  = o    �M�M $0 dictionaryobject dictionaryObject; m    	�L�L  9 k   ?>> ?@? l   #ABCA Z   #DE�K�JD >    FGF n    HIH 1    �I
�I 
lengI n   JKJ o    �H�H 0 _buckets  K  f    G n    LML 1    �G
�G 
lengM n   NON o    �F�F 0 _buckets  O o    �E�E $0 dictionaryobject dictionaryObjectE R    �DP�C
�D .ascrerr ****      � ****P m    QQ �RR 0 M i s m a t c h e d   b u c k e t   l i s t s .�C  �K  �J  B   sanity check, as above   C �SS .   s a n i t y   c h e c k ,   a s   a b o v e@ T�BT P   $?UVWU Y   )>X�AYZ�@X k   89[[ \]\ r   8 @^_^ n   8 >`a` 4   ; >�?b
�? 
cobjb o   < =�>�> 0 i  a n  8 ;cdc o   9 ;�=�= 0 _buckets  d o   8 9�<�< $0 dictionaryobject dictionaryObject_ o      �;�; 0 otherbucket otherBucket] e�:e Z   A9fg�9�8f >  A Dhih o   A B�7�7 0 otherbucket otherBucketi m   B C�6
�6 
msngg l  G5jklj k   G5mm non r   G Opqp n   G Mrsr 4   J M�5t
�5 
cobjt o   K L�4�4 0 i  s n  G Juvu o   H J�3�3 0 _buckets  v  f   G Hq o      �2�2 0 mybucket myBucketo w�1w Z   P5xy�0zx =  P S{|{ o   P Q�/�/ 0 mybucket myBucket| m   Q R�.
�. 
msngy l  V �}~} k   V ��� ��� r   V d��� K   V b�� �-���- 0 k  � n  W Z��� o   X Z�,�, 0 k  � o   W X�+�+ 0 otherbucket otherBucket� �*���* 0 v  � n  [ ^��� o   \ ^�)�) 0 v  � o   [ \�(�( 0 otherbucket otherBucket� �'��&�' 0 nextitem nextItem� m   _ `�%
�% 
msng�&  � o      �$�$ 0 mybucket myBucket� ��� r   e r��� [   e l��� o   e j�#�# 
0 _count  � m   j k�"�" � o      �!�! 
0 _count  � ��� r   s {��� o   s t� �  0 mybucket myBucket� n      ��� 4   w z��
� 
cobj� o   x y�� 0 i  � n  t w��� o   u w�� 0 _buckets  �  f   t u� ��� V   | ���� k   � ��� ��� r   � ���� n   � ���� o   � ��� 0 nextitem nextItem� o   � ��� 0 otherbucket otherBucket� o      �� 0 otherbucket otherBucket� ��� r   � ���� K   � ��� ���� 0 k  � n  � ���� o   � ��� 0 k  � o   � ��� 0 otherbucket otherBucket� ���� 0 v  � n  � ���� o   � ��� 0 v  � o   � ��� 0 otherbucket otherBucket� ���� 0 nextitem nextItem� m   � ��
� 
msng�  � o      �� 0 tmp  � ��� r   � ���� [   � ���� o   � ��� 
0 _count  � m   � ��� � o      �� 
0 _count  � ��� r   � ���� o   � ��� 0 tmp  � n     ��� o   � ��
�
 0 nextitem nextItem� o   � ��	�	 0 mybucket myBucket� ��� r   � ���� o   � ��� 0 tmp  � o      �� 0 mybucket myBucket�  � >  � ���� n   � ���� o   � ��� 0 nextitem nextItem� o   � ��� 0 otherbucket otherBucket� m   � ��
� 
msng�  ~   �by shallow copy    ��� "   & b y   s h a l l o w   c o p y�0  z l  �5���� V   �5��� k   �0�� ��� r   � ���� o   � ��� 0 mybucket myBucket� o      �� 0 tmp  � ��� T   �*�� k   �%�� ��� Z   ����� � =  � ���� n  � ���� o   � ����� 0 k  � o   � ����� 0 tmp  � n  � ���� o   � ����� 0 k  � o   � ����� 0 otherbucket otherBucket� l  � ����� k   � ��� ��� r   � ���� n  � ���� J   � ��� ��� o   � ����� 0 k  � ���� o   � ����� 0 v  ��  � o   � ����� 0 otherbucket otherBucket� n     ��� J   � ��� ��� o   � ����� 0 k  � ���� o   � ����� 0 v  ��  � o   � ����� 0 tmp  � ����  S   � ���  �   replace   � ���    r e p l a c e� ��� =  � ���� n  � ���� o   � ����� 0 nextitem nextItem� o   � ����� 0 tmp  � m   � ���
�� 
msng� ���� l  �   k   �  r   � K   � ��	
�� 0 k  	 n  � � o   � ����� 0 k   o   � ����� 0 otherbucket otherBucket
 ���� 0 v   n   o  ���� 0 v   o   ���� 0 otherbucket otherBucket ������ 0 nextitem nextItem m  ��
�� 
msng��   n      o  
���� 0 nextitem nextItem o  ���� 0 tmp    r   [   o  ���� 
0 _count   m  ����  o      ���� 
0 _count   ��  S  ��     append    �    a p p e n d��  �   � �� r   % n  #  o  !#���� 0 nextitem nextItem  o   !���� 0 tmp   o      ���� 0 tmp  ��  � !��! r  +0"#" n  +.$%$ o  ,.���� 0 nextitem nextItem% o  +,���� 0 otherbucket otherBucket# o      ���� 0 otherbucket otherBucket��  � >  � �&'& o   � ����� 0 otherbucket otherBucket' m   � ���
�� 
msng� 9 3 �by merging into this dictionary's existing bucket   � �(( f   & b y   m e r g i n g   i n t o   t h i s   d i c t i o n a r y ' s   e x i s t i n g   b u c k e t�1  k * $ transfer other dictionary's bucket�   l �)) H   t r a n s f e r   o t h e r   d i c t i o n a r y ' s   b u c k e t &�9  �8  �:  �A 0 i  Y m   , -���� Z n   - 3*+* 1   0 2��
�� 
leng+ n  - 0,-, o   . 0���� 0 _buckets  - o   - .���� $0 dictionaryobject dictionaryObject�@  V ��.
�� conscase. ��/
�� consdiac/ ��0
�� conshyph0 ��1
�� conspunc1 ����
�� conswhit��  W ����
�� consnume��  �B  �R  �Q  7 2��2 L  DF����  ��  3 R      ��34
�� .ascrerr ****      � ****3 o      ���� 0 etext eText4 ��56
�� 
errn5 o      ���� 0 enumber eNumber6 ��78
�� 
erob7 o      ���� 0 efrom eFrom8 ��9��
�� 
errt9 o      ���� 
0 eto eTo��  4 I  NX��:���� 
0 _error  : ;<; m  OP== �>>  a d d D i c t i o n a r y< ?@? o  PQ���� 0 etext eText@ ABA o  QR���� 0 enumber eNumberB CDC o  RS���� 0 efrom eFromD E��E o  ST���� 
0 eto eTo��  ��  - FGF l     ��������  ��  ��  G HIH l     ��������  ��  ��  I JKJ l     ��������  ��  ��  K LML i  J MNON I      ��P���� $0 addkeysandvalues addKeysAndValuesP Q��Q o      ���� 0 keyvaluelist keyValueList��  ��  O l    �RSTR Q     �UVWU k    �XX YZY Z   [\����[ =    ]^] l   _����_ I   ��`a
�� .corecnte****       ****` J    bb c��c o    ���� 0 keyvaluelist keyValueList��  a ��d��
�� 
kocld m    ��
�� 
list��  ��  ��  ^ m    ����  \ R    ��ef
�� .ascrerr ****      � ****e m    gg �hh 6 N o t   a   v a l i d   k e y - v a l u e   l i s t .f ��ij
�� 
errni m    �����\j ��k��
�� 
erobk o    ���� 0 keyvaluelist keyValueList��  ��  ��  Z lml h    %��n�� 0 
listobject 
listObjectn j     ��o�� 
0 _list_  o o     ���� 0 keyvaluelist keyValueListm pqp X   & �r��sr k   8 �tt uvu r   8 =wxw n  8 ;yzy 1   9 ;��
�� 
pcntz o   8 9���� 0 aref aRefx o      ���� 0 keyvalue keyValuev {��{ Q   > �|}~| k   A q ��� Z  A c������� G   A V��� =   A L��� l  A J������ I  A J����
�� .corecnte****       ****� J   A D�� ���� o   A B���� 0 keyvalue keyValue��  � �����
�� 
kocl� m   E F��
�� 
list��  ��  ��  � m   J K����  � >   O T��� n  O R��� 1   P R��
�� 
leng� o   O P���� 0 keyvalue keyValue� m   R S���� � R   Y _�����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m   [ \���\��  ��  ��  � ��~� I   d q�}��|�} 0 additem addItem� ��� n  e i��� 4   f i�{�
�{ 
cobj� m   g h�z�z � o   e f�y�y 0 keyvalue keyValue� ��x� n  i m��� 4   j m�w�
�w 
cobj� m   k l�v�v � o   i j�u�u 0 keyvalue keyValue�x  �|  �~  } R      �t�s�
�t .ascrerr ****      � ****�s  � �r��q
�r 
errn� o      �p�p 0 n  �q  ~ R   y ��o��
�o .ascrerr ****      � ****� m    ��� ��� 6 N o t   a   v a l i d   k e y - v a l u e   p a i r .� �n��
�n 
errn� o   { |�m�m 0 n  � �l��k
�l 
erob� o   } ~�j�j 0 aref aRef�k  ��  �� 0 aref aRefs n  ) ,��� o   * ,�i�i 
0 _list_  � o   ) *�h�h 0 
listobject 
listObjectq ��g� L   � ��f�f  �g  V R      �e��
�e .ascrerr ****      � ****� o      �d�d 0 etext eText� �c��
�c 
errn� o      �b�b 0 enumber eNumber� �a��
�a 
erob� o      �`�` 0 efrom eFrom� �_��^
�_ 
errt� o      �]�] 
0 eto eTo�^  W I   � ��\��[�\ 
0 _error  � ��� m   � ��� ���   a d d K e y s A n d V a l u e s� ��� o   � ��Z�Z 0 etext eText� ��� o   � ��Y�Y 0 enumber eNumber� ��� o   � ��X�X 0 efrom eFrom� ��W� o   � ��V�V 
0 eto eTo�W  �[  S %  list of form {{KEY,VALUE},...}   T ��� >   l i s t   o f   f o r m   { { K E Y , V A L U E } , . . . }M ��� l     �U�T�S�U  �T  �S  � ��� i  N Q��� I      �R�Q�P�R $0 getkeysandvalues getKeysAndValues�Q  �P  � k     P�� ��� h     �O��O 0 
listobject 
listObject� j     �N��N 
0 _list_  � J     �M�M  � ��� X    J��L�� k    E�� ��� r    ��� n   ��� 1    �K
�K 
pcnt� o    �J�J 0 	bucketref 	bucketRef� o      �I�I 0 mybucket myBucket� ��H� V     E��� k   ( @�� ��� l  ( .���� s   ( .��� n  ( +��� o   ) +�G�G 0 k  � o   ( )�F�F 0 mybucket myBucket� o      �E�E 0 k  � , & make sure date keys are always copied   � ��� L   m a k e   s u r e   d a t e   k e y s   a r e   a l w a y s   c o p i e d� ��� r   / :��� J   / 5�� ��� o   / 0�D�D 0 k  � ��C� n  0 3��� o   1 3�B�B 0 v  � o   0 1�A�A 0 mybucket myBucket�C  � n      ���  ;   8 9� n  5 8��� o   6 8�@�@ 
0 _list_  � o   5 6�?�? 0 
listobject 
listObject� ��>� r   ; @��� n  ; >��� o   < >�=�= 0 nextitem nextItem� o   ; <�<�< 0 mybucket myBucket� o      �;�; 0 mybucket myBucket�>  � >  $ '��� o   $ %�:�: 0 mybucket myBucket� m   % &�9
�9 
msng�H  �L 0 	bucketref 	bucketRef� n   ��� o    �8�8 0 _buckets  �  f    � ��7� L   K P�� n  K O��� o   L N�6�6 
0 _list_  � o   K L�5�5 0 
listobject 
listObject�7  � ��� l     �4�3�2�4  �3  �2  �    i  R U I      �1�0�/�1 0 getkeys getKeys�0  �/   k     F  h     �.�. 0 
listobject 
listObject j     �-�- 
0 _list_   J     �,�,   	
	 X    @�+ k    ;  r     n    1    �*
�* 
pcnt o    �)�) 0 	bucketref 	bucketRef o      �(�( 0 mybucket myBucket �' V     ; k   ( 6  l  ( 0 s   ( 0 n  ( +  o   ) +�&�& 0 k    o   ( )�%�% 0 mybucket myBucket n      !"!  ;   . /" n  + .#$# o   , .�$�$ 
0 _list_  $ o   + ,�#�# 0 
listobject 
listObject , & make sure date keys are always copied    �%% L   m a k e   s u r e   d a t e   k e y s   a r e   a l w a y s   c o p i e d &�"& r   1 6'(' n  1 4)*) o   2 4�!�! 0 nextitem nextItem* o   1 2� �  0 mybucket myBucket( o      �� 0 mybucket myBucket�"   >  $ '+,+ o   $ %�� 0 mybucket myBucket, m   % &�
� 
msng�'  �+ 0 	bucketref 	bucketRef n   -.- o    �� 0 _buckets  .  f    
 /�/ L   A F00 n  A E121 o   B D�� 
0 _list_  2 o   A B�� 0 
listobject 
listObject�   343 l     ����  �  �  4 565 i  V Y787 I      ���� 0 	getvalues 	getValues�  �  8 k     F99 :;: h     �<� 0 
listobject 
listObject< j     �=� 
0 _list_  = J     ��  ; >?> X    @@�A@ k    ;BB CDC r    EFE n   GHG 1    �
� 
pcntH o    �� 0 	bucketref 	bucketRefF o      �� 0 mybucket myBucketD I�I V     ;JKJ k   ( 6LL MNM r   ( 0OPO n  ( +QRQ o   ) +�
�
 0 v  R o   ( )�	�	 0 mybucket myBucketP n      STS  ;   . /T n  + .UVU o   , .�� 
0 _list_  V o   + ,�� 0 
listobject 
listObjectN W�W r   1 6XYX n  1 4Z[Z o   2 4�� 0 nextitem nextItem[ o   1 2�� 0 mybucket myBucketY o      �� 0 mybucket myBucket�  K >  $ '\]\ o   $ %�� 0 mybucket myBucket] m   % &�
� 
msng�  � 0 	bucketref 	bucketRefA n   ^_^ o    � �  0 _buckets  _  f    ? `��` L   A Faa n  A Ebcb o   B D���� 
0 _list_  c o   A B���� 0 
listobject 
listObject��  6 d��d l     ��������  ��  ��  ��  ��   � � { key-value collection, analogous to NSMutableDictionary (note: keys must be text, or objects that reliably coerce to text)	    � �ee �   k e y - v a l u e   c o l l e c t i o n ,   a n a l o g o u s   t o   N S M u t a b l e D i c t i o n a r y   ( n o t e :   k e y s   m u s t   b e   t e x t ,   o r   o b j e c t s   t h a t   r e l i a b l y   c o e r c e   t o   t e x t ) 	 � fgf l     ��������  ��  ��  g hih l     ��������  ��  ��  i jkj l     ��lm��  l  -----   m �nn 
 - - - - -k opo l     ��������  ��  ��  p qrq l     ��������  ��  ��  r sts i   uvu I     ������
�� .Obj:Stacnull��� ��� null��  ��  v l    wxyw h     ��z�� "0 stackcollection StackCollectionz k      {{ |}| l     ��������  ��  ��  } ~~ j     ����� 	0 _head  � m     ��
�� 
msng ��� j    ����� 
0 _count  � m    ����  � ��� l     ��������  ��  ��  � ��� i   	��� I      ������� 
0 _error  � ��� o      ���� 0 handlername handlerName� ��� o      ���� 0 etext eText� ��� o      ���� 0 enumber eNumber� ��� o      ���� 0 efrom eFrom� ���� o      ���� 
0 eto eTo��  ��  � n    ��� I    ������� $0 throwmethoderror throwMethodError� ��� m    �� ���  O b j e c t s� ��� m    �� ���  S t a c k C o l l e c t i o n� ��� o    ���� 0 handlername handlerName� ��� o    	���� 0 etext eText� ��� o   	 
���� 0 enumber eNumber� ��� o   
 ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � o     ���� 0 _support  � ��� l     ��������  ��  ��  � ��� i  
 ��� I      �������� 0 
countitems 
countItems��  ��  � L     �� o     ���� 
0 _count  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 additem addItem� ���� o      ���� 0 thevalue theValue��  ��  � k     !�� ��� l     ������  � . ( add a new value to the top of the stack   � ��� P   a d d   a   n e w   v a l u e   t o   t h e   t o p   o f   t h e   s t a c k� ��� r     ��� K     
�� ������ 0 v  � o    ���� 0 thevalue theValue� ������� 0 nextitem nextItem� o    ���� 	0 _head  ��  � o      ���� 	0 _head  � ��� r    ��� [    ��� o    ���� 
0 _count  � m    ���� � o      ���� 
0 _count  � ���� L    !����  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      �������� 0 
removeitem 
removeItem��  ��  � l    R���� Q     R���� k    @�� ��� Z   ������� =   
��� o    ���� 	0 _head  � m    	��
�� 
msng� R    ����
�� .ascrerr ****      � ****� m    �� ���  S t a c k   i s   e m p t y .� �����
�� 
errn� m    �����@��  ��  ��  � ��� r    !��� n    ��� o    ���� 0 v  � o    ���� 	0 _head  � o      ���� 0 thevalue theValue� ��� r   " /��� n   " )��� o   ' )���� 0 nextitem nextItem� o   " '���� 	0 _head  � o      ���� 	0 _head  � ��� r   0 =��� \   0 7��� o   0 5���� 
0 _count  � m   5 6���� � o      ���� 
0 _count  � ���� L   > @�� o   > ?���� 0 thevalue theValue��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   H R������� 
0 _error  �    m   I J �  r e m o v e I t e m  o   J K���� 0 etext eText  o   K L���� 0 enumber eNumber 	 o   L M���� 0 efrom eFrom	 
��
 o   M N���� 
0 eto eTo��  ��  � * $ remove and return the topmost value   � � H   r e m o v e   a n d   r e t u r n   t h e   t o p m o s t   v a l u e�  l     ��������  ��  ��    i    I      ��������  0 deleteallitems deleteAllItems��  ��   k       r      m     ��
�� 
msng o      ���� 	0 _head    r     m    	����   o      ���� 
0 _count   � L    �~�~  �    l     �}�|�{�}  �|  �{    i    !  I      �z�y�x�z 0 getitem getItem�y  �x  ! l    3"#$" Q     3%&'% k    !(( )*) Z   +,�w�v+ =   
-.- o    �u�u 	0 _head  . m    	�t
�t 
msng, R    �s/0
�s .ascrerr ****      � ****/ m    11 �22  S t a c k   i s   e m p t y .0 �r3�q
�r 
errn3 m    �p�p�@�q  �w  �v  * 4�o4 L    !55 n     676 o    �n�n 0 v  7 o    �m�m 	0 _head  �o  & R      �l89
�l .ascrerr ****      � ****8 o      �k�k 0 etext eText9 �j:;
�j 
errn: o      �i�i 0 enumber eNumber; �h<=
�h 
erob< o      �g�g 0 efrom eFrom= �f>�e
�f 
errt> o      �d�d 
0 eto eTo�e  ' I   ) 3�c?�b�c 
0 _error  ? @A@ m   * +BB �CC  g e t I t e mA DED o   + ,�a�a 0 etext eTextE FGF o   , -�`�` 0 enumber eNumberG HIH o   - .�_�_ 0 efrom eFromI J�^J o   . /�]�] 
0 eto eTo�^  �b  # 3 - return the topmost value without removing it   $ �KK Z   r e t u r n   t h e   t o p m o s t   v a l u e   w i t h o u t   r e m o v i n g   i t LML l     �\�[�Z�\  �[  �Z  M NON i   !PQP I      �Y�X�W�Y &0 objectdescription objectDescription�X  �W  Q L     
RR b     	STS b     UVU m     WW �XX & � s t a c k   c o l l e c t i o n   (V o    �V�V 
0 _count  T m    YY �ZZ    i t e m s ) �O [\[ l     �U�T�S�U  �T  �S  \ ]^] i  " %_`_ I      �R�Q�P�R 0 
copyobject 
copyObject�Q  �P  ` k     iaa bcb r     ded I    �O�N�M
�O .Obj:Stacnull��� ��� null�N  �M  e o      �L�L 0 	newobject 	newObjectc fgf Z    fhi�K�Jh ?    jkj o    �I�I 
0 _count  k m    �H�H  i k    bll mnm r    opo o    �G�G 
0 _count  p n     qrq o    �F�F 
0 _count  r o    �E�E 0 	newobject 	newObjectn sts r    *uvu K    (ww �Dxy�D 0 v  x n   $z{z o   " $�C�C 0 v  { o    "�B�B 	0 _head  y �A|�@�A 0 nextitem nextItem| m   % &�?
�? 
msng�@  v o      �>�> 0 newhead newHeadt }~} r   + 0� o   + ,�=�= 0 newhead newHead� n     ��� o   - /�<�< 	0 _head  � o   , -�;�; 0 	newobject 	newObject~ ��� r   1 :��� n  1 8��� o   6 8�:�: 0 nextitem nextItem� o   1 6�9�9 	0 _head  � o      �8�8 0 oldhead oldHead� ��7� V   ; b��� k   C ]�� ��� r   C M��� K   C K�� �6���6 0 v  � n  D G��� o   E G�5�5 0 v  � o   D E�4�4 0 oldhead oldHead� �3��2�3 0 nextitem nextItem� m   H I�1
�1 
msng�2  � o      �0�0 0 tmp  � ��� r   N S��� o   N O�/�/ 0 tmp  � n     ��� o   P R�.�. 0 nextitem nextItem� o   O P�-�- 0 newhead newHead� ��� r   T W��� o   T U�,�, 0 tmp  � o      �+�+ 0 newhead newHead� ��*� r   X ]��� n  X [��� o   Y [�)�) 0 nextitem nextItem� o   X Y�(�( 0 oldhead oldHead� o      �'�' 0 oldhead oldHead�*  � >  ? B��� o   ? @�&�& 0 oldhead oldHead� m   @ A�%
�% 
msng�7  �K  �J  g ��$� L   g i�� o   g h�#�# 0 	newobject 	newObject�$  ^ ��"� l     �!� ��!  �   �  �"  x !  Last-In-First-Out sequence   y ��� 6   L a s t - I n - F i r s t - O u t   s e q u e n c et ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i   ��� I     ���
� .Obj:Queunull��� ��� null�  �  � l    ���� h     ��� "0 queuecollection QueueCollection� k      �� ��� l     ����  �  �  � ��� j     ��� 	0 _back  � m     �
� 
msng� ��� j    ��� 
0 _front  � m    �
� 
msng� ��� j    ��� 
0 _count  � m    ��  � ��� l     ��
�	�  �
  �	  � ��� i  	 ��� I      ���� 
0 _error  � ��� o      �� 0 handlername handlerName� ��� o      �� 0 etext eText� ��� o      �� 0 enumber eNumber� ��� o      �� 0 efrom eFrom� ��� o      �� 
0 eto eTo�  �  � n    ��� I    � ����  $0 throwmethoderror throwMethodError� ��� m    �� ���  O b j e c t s� ��� m    �� ���  Q u e u e C o l l e c t i o n� ��� o    ���� 0 handlername handlerName� ��� o    	���� 0 etext eText� ��� o   	 
���� 0 enumber eNumber� ��� o   
 ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � o     ���� 0 _support  � ��� l     ��������  ��  ��  � ��� i   ��� I      �������� 0 
countitems 
countItems��  ��  � L     �� o     ���� 
0 _count  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 additem addItem� ���� o      ���� 0 thevalue theValue��  ��  � k     S�� ��� l     ������  � / ) add a new value to the back of the queue   � ��� R   a d d   a   n e w   v a l u e   t o   t h e   b a c k   o f   t h e   q u e u e� ��� r     � � K      ���� 0 v   o    ���� 0 thevalue theValue ������ 0 nextitem nextItem m    ��
�� 
msng��    o      ���� 0 nextitem nextItem�  Z  	  ���� >  	 	
	 o   	 ���� 	0 _back  
 m    ��
�� 
msng r     o    ���� 0 nextitem nextItem n       o    ���� 0 nextitem nextItem o    ���� 	0 _back  ��  ��    r   ! ( o   ! "���� 0 nextitem nextItem o      ���� 	0 _back    Z  ) B���� =  ) 0 o   ) .���� 
0 _front   m   . /��
�� 
msng r   3 > o   3 8���� 	0 _back   o      ���� 
0 _front  ��  ��    r   C P [   C J  o   C H���� 
0 _count    m   H I����  o      ���� 
0 _count   !��! L   Q S����  ��  � "#" l     ��������  ��  ��  # $%$ i   &'& I      �������� 0 
removeitem 
removeItem��  ��  ' l    h()*( Q     h+,-+ k    V.. /0/ Z   12����1 =   
343 o    ���� 
0 _front  4 m    	��
�� 
msng2 R    ��56
�� .ascrerr ****      � ****5 m    77 �88  Q u e u e   i s   e m p t y .6 ��9��
�� 
errn9 m    �����@��  ��  ��  0 :;: r    !<=< n    >?> o    ���� 0 v  ? o    ���� 
0 _front  = o      ���� 0 thevalue theValue; @A@ r   " /BCB n   " )DED o   ' )���� 0 nextitem nextItemE o   " '���� 
0 _front  C o      ���� 
0 _front  A FGF Z  0 EHI����H =  0 7JKJ o   0 5���� 
0 _front  K m   5 6��
�� 
msngI r   : ALML m   : ;��
�� 
msngM o      ���� 	0 _back  ��  ��  G NON r   F SPQP \   F MRSR o   F K���� 
0 _count  S m   K L���� Q o      ���� 
0 _count  O T��T L   T VUU o   T U���� 0 thevalue theValue��  , R      ��VW
�� .ascrerr ****      � ****V o      ���� 0 etext eTextW ��XY
�� 
errnX o      ���� 0 enumber eNumberY ��Z[
�� 
erobZ o      ���� 0 efrom eFrom[ ��\��
�� 
errt\ o      ���� 
0 eto eTo��  - I   ^ h��]���� 
0 _error  ] ^_^ m   _ ``` �aa  r e m o v e I t e m_ bcb o   ` a���� 0 etext eTextc ded o   a b���� 0 enumber eNumbere fgf o   b c���� 0 efrom eFromg h��h o   c d���� 
0 eto eTo��  ��  ) < 6 remove and return the value at the front of the queue   * �ii l   r e m o v e   a n d   r e t u r n   t h e   v a l u e   a t   t h e   f r o n t   o f   t h e   q u e u e% jkj l     ��������  ��  ��  k lml i   non I      ��������  0 deleteallitems deleteAllItems��  ��  o k     pp qrq r     sts m     ��
�� 
msngt o      ���� 	0 _back  r uvu r    wxw m    	��
�� 
msngx o      ���� 
0 _front  v yzy r    {|{ m    ����  | o      ���� 
0 _count  z }��} L    ����  ��  m ~~ l     ��������  ��  ��   ��� i    ��� I      �������� 0 getitem getItem��  ��  � l    3���� Q     3���� k    !�� ��� Z   ������� =   
��� o    ���� 
0 _front  � m    	��
�� 
msng� R    ����
�� .ascrerr ****      � ****� m    �� ���  Q u e u e   i s   e m p t y .� �����
�� 
errn� m    �����@��  ��  ��  � ���� L    !�� n     ��� o    ���� 0 v  � o    ���� 
0 _front  ��  � R      ����
�� .ascrerr ****      � ****� o      �� 0 etext eText� �~��
�~ 
errn� o      �}�} 0 enumber eNumber� �|��
�| 
erob� o      �{�{ 0 efrom eFrom� �z��y
�z 
errt� o      �x�x 
0 eto eTo�y  � I   ) 3�w��v�w 
0 _error  � ��� m   * +�� ���  g e t I t e m� ��� o   + ,�u�u 0 etext eText� ��� o   , -�t�t 0 enumber eNumber� ��� o   - .�s�s 0 efrom eFrom� ��r� o   . /�q�q 
0 eto eTo�r  �v  � E ? return the value at the front of the queue without removing it   � ��� ~   r e t u r n   t h e   v a l u e   a t   t h e   f r o n t   o f   t h e   q u e u e   w i t h o u t   r e m o v i n g   i t� ��� l     �p�o�n�p  �o  �n  � ��� i  ! $��� I      �m�l�k�m &0 objectdescription objectDescription�l  �k  � L     
�� b     	��� b     ��� m     �� ��� & � q u e u e   c o l l e c t i o n   (� o    �j�j 
0 _count  � m    �� ���    i t e m s ) �� ��� l     �i�h�g�i  �h  �g  � ��� i  % (��� I      �f�e�d�f 0 
copyobject 
copyObject�e  �d  � k     o�� ��� r     ��� I    �c�b�a
�c .Obj:Queunull��� ��� null�b  �a  � o      �`�` 0 	newobject 	newObject� ��� Z    l���_�^� ?    ��� o    �]�] 
0 _count  � m    �\�\  � k    h�� ��� r    ��� o    �[�[ 
0 _count  � n     ��� o    �Z�Z 
0 _count  � o    �Y�Y 0 	newobject 	newObject� ��� r    *��� K    (�� �X���X 0 v  � n   $��� o   " $�W�W 0 v  � o    "�V�V 
0 _front  � �U��T�U 0 nextitem nextItem� m   % &�S
�S 
msng�T  � o      �R�R 0 newfront newFront� ��� r   + 0��� o   + ,�Q�Q 0 newfront newFront� n     ��� o   - /�P�P 
0 _front  � o   , -�O�O 0 	newobject 	newObject� ��� r   1 :��� n  1 8��� o   6 8�N�N 0 nextitem nextItem� o   1 6�M�M 
0 _front  � o      �L�L 0 oldfront oldFront� ��� V   ; b��� k   C ]�� ��� r   C M��� K   C K�� �K���K 0 v  � n  D G��� o   E G�J�J 0 v  � o   D E�I�I 0 oldfront oldFront� �H��G�H 0 nextitem nextItem� m   H I�F
�F 
msng�G  � o      �E�E 0 tmp  � ��� r   N S��� o   N O�D�D 0 tmp  � n     ��� o   P R�C�C 0 nextitem nextItem� o   O P�B�B 0 newfront newFront� 	 		  r   T W			 o   T U�A�A 0 tmp  	 o      �@�@ 0 newfront newFront	 	�?	 r   X ]			 n  X [			 o   Y [�>�> 0 nextitem nextItem	 o   X Y�=�= 0 oldfront oldFront	 o      �<�< 0 oldfront oldFront�?  � >  ? B			
		 o   ? @�;�; 0 oldfront oldFront	
 m   @ A�:
�: 
msng� 	�9	 r   c h			 o   c d�8�8 0 newfront newFront	 n     			 o   e g�7�7 	0 _back  	 o   d e�6�6 0 	newobject 	newObject�9  �_  �^  � 	�5	 L   m o		 o   m n�4�4 0 	newobject 	newObject�5  � 	�3	 l     �2�1�0�2  �1  �0  �3  � "  First-In-First-Out sequence   � �		 8   F i r s t - I n - F i r s t - O u t   s e q u e n c e� 			 l     �/�.�-�/  �.  �-  	 			 l     �,�+�*�,  �+  �*  	 			 l     �)		�)  	 J D--------------------------------------------------------------------   	 �		 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	 			 l     �(		 �(  	   Timing/Profiling   	  �	!	! "   T i m i n g / P r o f i l i n g	 	"	#	" l     �'�&�%�'  �&  �%  	# 	$	%	$ l     �$�#�"�$  �#  �"  	% 	&	'	& i   	(	)	( I     �!� 	*
�! .Obj:Timenull��� ��� null�   	* �	+�
� 
Name	+ |��	,�	-�  �  	, o      �� 0 nametext nameText�  	- l     	.��	. m      	/	/ �	0	0  �  �  �  	) k     	1	1 	2	3	2 r     	4	5	4 n    	6	7	6 I    �	8�� "0 astextparameter asTextParameter	8 	9	:	9 o    �� 0 nametext nameText	: 	;�	; m    	<	< �	=	=  �  �  	7 o     �� 0 _support  	5 o      �� 0 nametext nameText	3 	>�	> h    �	?� 0 timerobject TimerObject	? k      	@	@ 	A	B	A l     ����  �  �  	B 	C	D	C x     �	E��  	E 4    �
	F
�
 
frmk	F m    	G	G �	H	H  F o u n d a t i o n�  	D 	I	J	I l     	K	L	M	K j    �		N�	 0 
_starttime 
_startTime	N m    �
� 
msng	L � � because AS can't serialize ASOC objects when saving or autosaving scripts, this object stores start and end times as NSTimeInterval - i.e. AS real - rather than NSDate instances.   	M �	O	Of   b e c a u s e   A S   c a n ' t   s e r i a l i z e   A S O C   o b j e c t s   w h e n   s a v i n g   o r   a u t o s a v i n g   s c r i p t s ,   t h i s   o b j e c t   s t o r e s   s t a r t   a n d   e n d   t i m e s   a s   N S T i m e I n t e r v a l   -   i . e .   A S   r e a l   -   r a t h e r   t h a n   N S D a t e   i n s t a n c e s .	J 	P	Q	P j    �	R� 0 _totalseconds _totalSeconds	R m    	S	S         	Q 	T	U	T j    �	V� 0 
_isrunning 
_isRunning	V m    �
� boovfals	U 	W	X	W l     ����  �  �  	X 	Y	Z	Y i   	[	\	[ I      �� ��� 0 	timername 	timerName�   ��  	\ L     	]	] o     ���� 0 nametext nameText	Z 	^	_	^ l     ��������  ��  ��  	_ 	`	a	` i   	b	c	b I      �������� 0 
starttimer 
startTimer��  ��  	c k     '	d	d 	e	f	e Z    	g	h����	g o     ���� 0 
_isrunning 
_isRunning	h L    
����  ��  ��  	f 	i	j	i r    	k	l	k m    ��
�� boovtrue	l o      ���� 0 
_isrunning 
_isRunning	j 	m	n	m l   ��������  ��  ��  	n 	o	p	o r    $	q	r	q n   	s	t	s I    �������� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate��  ��  	t n   	u	v	u o    ���� 0 nsdate NSDate	v m    ��
�� misccura	r o      ���� 0 
_starttime 
_startTime	p 	w��	w L   % '	x	x  f   % &��  	a 	y	z	y l     ��������  ��  ��  	z 	{	|	{ i   	}	~	} I      �������� 0 	stoptimer 	stopTimer��  ��  	~ k     8		 	�	�	� Z    	�	�����	� H     	�	� o     ���� 0 
_isrunning 
_isRunning	� L   	 	�	� m   	 
����  ��  ��  	� 	�	�	� r    	�	�	� \    	�	�	� l   	�����	� n   	�	�	� I    �������� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate��  ��  	� n   	�	�	� o    ���� 0 nsdate NSDate	� m    ��
�� misccura��  ��  	� o    ���� 0 
_starttime 
_startTime	� o      ���� 0 elapsedtime elapsedTime	� 	�	�	� r     -	�	�	� [     '	�	�	� o     %���� 0 _totalseconds _totalSeconds	� o   % &���� 0 elapsedtime elapsedTime	� o      ���� 0 _totalseconds _totalSeconds	� 	�	�	� r   . 5	�	�	� m   . /��
�� boovfals	� o      ���� 0 
_isrunning 
_isRunning	� 	���	� L   6 8	�	� o   6 7���� 0 elapsedtime elapsedTime��  	| 	�	�	� l     ��������  ��  ��  	� 	�	�	� i    #	�	�	� I      �������� 0 elapsedtime elapsedTime��  ��  	� Z     	�	���	�	� o     ���� 0 
_isrunning 
_isRunning	� L    	�	� \    	�	�	� l   	�����	� n   	�	�	� I   	 �������� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate��  ��  	� o    	���� 0 nsdate NSDate��  ��  	� o    ���� 0 
_starttime 
_startTime��  	� L    	�	� m    ����  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  $ '	�	�	� I      �������� 0 	totaltime 	totalTime��  ��  	� Z     	�	���	�	� o     ���� 0 
_isrunning 
_isRunning	� L    	�	� [    	�	�	� o    ���� 0 _totalseconds _totalSeconds	� I    �������� 0 elapsedtime elapsedTime��  ��  ��  	� L    	�	� o    ���� 0 _totalseconds _totalSeconds	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  ( +	�	�	� I      �������� &0 objectdescription objectDescription��  ��  	� k     F	�	� 	�	�	� Z     !	�	���	�	� o     ���� 0 
_isrunning 
_isRunning	� r    	�	�	� b    	�	�	� b    	�	�	� m    		�	� �	�	�  e l a p s e d   t i m e :  	� I   	 �������� 0 elapsedtime elapsedTime��  ��  	� m    	�	� �	�	�  s	� o      ���� 0 infotext infoText��  	� r    !	�	�	� b    	�	�	� b    	�	�	� m    	�	� �	�	�  t o t a l   t i m e :  	� I    �������� 0 	totaltime 	totalTime��  ��  	� m    	�	� �	�	�  s	� o      ���� 0 infotext infoText	� 	�	�	� Z  " ?	�	�����	� >   " +	�	�	� n  " )	�	�	� 1   ' )��
�� 
leng	� o   " '���� 0 nametext nameText	� m   ) *����  	� r   . ;	�	�	� b   . 9	�	�	� b   . 7	�	�	� b   . 5	�	�	� m   . /	�	� �	�	�  	� o   / 4���� 0 nametext nameText	� m   5 6	�	� �	�	�    	� o   7 8���� 0 infotext infoText	� o      ���� 0 infotext infoText��  ��  	� 	���	� L   @ F	�	� b   @ E	�	�	� b   @ C	�	�	� m   @ A	�	� �	�	�  � t i m e r   o b j e c t   (	� o   A B���� 0 infotext infoText	� m   C D	�	� �	�	�  ) ���  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  , /	�	�	� I      �������� 0 
copyobject 
copyObject��  ��  	� k     .
 
  


 r     


 I    ����

�� .Obj:Timenull��� ��� null��  
 ��
��
�� 
Name
 o    ���� 0 nametext nameText��  
 o      ���� 0 	newobject 	newObject
 


 r    
	


	 o    ���� 0 
_starttime 
_startTime

 n     


 o    ���� 0 
_starttime 
_startTime
 o    ���� 0 	newobject 	newObject
 


 r    !


 o    ���� 0 _totalseconds _totalSeconds
 n     


 o     ���� 0 _totalseconds _totalSeconds
 o    ���� 0 	newobject 	newObject
 


 r   " +


 o   " '���� 0 
_isrunning 
_isRunning
 n     


 o   ( *���� 0 
_isrunning 
_isRunning
 o   ' (�� 0 	newobject 	newObject
 
�~
 L   , .

 o   , -�}�} 0 	newobject 	newObject�~  	� 
�|
 l     �{�z�y�{  �z  �y  �|  �  	' 


 l     �x�w�v�x  �w  �v  
 


 l     �u�t�s�u  �t  �s  
 
 �r
  l     �q�p�o�q  �p  �o  �r       	�n
!
"
#
$
%
&
'
(�n  
! �m�l�k�j�i�h�g�m 0 _support  �l 
0 _error  �k  0 _makeemptylist _makeEmptyList
�j .Obj:Dictnull��� ��� null
�i .Obj:Stacnull��� ��� null
�h .Obj:Queunull��� ��� null
�g .Obj:Timenull��� ��� null
" 
)
)   �f "
�f 
scpt
# �e *�d�c
*
+�b�e 
0 _error  �d �a
,�a 
,  �`�_�^�]�\�` 0 handlername handlerName�_ 0 etext eText�^ 0 enumber eNumber�] 0 efrom eFrom�\ 
0 eto eTo�c  
* �[�Z�Y�X�W�[ 0 handlername handlerName�Z 0 etext eText�Y 0 enumber eNumber�X 0 efrom eFrom�W 
0 eto eTo
+  :�V�U�V �U &0 throwcommanderror throwCommandError�b b   ࠡ����+ 
$ �T X�S�R
-
.�Q�T  0 _makeemptylist _makeEmptyList�S �P
/�P 
/  �O�O 0 n  �R  
- �N�M�N 0 n  �M 0 l  
. �L
�L 
msng�Q "�kvE�O h�k��%E�O�l"E�[OY��O�
% �K ��J�I
0
1�H
�K .Obj:Dictnull��� ��� null�J  �I  
0 �G�G ,0 dictionarycollection DictionaryCollection
1 �F �
2�F ,0 dictionarycollection DictionaryCollection
2 �E
3�D�C
4
5�B
�E .ascrinit****      � ****
3 k     Y
6
6  �
7
7  �
8
8  �
9
9  �
:
:  �
;
;  �
<
< �
=
= �
>
> r
?
? �
@
@ 
A
A h
B
B �
C
C �
D
D ,
E
E L
F
F �
G
G  
H
H 5�A�A  �D  �C  
4 �@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.
�@ 
pimr�? 0 _buckets  �> 	0 _size  �= 
0 _count  �< 
0 _error  �; 0 	_keyindex 	_keyIndex�: 0 
countitems 
countItems�9 0 additem addItem�8 0 
removeitem 
removeItem�7  0 deleteallitems deleteAllItems�6 0 getitem getItem�5 0 containsitem containsItem�4 &0 objectdescription objectDescription�3 0 
copyobject 
copyObject�2 0 adddictionary addDictionary�1 $0 addkeysandvalues addKeysAndValues�0 $0 getkeysandvalues getKeysAndValues�/ 0 getkeys getKeys�. 0 	getvalues 	getValues
5 �-�, ��+�*�)�(�'�&
I
J
K
L
M
N
O
P
Q
R
S
T
U
V
W
�- 
cobj
�, 
frmk�+ �*  0 _makeemptylist _makeEmptyList�) 0 _buckets  
�( 
leng�' 	0 _size  �& 
0 _count  
I �% ��$�#
X
Y�"�% 
0 _error  �$ �!
Z�! 
Z  � �����  0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�#  
X ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo
Y  � ���� � $0 throwmethoderror throwMethodError�" b   �ᠡ����+ 
J � ���
[
\�� 0 	_keyindex 	_keyIndex� �
]� 
]  �� 0 thekey theKey�  
[ ���� 0 thekey theKey� 0 hashnum hashNum� 0 divnum divNum
\ ��
�	��������� ����������������r����������
� 
kocl
�
 
obj 
�	 .corecnte****       ****
� 
reco
� 
bool
� 
scpt
� 
errn��Y
� 
erob� 
� 
type
�  
pcls
�� 
enum�� 0 
asnsobject 
asNSObject�� 0 typecodevalue typeCodeValue
�� 
ctxt�� ,0 asnormalizednsstring asNormalizedNSString�� 0 hash  
�� 
long
�� 
doub��  J�
�� 
ldt �� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�� �9�kv��l j
 �kv��l j�&
 �kv��l j�& )�����Y hO���mv��,kv b   �k+ j+ E�Y Ӡ�,a   b   �a &k+ j+ E�Y �a a lv��,kv C�E�O�k#E�O�j �k�!E�Y hO�j 	�'E�Y hO�a  �a  E�Y hY L��,a   8b   �k+ j+ E�O�j 	�'E�Y hO�a  �a  E�Y hY )����a O�a  �a "E�Y hO�b  #k
K �������
^
_���� 0 
countitems 
countItems��  ��  
^  
_  �� b  
L �������
`
a���� 0 additem addItem�� ��
b�� 
b  ������ 0 thekey theKey�� 0 thevalue theValue��  
` 	�������������������� 0 thekey theKey�� 0 thevalue theValue�� 0 keyindex keyIndex�� 0 	founditem 	foundItem�� 0 oldvalue oldValue�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo
a ������������������
cg������ 0 	_keyindex 	_keyIndex�� 0 _buckets  
�� 
cobj
�� 
msng�� 0 k  �� 0 v  �� 0 nextitem nextItem�� �� 0 etext eText
c ����
d
�� 
errn�� 0 enumber eNumber
d ����
e
�� 
erob�� 0 efrom eFrom
e ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �*�k+  E�O�EQ�O)�,�/E�O��  %�����)�,�/FOb  kEc  OhY hO�� i ehZ��,�  %��,E�O��lvE[�k/��,FZ[�l/��,FZOhY hO��,�  "�������,FOb  kEc  OhY hO��,E�[OY��VW X 
 *쥦���+ 
M ��u����
f
g���� 0 
removeitem 
removeItem�� ��
h�� 
h  ���� 0 thekey theKey��  
f 
���������������������� 0 thekey theKey�� 0 keyindex keyIndex�� 0 	founditem 	foundItem�� 0 previtem prevItem�� 0 foundkey foundKey�� 0 thevalue theValue�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo
g ���������������������������
i������� 0 	_keyindex 	_keyIndex�� 0 _buckets  
�� 
cobj
�� 
msng�� 0 k  �� 0 v  �� 0 nextitem nextItem
�� 
errn���@
�� 
erob�� �� 0 etext eText
i ����
j
�� 
errn�� 0 enumber eNumber
j ����
k
�� 
erob�� 0 efrom eFrom
k ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �*�k+  E�O)�,�/E�O�� _�E�O Wh����,E�O��  6��,E�O��  ��,)�,�/FY 	��,��,FOb  kEc  O�Y hO�E�O��,E�[OY��VO)�����W X  *a ����a + 
N �������
l
m����  0 deleteallitems deleteAllItems��  ��  
l  
m ���������� ��  0 _makeemptylist _makeEmptyList�� 0 _buckets  
�� 
leng�� "*�k+ )�,FO)�,�,Ec  OjEc  Oh
O ������
n
o���� 0 getitem getItem�� ��
p�� 
p  ���� 0 thekey theKey��  
n �������������� 0 thekey theKey�� 0 	founditem 	foundItem�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo
o #$����������������������N��
q]������ 0 _buckets  
�� 
cobj�� 0 	_keyindex 	_keyIndex
�� 
msng�� 0 k  �� 0 v  �� 0 nextitem nextItem
�� 
errn���@
�� 
erob�� �� 0 etext eText
q ����
r
�� 
errn�� 0 enumber eNumber
r ����
s
�� 
erob�� 0 efrom eFrom
s ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� [ F�� 5)�,�*�k+ /E�O #h����,�  
��,EY hO��,E�[OY��VO)�����W X  *a ����a + 
P �k�~�}
t
u�|� 0 containsitem containsItem�~ �{
v�{ 
v  �z�z 0 thekey theKey�}  
t �y�y 0 thekey theKey
u �x�w
w�x 0 getitem getItem�w  
w �v�u�t
�v 
errn�u�@�t  �|  *�k+  OeW 	X  f
Q �s��r�q
x
y�p�s &0 objectdescription objectDescription�r  �q  
x  
y ���p �b  %�%
R �o��n�m
z
{�l�o 0 
copyobject 
copyObject�n  �m  
z 	�k�j�i�h�g�f�e�d�c�k 0 	newobject 	newObject�j 0 i  �i 0 	oldbucket 	oldBucket�h 0 	newbucket 	newBucket�g 0 tmp  �f 0 etext eText�e 0 enumber eNumber�d 0 efrom eFrom�c 
0 eto eTo
{ �b�a�`��_�^�]�\�[�Z�Y
|�X�W
�b .Obj:Dictnull��� ��� null�a 0 _buckets  
�` 
leng
�_ 
cobj
�^ 
msng�] 0 k  �\ 0 v  �[ 0 nextitem nextItem�Z �Y 0 etext eText
| �V�U
}
�V 
errn�U 0 enumber eNumber
} �T�S
~
�T 
erob�S 0 efrom eFrom
~ �R�Q�P
�R 
errt�Q 
0 eto eTo�P  �X �W 
0 _error  �l � �*j  E�Ob  j �)�,�,��,�, 	)j�Y hO kk)�,�,Ekh )�,�/E�O�� J��,��,���E�O���,�/FO ,h��,���,E�O��,��,���E�O���,FO�E�[OY��Y h[OY��Y hO�W X 
 *쥦���+ 
S �O/�N�M

��L�O 0 adddictionary addDictionary�N �K
��K 
�  �J�J $0 dictionaryobject dictionaryObject�M  
 	�I�H�G�F�E�D�C�B�A�I $0 dictionaryobject dictionaryObject�H 0 i  �G 0 otherbucket otherBucket�F 0 mybucket myBucket�E 0 tmp  �D 0 etext eText�C 0 enumber eNumber�B 0 efrom eFrom�A 
0 eto eTo
� �@�?�>QVW�=�<�;�:�9�8�7
�=�6�5�@ 0 
countitems 
countItems�? 0 _buckets  
�> 
leng
�= 
cobj
�< 
msng�; 0 k  �: 0 v  �9 0 nextitem nextItem�8 �7 0 etext eText
� �4�3
�
�4 
errn�3 0 enumber eNumber
� �2�1
�
�2 
erob�1 0 efrom eFrom
� �0�/�.
�0 
errt�/ 
0 eto eTo�.  �6 �5 
0 _error  �LYH�j+  j7)�,�,��,�, 	)j�Y hO��k��,�,Ekh ��,�/E�O�� �)�,�/E�O��  f��,��,���E�Ob  kEc  O�)�,�/FO :h��,���,E�O��,��,���E�Ob  kEc  O���,FO�E�[OY��Y } zh���E�O chZ��,��,   �[�,\[�,\Zlv�[�,\[�,\ZlvFOY .��,�  %��,��,�����,FOb  kEc  OY hO��,E�[OY��O��,E�[OY��Y h[OY��VY hOhW X  *���+ 
T �-O�,�+
�
��*�- $0 addkeysandvalues addKeysAndValues�, �)
��) 
�  �(�( 0 keyvaluelist keyValueList�+  
� 	�'�&�%�$�#�"�!� ��' 0 keyvaluelist keyValueList�& 0 
listobject 
listObject�% 0 aref aRef�$ 0 keyvalue keyValue�# 0 n  �" 0 etext eText�! 0 enumber eNumber�  0 efrom eFrom� 
0 eto eTo
� �������g�n
��������
���
����
� 
kocl
� 
list
� .corecnte****       ****
� 
errn��\
� 
erob� � 0 
listobject 
listObject
� �
���

�
��	
� .ascrinit****      � ****
� k     
�
� n��  �  �
  
� �� 
0 _list_  
� �� 
0 _list_  �	 b   �� 
0 _list_  
� 
cobj
� 
pcnt
� 
leng
� 
bool� 0 additem addItem�  
� ���
� 
errn� 0 n  �  � 0 etext eText
� ��
�
� 
errn� 0 enumber eNumber
� � ��
�
�  
erob�� 0 efrom eFrom
� ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �* � ��kv��l j  )�����Y hO��K 
S�O a��,[��l kh ��,E�O 5�kv��l j 
 	��,l�& )��lhY hO*��k/��l/l+ W X  )���a [OY��OhW X  *a ����a + 
U �������
�
����� $0 getkeysandvalues getKeysAndValues��  ��  
� ���������� 0 
listobject 
listObject�� 0 	bucketref 	bucketRef�� 0 mybucket myBucket�� 0 k  
� ���
����������������������� 0 
listobject 
listObject
� ��
�����
�
���
�� .ascrinit****      � ****
� k     
�
� �����  ��  ��  
� ���� 
0 _list_  
� ���� 
0 _list_  �� jv��� 0 _buckets  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
msng�� 0 k  �� 0 v  �� 
0 _list_  �� 0 nextitem nextItem�� Q��K S�O A)�,[��l kh ��,E�O $h����,EQ�O���,lv��,6FO��,E�[OY��[OY��O��,E
V ������
�
����� 0 getkeys getKeys��  ��  
� �������� 0 
listobject 
listObject�� 0 	bucketref 	bucketRef�� 0 mybucket myBucket
� ��
��������������������� 0 
listobject 
listObject
� ��
�����
�
���
�� .ascrinit****      � ****
� k     
�
� ����  ��  ��  
� ���� 
0 _list_  
� ���� 
0 _list_  �� jv��� 0 _buckets  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
msng�� 0 k  �� 
0 _list_  �� 0 nextitem nextItem�� G��K S�O 7)�,[��l kh ��,E�O h����,��,6GO��,E�[OY��[OY��O��,E
W ��8����
�
����� 0 	getvalues 	getValues��  ��  
� �������� 0 
listobject 
listObject�� 0 	bucketref 	bucketRef�� 0 mybucket myBucket
� ��<
��������������������� 0 
listobject 
listObject
� ��
�����
�
���
�� .ascrinit****      � ****
� k     
�
� <����  ��  ��  
� ���� 
0 _list_  
� ���� 
0 _list_  �� jv��� 0 _buckets  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
msng�� 0 v  �� 
0 _list_  �� 0 nextitem nextItem�� G��K S�O 7)�,[��l kh ��,E�O h����,��,6FO��,E�[OY��[OY��O��,E�B Z�*��/lkv�*�k+ �O)�,�,E�Oj�OL 	OL 
OL OL OL OL OL OL OL OL OL OL OL OL OL �H ��K S�
& ��v����
�
���
�� .Obj:Stacnull��� ��� null��  ��  
� ���� "0 stackcollection StackCollection
� ��z
��� "0 stackcollection StackCollection
� ��
�����
�
���
�� .ascrinit****      � ****
� k     %
�
� ~
�
� �
�
� �
�
� �
�
� �
�
� �
�
� 
�
� 
�
� N
�
� ]����  ��  ��  
� 
���������������������� 	0 _head  �� 
0 _count  �� 
0 _error  �� 0 
countitems 
countItems�� 0 additem addItem�� 0 
removeitem 
removeItem��  0 deleteallitems deleteAllItems�� 0 getitem getItem�� &0 objectdescription objectDescription�� 0 
copyobject 
copyObject
� ������
�
�
�
�
�
�
�
�
�� 
msng�� 	0 _head  �� 
0 _count  
� �������
�
����� 
0 _error  �� ��
��� 
�  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  
� ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo
� �������� �� $0 throwmethoderror throwMethodError�� b   �ᠡ����+ 
� �������
�
����� 0 
countitems 
countItems��  ��  
�  
�  �� b  
� �������
�
����� 0 additem addItem�� ��
��� 
�  �� 0 thevalue theValue��  
� �~�~ 0 thevalue theValue
� �}�|�{�} 0 v  �| 0 nextitem nextItem�{ �� "��b   �Ec   Ob  kEc  Oh
� �z��y�x
�
��w�z 0 
removeitem 
removeItem�y  �x  
� �v�u�t�s�r�v 0 thevalue theValue�u 0 etext eText�t 0 enumber eNumber�s 0 efrom eFrom�r 
0 eto eTo
� �q�p�o��n�m�l
��k�j
�q 
msng
�p 
errn�o�@�n 0 v  �m 0 nextitem nextItem�l 0 etext eText
� �i�h
�
�i 
errn�h 0 enumber eNumber
� �g�f
�
�g 
erob�f 0 efrom eFrom
� �e�d�c
�e 
errt�d 
0 eto eTo�c  �k �j 
0 _error  �w S Bb   �  )��l�Y hOb   �,E�Ob   �,Ec   Ob  kEc  O�W X  *衢���+ 

� �b�a�`
�
��_�b  0 deleteallitems deleteAllItems�a  �`  
�  
� �^
�^ 
msng�_ �Ec   OjEc  Oh
� �]!�\�[
�
��Z�] 0 getitem getItem�\  �[  
� �Y�X�W�V�Y 0 etext eText�X 0 enumber eNumber�W 0 efrom eFrom�V 
0 eto eTo
� 
�U�T�S1�R�Q
�B�P�O
�U 
msng
�T 
errn�S�@�R 0 v  �Q 0 etext eText
� �N�M
�
�N 
errn�M 0 enumber eNumber
� �L�K
�
�L 
erob�K 0 efrom eFrom
� �J�I�H
�J 
errt�I 
0 eto eTo�H  �P �O 
0 _error  �Z 4 #b   �  )��l�Y hOb   �,EW X  *砡���+ 	
� �GQ�F�E
�
��D�G &0 objectdescription objectDescription�F  �E  
�  
� WY�D �b  %�%
� �C`�B�A
�
��@�C 0 
copyobject 
copyObject�B  �A  
� �?�>�=�<�? 0 	newobject 	newObject�> 0 newhead newHead�= 0 oldhead oldHead�< 0 tmp  
� �;�:�9�8�7�6�5
�; .Obj:Stacnull��� ��� null�: 
0 _count  �9 0 v  �8 0 nextitem nextItem
�7 
msng�6 �5 	0 _head  �@ j*j  E�Ob  j Ub  ��,FO�b   �,���E�O���,FOb   �,E�O &h����,���E�O���,FO�E�O��,E�[OY��Y hO��� &�Oj�OL OL OL OL OL OL OL 	OL 
�� ��K S�
' �4��3�2
�
��1
�4 .Obj:Queunull��� ��� null�3  �2  
� �0�0 "0 queuecollection QueueCollection
� �/�
��/ "0 queuecollection QueueCollection
� �.
��-�,
�
��+
�. .ascrinit****      � ****
� k     (
�
� �
�
� �
�
� �
�
� �
�
� �
�
� �
�
� $
�
� l
�
� �
�
� �
�
� ��*�*  �-  �,  
� �)�(�'�&�%�$�#�"�!� ��) 	0 _back  �( 
0 _front  �' 
0 _count  �& 
0 _error  �% 0 
countitems 
countItems�$ 0 additem addItem�# 0 
removeitem 
removeItem�"  0 deleteallitems deleteAllItems�! 0 getitem getItem�  &0 objectdescription objectDescription� 0 
copyobject 
copyObject
� ����
�
�
�
�
�
�
�
�
� 
msng� 	0 _back  � 
0 _front  � 
0 _count  
� ����
�
��� 
0 _error  � �
�� 
�  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  
� ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo
� ����
� �
 $0 throwmethoderror throwMethodError� b   �ᠡ����+ 
� �	���
�
���	 0 
countitems 
countItems�  �  
�  
�  � b  
� ����
�
��� 0 additem addItem� �
�� 
�  � �  0 thevalue theValue�  
� ������ 0 thevalue theValue�� 0 nextitem nextItem
� ���������� 0 v  �� 0 nextitem nextItem
�� 
msng�� � T����E�Ob   � �b   �,FY hO�Ec   Ob  �  b   Ec  Y hOb  kEc  Oh
� ��'����
�
����� 0 
removeitem 
removeItem��  ��  
� ������������ 0 thevalue theValue�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo
� ������7������
�`����
�� 
msng
�� 
errn���@�� 0 v  �� 0 nextitem nextItem�� 0 etext eText
� ����
�
�� 
errn�� 0 enumber eNumber
� ����
�
�� 
erob�� 0 efrom eFrom
� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� i Xb  �  )��l�Y hOb  �,E�Ob  �,Ec  Ob  �  �Ec   Y hOb  kEc  O�W X  *衢���+ 

� ��o����
�
�����  0 deleteallitems deleteAllItems��  ��  
�  
� ��
�� 
msng�� �Ec   O�Ec  OjEc  Oh
� �������
�
����� 0 getitem getItem��  ��  
� ���������� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo
� 
����������� �����
�� 
msng
�� 
errn���@�� 0 v  �� 0 etext eText  ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� 4 #b  �  )��l�Y hOb  �,EW X  *砡���+ 	
� ����������� &0 objectdescription objectDescription��  ��     ���� �b  %�%
� ����������� 0 
copyobject 
copyObject��  ��   ���������� 0 	newobject 	newObject�� 0 newfront newFront�� 0 oldfront oldFront�� 0 tmp   ����������������
�� .Obj:Queunull��� ��� null�� 
0 _count  �� 0 v  �� 0 nextitem nextItem
�� 
msng�� �� 
0 _front  �� 	0 _back  �� p*j  E�Ob  j [b  ��,FO�b  �,���E�O���,FOb  �,E�O &h����,���E�O���,FO�E�O��,E�[OY��O���,FY hO��+ )�O�Oj�OL OL OL OL OL OL 	OL 
OL �1 ��K S�
( ��	)������
�� .Obj:Timenull��� ��� null��  �� ��	��
�� 
Name	 {����	/�� 0 nametext nameText��  ��   ������ 0 nametext nameText�� 0 timerobject TimerObject 	<����	?
�� "0 astextparameter asTextParameter�� 0 timerobject TimerObject
 ��������
�� .ascrinit****      � **** k     / 	C 	K 	P 	T 	Y 	` 	{ 	� 	� 	� 	�����  ��  ��   ����������������������
�� 
pimr�� 0 
_starttime 
_startTime�� 0 _totalseconds _totalSeconds�� 0 
_isrunning 
_isRunning�� 0 	timername 	timerName�� 0 
starttimer 
startTimer�� 0 	stoptimer 	stopTimer�� 0 elapsedtime elapsedTime�� 0 	totaltime 	totalTime�� &0 objectdescription objectDescription�� 0 
copyobject 
copyObject ����	G����	S����
�� 
cobj
�� 
frmk
�� 
msng�� 0 
_starttime 
_startTime�� 0 _totalseconds _totalSeconds�� 0 
_isrunning 
_isRunning ��	\���� !���� 0 	timername 	timerName��  ��     !  �� b    ��	c����"#���� 0 
starttimer 
startTimer��  ��  "  # ������
�� misccura�� 0 nsdate NSDate�� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�� (b   hY hOeEc  O��,j+ Ec  O) ��	~����$%���� 0 	stoptimer 	stopTimer��  ��  $ ���� 0 elapsedtime elapsedTime% ����~
�� misccura� 0 nsdate NSDate�~ @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�� 9b   jY hO��,j+ b  E�Ob  �Ec  OfEc  O� �}	��|�{&'�z�} 0 elapsedtime elapsedTime�|  �{  & �y�y 0 nsdate NSDate' �x�x @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�z b   �j+  b  Y j �w	��v�u()�t�w 0 	totaltime 	totalTime�v  �u  (  ) �s�s 0 elapsedtime elapsedTime�t b   b  *j+  Y b   �r	��q�p*+�o�r &0 objectdescription objectDescription�q  �p  * �n�n 0 infotext infoText+ 	��m	�	��l	��k	�	�	�	��m 0 elapsedtime elapsedTime�l 0 	totaltime 	totalTime
�k 
leng�o Gb   �*j+ %�%E�Y �*j+ %�%E�Ob   �,j �b   %�%�%E�Y hO�%�% �j	��i�h,-�g�j 0 
copyobject 
copyObject�i  �h  , �f�f 0 	newobject 	newObject- �e�d�c�b�a
�e 
Name
�d .Obj:Timenull��� ��� null�c 0 
_starttime 
_startTime�b 0 _totalseconds _totalSeconds�a 0 
_isrunning 
_isRunning�g /*�b   l E�Ob  ��,FOb  ��,FOb  ��,FO��� 0�*��/lkv��O�Of�OL OL 	OL 
OL OL OL OL �� b   ��l+ E�O��K S� ascr  ��ޭ