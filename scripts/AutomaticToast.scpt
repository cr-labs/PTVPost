FasdUAS 1.101.10   ��   ��    k             l      ��  ��   0*
This script runs "forever" (must be saved as "Stay Open" and "Application"). It finds one file at a time to burn onto a DVD, then uses Roxio Toast to create a disc image of the final DVD, suitable for physical burning to a disc at any time.

Script should be saved as an Application with Stay Open and NO Startup Screen... and launched from the login routine for the user Robot.

The files are expected to be found in the folder SOURCEFOLDER
The .toast image files are written to OUTFOLDER
Once a file has been processed, the script moves it to FINISHEDFOLDER
Error messages are sent to EMAILTO which can contain more than one address - separate multiple addresses with commas
The number of seconds to delay when waiting to check again for a new file, is LOOPDELAYSEC. Normally this is 30 (seconds). The idle handler is called at this interval
The number of seconds to delay when measuring file sizes to see if a file is growing, is FILESIZEDELAYSEC. Normally this is 20 or more (seconds)

Author: Jim Youll
Last revised 2009-06-21 by Jim Youll
2009-06-26 Now writes to a .tmp file, which is renamed to .toast on successful completion of encoding and image-file writing
2009-06-29 Revised to use an On Idle handler instead of its own loop; inlined "filesizeisnotchanging" method in getAFile and deleted the unused method
     � 	 	
T 
 T h i s   s c r i p t   r u n s   " f o r e v e r "   ( m u s t   b e   s a v e d   a s   " S t a y   O p e n "   a n d   " A p p l i c a t i o n " ) .   I t   f i n d s   o n e   f i l e   a t   a   t i m e   t o   b u r n   o n t o   a   D V D ,   t h e n   u s e s   R o x i o   T o a s t   t o   c r e a t e   a   d i s c   i m a g e   o f   t h e   f i n a l   D V D ,   s u i t a b l e   f o r   p h y s i c a l   b u r n i n g   t o   a   d i s c   a t   a n y   t i m e . 
 
 S c r i p t   s h o u l d   b e   s a v e d   a s   a n   A p p l i c a t i o n   w i t h   S t a y   O p e n   a n d   N O   S t a r t u p   S c r e e n . . .   a n d   l a u n c h e d   f r o m   t h e   l o g i n   r o u t i n e   f o r   t h e   u s e r   R o b o t . 
 
 T h e   f i l e s   a r e   e x p e c t e d   t o   b e   f o u n d   i n   t h e   f o l d e r   S O U R C E F O L D E R 
 T h e   . t o a s t   i m a g e   f i l e s   a r e   w r i t t e n   t o   O U T F O L D E R 
 O n c e   a   f i l e   h a s   b e e n   p r o c e s s e d ,   t h e   s c r i p t   m o v e s   i t   t o   F I N I S H E D F O L D E R 
 E r r o r   m e s s a g e s   a r e   s e n t   t o   E M A I L T O   w h i c h   c a n   c o n t a i n   m o r e   t h a n   o n e   a d d r e s s   -   s e p a r a t e   m u l t i p l e   a d d r e s s e s   w i t h   c o m m a s 
 T h e   n u m b e r   o f   s e c o n d s   t o   d e l a y   w h e n   w a i t i n g   t o   c h e c k   a g a i n   f o r   a   n e w   f i l e ,   i s   L O O P D E L A Y S E C .   N o r m a l l y   t h i s   i s   3 0   ( s e c o n d s ) .   T h e   i d l e   h a n d l e r   i s   c a l l e d   a t   t h i s   i n t e r v a l 
 T h e   n u m b e r   o f   s e c o n d s   t o   d e l a y   w h e n   m e a s u r i n g   f i l e   s i z e s   t o   s e e   i f   a   f i l e   i s   g r o w i n g ,   i s   F I L E S I Z E D E L A Y S E C .   N o r m a l l y   t h i s   i s   2 0   o r   m o r e   ( s e c o n d s ) 
 
 A u t h o r :   J i m   Y o u l l 
 L a s t   r e v i s e d   2 0 0 9 - 0 6 - 2 1   b y   J i m   Y o u l l 
 2 0 0 9 - 0 6 - 2 6   N o w   w r i t e s   t o   a   . t m p   f i l e ,   w h i c h   i s   r e n a m e d   t o   . t o a s t   o n   s u c c e s s f u l   c o m p l e t i o n   o f   e n c o d i n g   a n d   i m a g e - f i l e   w r i t i n g 
 2 0 0 9 - 0 6 - 2 9   R e v i s e d   t o   u s e   a n   O n   I d l e   h a n d l e r   i n s t e a d   o f   i t s   o w n   l o o p ;   i n l i n e d   " f i l e s i z e i s n o t c h a n g i n g "   m e t h o d   i n   g e t A F i l e   a n d   d e l e t e d   t h e   u n u s e d   m e t h o d 
   
  
 l     ��������  ��  ��        p         �� �� 0 sourcefolder SOURCEFOLDER  �� �� 0 	outfolder 	OUTFOLDER  ������  0 finishedfolder FINISHEDFOLDER��        p         �� �� 0 emailto EMAILTO  �� �� 0 loopdelaysec LOOPDELAYSEC  ������ $0 filesizedelaysec FILESIZEDELAYSEC��        p         �� �� 0 ptvlogo PTVLOGO  �� �� 0 ptvpostlogo PTVPOSTLOGO  ������ 0 
blackvideo 
BLACKVIDEO��        l          p           ������ 0 working WORKING��    W Q true when working in the idle handler and no idle() should not trigger more runs     � ! ! �   t r u e   w h e n   w o r k i n g   i n   t h e   i d l e   h a n d l e r   a n d   n o   i d l e ( )   s h o u l d   n o t   t r i g g e r   m o r e   r u n s   " # " l     ��������  ��  ��   #  $ % $ i      & ' & I     ������
�� .aevtoappnull  �   � ****��  ��   ' k     - ( (  ) * ) r      + , + m      - - � . . b M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t _ m e d i a : S u b m i t - D V D , o      ���� 0 sourcefolder SOURCEFOLDER *  / 0 / r     1 2 1 m     3 3 � 4 4 \ M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t _ m e d i a : O U T - D V D 2 o      ���� 0 	outfolder 	OUTFOLDER 0  5 6 5 r     7 8 7 m    	 9 9 � : : ` M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t _ m e d i a : P r o c e s s e d 8 o      ����  0 finishedfolder FINISHEDFOLDER 6  ; < ; r     = > = m     ? ? � @ @ � M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t : p c r e d i t s : o r i g i n a l s : p t v l o g o 7 2 0 x 4 8 0 x 4 . d v > o      ���� 0 ptvlogo PTVLOGO <  A B A r     C D C m     E E � F F � M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t : p c r e d i t s : o r i g i n a l s : p t v p o s t c r e d i t 0 9 P A R s m a l l e r - 1 0 . d v D o      ���� 0 ptvpostlogo PTVPOSTLOGO B  G H G r     I J I m     K K � L L ~ M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t : p c r e d i t s : o r i g i n a l s : b l a c k - 1 0 . d v J o      ���� 0 
blackvideo 
BLACKVIDEO H  M N M l   ��������  ��  ��   N  O P O r     Q R Q m     S S � T T R i n f o @ p r o v i n c e t o w n t v . o r g , j i m @ a g e n t z e r o . c o m R o      ���� 0 emailto EMAILTO P  U V U l   �� W X��   W ) # set EMAILTO to "jim@agentzero.com"    X � Y Y F   s e t   E M A I L T O   t o   " j i m @ a g e n t z e r o . c o m " V  Z [ Z l   ��������  ��  ��   [  \ ] \ l    ^ _ ` ^ r     a b a m    ����  b o      ���� 0 loopdelaysec LOOPDELAYSEC _ 2 , how long to wait between runs of the script    ` � c c X   h o w   l o n g   t o   w a i t   b e t w e e n   r u n s   o f   t h e   s c r i p t ]  d e d l    ' f g h f r     ' i j i m     #����  j o      ���� $0 filesizedelaysec FILESIZEDELAYSEC g � | long long to wait to determine if a file's size is changing (20 sec min due to network copies not updating size right away)    h � k k �   l o n g   l o n g   t o   w a i t   t o   d e t e r m i n e   i f   a   f i l e ' s   s i z e   i s   c h a n g i n g   ( 2 0   s e c   m i n   d u e   t o   n e t w o r k   c o p i e s   n o t   u p d a t i n g   s i z e   r i g h t   a w a y ) e  l�� l r   ( - m n m m   ( )��
�� boovfals n o      ���� 0 working WORKING��   %  o p o l     ��������  ��  ��   p  q r q i     s t s I     ������
�� .miscidlenmbr    ��� null��  ��   t k    x u u  v w v l     �� x y��   x 9 3- don't re-enter while something is already running    y � z z f -   d o n ' t   r e - e n t e r   w h i l e   s o m e t h i n g   i s   a l r e a d y   r u n n i n g w  { | { Z     
 } ~���� } o     ���� 0 working WORKING ~ L       o    ���� 0 loopdelaysec LOOPDELAYSEC��  ��   |  � � � r     � � � m    ��
�� boovtrue � o      ���� 0 working WORKING �  � � � l   ��������  ��  ��   �  � � � r     � � � I    �������� 0 getafile getAFile��  ��   � o      ���� 0 r   �  � � � l   ��������  ��  ��   �  � � � Z   q � ����� � >    � � � o    ���� 0 r   � m    ������ � k   m � �  � � � r      � � � o    ���� 0 r   � o      ���� 0 thefile   �  � � � r   ! ( � � � I  ! &�� ���
�� .sysonfo4asfe        file � o   ! "���� 0 thefile  ��   � o      ���� 0 fileinfo   �  � � � r   ) . � � � n   ) , � � � 1   * ,��
�� 
pnam � o   ) *���� 0 fileinfo   � o      ���� 0 filename   �  � � � r   / 8 � � � b   / 6 � � � b   / 4 � � � b   / 2 � � � o   / 0���� 0 	outfolder 	OUTFOLDER � m   0 1 � � � � �  : � o   2 3���� 0 filename   � m   4 5 � � � � �  . t m p � o      ���� 0 tempoutfilenameandpath   �  � � � r   9 B � � � b   9 @ � � � b   9 > � � � b   9 < � � � o   9 :���� 0 	outfolder 	OUTFOLDER � m   : ; � � � � �  : � o   < =���� 0 filename   � m   > ? � � � � �  . t o a s t � o      ���� 0 outfilenameandpath   �  � � � r   C H � � � b   C F � � � o   C D���� 0 filename   � m   D E � � � � �  . t o a s t � o      ���� 0 outfilenameonly   �  � � � l  I I��������  ��  ��   �  ��� � t   Im � � � Q   Ml � � � � k   PN � �  � � � O   P � � � � k   T � � �  � � � r   T Y � � � m   T U��
�� boovfals � 1   U X��
�� 
srvM �  � � � r   Z e � � � I  Z c���� �
�� .corecrel****      � null��   � �� ���
�� 
kocl � m   \ _��
�� 
dVCD��   � o      ���� 
0 mydisc   �  � � � r   f o � � � m   f i��
�� pVFoDVD  � n       � � � 1   j n��
�� 
pVFo � o   i j���� 
0 mydisc   �  � � � r   p u � � � o   p q���� 0 filename   � n       � � � 1   r t��
�� 
pnam � o   q r���� 
0 mydisc   �  � � � r   v } � � � m   v w��
�� boovfals � n       � � � 1   x |��
�� 
pMen � o   w x���� 
0 mydisc   �  � � � r   ~ � � � � c   ~ � � � � o   ~ ���� 0 thefile   � m    ���
�� 
alis � o      ���� 0 myvideofile myVideoFile �  � � � I  � ��� � �
�� .CDr3addDnull        obj  � o   � ����� 
0 mydisc   � �� ���
�� 
kfil � l  � � ����� � c   � � � � � o   � ����� 0 ptvlogo PTVLOGO � m   � ���
�� 
alis��  ��  ��   �  � � � I  � ��� 
�� .CDr3addDnull        obj   o   � ����� 
0 mydisc   ����
�� 
kfil o   � ����� 0 myvideofile myVideoFile��   �  I  � ���
�� .CDr3addDnull        obj  o   � ��� 
0 mydisc   �~�}
�~ 
kfil l  � ��|�{ c   � �	
	 o   � ��z�z 0 
blackvideo 
BLACKVIDEO
 m   � ��y
�y 
alis�|  �{  �}    I  � ��x
�x .CDr3addDnull        obj  o   � ��w�w 
0 mydisc   �v�u
�v 
kfil l  � ��t�s c   � � o   � ��r�r 0 ptvpostlogo PTVPOSTLOGO m   � ��q
�q 
alis�t  �s  �u    I  � ��p
�p .CDr3addDnull        obj  o   � ��o�o 
0 mydisc   �n�m
�n 
kfil l  � ��l�k c   � � o   � ��j�j 0 
blackvideo 
BLACKVIDEO m   � ��i
�i 
alis�l  �k  �m    I  � ��h
�h .coresavenull    ��� obj  o   � ��g�g 
0 mydisc   �f�e
�f 
dImg o   � ��d�d 0 tempoutfilenameandpath  �e    �c  r   � �!"! I  � ��b�a#
�b .corecrel****      � null�a  # �`$�_
�` 
kocl$ m   � ��^
�^ 
dVCD�_  " o      �]�] 
0 mydisc  �c   � m   P Q%%�                                                                                  CDr3   alis    �  Macintosh HD               ���H+   ��Toast Titanium.app                                              ���]        ����  	                Toast 10 Titanium     ��      �U�     ��   �  >Macintosh HD:Applications:Toast 10 Titanium:Toast Titanium.app  &  T o a s t   T i t a n i u m . a p p    M a c i n t o s h   H D  1Applications/Toast 10 Titanium/Toast Titanium.app   / ��   � &�\& Q   �N'()' O   �(*+* k   �',, -.- r   � �/0/ 4   � ��[1
�[ 
alis1 o   � ��Z�Z 0 tempoutfilenameandpath  0 o      �Y�Y 0 tempfilealias  . 232 Z   �45�X�W4 I  � ��V6�U
�V .coredoexbool        obj 6 o   � ��T�T 0 outfilenameandpath  �U  5 I �S7�R
�S .coredeloobj        obj 7 4  �Q8
�Q 
file8 o  �P�P 0 outfilenameandpath  �R  �X  �W  3 9:9 r  ;<; o  �O�O 0 outfilenameonly  < n      =>= 1  �N
�N 
pnam> o  �M�M 0 tempfilealias  : ?�L? I '�K@A
�K .coremoveobj        obj @ o  �J�J 0 thefile  A �IBC
�I 
inshB o  �H�H  0 finishedfolder FINISHEDFOLDERC �GD�F
�G 
alrpD m   !�E
�E boovtrue�F  �L  + m   � �EE�                                                                                  MACS   alis    r  Macintosh HD               ���H+     �
Finder.app                                                       w`Ţl;        ����  	                CoreServices    ��      Ţ��       �   Q   P  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ( R      �DFG
�D .ascrerr ****      � ****F o      �C�C 
0 errmsg  G �BH�A
�B 
errnH o      �@�@ 	0 errno  �A  ) I  0N�?I�>�? 0 	sendemail 	sendEmailI J�=J b  1JKLK b  1HMNM b  1DOPO b  1BQRQ b  1>STS b  1:UVU b  16WXW m  14YY �ZZ � F i l e   w a s   p r o c e s s e d   b y   T o a s t   b u t   a n   e r r o r   o c c u r r e d   m o v i n g   f i l e .   m e s s a g e :X o  45�<�< 0 filename  V m  69[[ �\\  t o  T o  :=�;�;  0 finishedfolder FINISHEDFOLDERR m  >A]] �^^    e r r n o :P o  BC�:�: 	0 errno  N m  DG__ �``    m e s s a g e :L o  HI�9�9 
0 errmsg  �=  �>  �\   � R      �8ab
�8 .ascrerr ****      � ****a o      �7�7 
0 errmsg  b �6c�5
�6 
errnc o      �4�4 	0 errno  �5   � I  Vl�3d�2�3 0 	sendemail 	sendEmaild e�1e b  Whfgf b  Wfhih b  Wbjkj b  W`lml b  W\non m  WZpp �qq l E r r o r   c a l l i n g   T o a s t   T i t a n i u m   t o   c r e a t e   D V D   i m a g e   f o r :  o o  Z[�0�0 0 filename  m m  \_rr �ss   k o  `a�/�/ 	0 errno  i m  bett �uu    m e s s a g e :g o  fg�.�. 
0 errmsg  �1  �2   � l  I Lv�-�,v ]   I Lwxw m   I J�+�+,x m   J K�*�* <�-  �,  ��  ��  ��   � yzy r  ru{|{ m  rs�)
�) boovfals| o      �(�( 0 working WORKINGz }�'} L  vx~~ o  vw�&�& 0 loopdelaysec LOOPDELAYSEC�'   r � l     �%�$�#�%  �$  �#  � ��� l      �"���"  � = 7 get one file or return -1 if no files were available.    � ��� n   g e t   o n e   f i l e   o r   r e t u r n   - 1   i f   n o   f i l e s   w e r e   a v a i l a b l e .  � ��� i    ��� I      �!� ��! 0 getafile getAFile�   �  � Q     M���� k    C�� ��� O    ��� 6   ��� n    ��� 3    �
� 
cobj� 4    ��
� 
cfol� o   	 
�� 0 sourcefolder SOURCEFOLDER� H    �� C    ��� 1    �
� 
pnam� m    �� ���  .� m    ���                                                                                  MACS   alis    r  Macintosh HD               ���H+     �
Finder.app                                                       w`Ţl;        ����  	                CoreServices    ��      Ţ��       �   Q   P  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� r    ��� c    ��� 1    �
� 
rslt� m    �
� 
alis� o      �� 	0 afile  � ��� l      ����  � h b if file size is not stable, then we won't process it. Get size. Wait. Get size again and compare    � ��� �   i f   f i l e   s i z e   i s   n o t   s t a b l e ,   t h e n   w e   w o n ' t   p r o c e s s   i t .   G e t   s i z e .   W a i t .   G e t   s i z e   a g a i n   a n d   c o m p a r e  � ��� r     )��� n     '��� 1   % '�
� 
ptsz� l    %���� I    %���
� .sysonfo4asfe        file� o     !�� 	0 afile  �  �  �  � o      �� 0 initialsize  � ��� l  * /���� I  * /���
� .sysodelanull��� ��� nmbr� o   * +�� $0 filesizedelaysec FILESIZEDELAYSEC�  � : 4 wait a while then compare new size and initial size   � ��� h   w a i t   a   w h i l e   t h e n   c o m p a r e   n e w   s i z e   a n d   i n i t i a l   s i z e� ��� Z   0 C����� >  0 9��� n   0 7��� 1   5 7�

�
 
ptsz� l  0 5��	�� I  0 5���
� .sysonfo4asfe        file� o   0 1�� 	0 afile  �  �	  �  � o   7 8�� 0 initialsize  � L   < >�� m   < =�����  � L   A C�� o   A B�� 	0 afile  �  � R      ���
� .ascrerr ****      � ****� o      � �  
0 errmsg  � �����
�� 
errn� o      ���� 	0 errno  ��  � l  K M���� L   K M�� m   K L������� S M if there are no files available, or if a real error occurred, we end up here   � ��� �   i f   t h e r e   a r e   n o   f i l e s   a v a i l a b l e ,   o r   i f   a   r e a l   e r r o r   o c c u r r e d ,   w e   e n d   u p   h e r e� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l      ������  � B < Send email updating someone about a file that was rejected    � ��� x   S e n d   e m a i l   u p d a t i n g   s o m e o n e   a b o u t   a   f i l e   t h a t   w a s   r e j e c t e d  � ��� i    ��� I      ������� 0 	sendemail 	sendEmail� ���� o      ���� 0 msgtext msgText��  ��  � Q     N���� O    7��� k    6�� ��� r    ��� I   �����
�� .corecrel****      � null��  � ����
�� 
kocl� m   	 
��
�� 
bcke� �����
�� 
prdt� K    �� ����
�� 
subj� m    �� ��� F A n   e r r o r   o c c u r r e d   i n   A u t o m a t i c T o a s t� ����
�� 
ctnt� o    ���� 0 msgtext msgText� �����
�� 
pvis� m    ��
�� boovtrue��  ��  � o      ���� 0 thenewmessage theNewMessage� ���� O    6��� k    5�� ��� I   /�����
�� .corecrel****      � null��  � ����
�� 
kocl� m     !��
�� 
trcp� ����
�� 
insh� n   " &� �  ;   % &  2  " %��
�� 
trcp� ����
�� 
prdt K   ' + ����
�� 
radd o   ( )���� 0 emailto EMAILTO��  ��  � �� I  0 5������
�� .emsgsendbool        bcke��  ��  ��  � o    ���� 0 thenewmessage theNewMessage��  � m    �                                                                                  emal   alis    D  Macintosh HD               ���H+     �Mail.app                                                        ��J`�        ����  	                Applications    ��      �J�       �  "Macintosh HD:Applications:Mail.app    M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  � R      ��
�� .ascrerr ****      � **** o      ���� 
0 errmsg   ����
�� 
errn o      ���� 	0 errno  ��  � I  ? N��	��
�� .ascrcmnt****      � ****	 b   ? J

 b   ? H b   ? D m   ? B � T E r r o r   o c c u r r e d   w h i l e   t r y i n g   t o   s e n d   e m a i l : o   B C���� 	0 errno   m   D G � 
   m s g : o   H I���� 
0 errmsg  ��  � �� l     ��������  ��  ��  ��       ����   ��������
�� .aevtoappnull  �   � ****
�� .miscidlenmbr    ��� null�� 0 getafile getAFile�� 0 	sendemail 	sendEmail �� '������
�� .aevtoappnull  �   � ****��  ��      -�� 3�� 9�� ?�� E�� K�� S�������������� 0 sourcefolder SOURCEFOLDER�� 0 	outfolder 	OUTFOLDER��  0 finishedfolder FINISHEDFOLDER�� 0 ptvlogo PTVLOGO�� 0 ptvpostlogo PTVPOSTLOGO�� 0 
blackvideo 
BLACKVIDEO�� 0 emailto EMAILTO�� �� 0 loopdelaysec LOOPDELAYSEC�� �� $0 filesizedelaysec FILESIZEDELAYSEC�� 0 working WORKING�� .�E�O�E�O�E�O�E�O�E�O�E�O�E�O�E�Oa E` OfE`  �� t������
�� .miscidlenmbr    ��� null��  ��   �������������������������� 0 r  �� 0 thefile  �� 0 fileinfo  �� 0 filename  �� 0 tempoutfilenameandpath  �� 0 outfilenameandpath  �� 0 outfilenameonly  �� 
0 mydisc  �� 0 myvideofile myVideoFile�� 0 tempfilealias  �� 
0 errmsg  �� 	0 errno   0������������ � � � � �����%������������������������������E����������~�}�|�{Y[]_�zprt�� 0 working WORKING�� 0 loopdelaysec LOOPDELAYSEC�� 0 getafile getAFile
�� .sysonfo4asfe        file
�� 
pnam�� 0 	outfolder 	OUTFOLDER��,�� <
�� 
srvM
�� 
kocl
�� 
dVCD
�� .corecrel****      � null
�� pVFoDVD 
�� 
pVFo
�� 
pMen
�� 
alis
�� 
kfil�� 0 ptvlogo PTVLOGO
�� .CDr3addDnull        obj �� 0 
blackvideo 
BLACKVIDEO�� 0 ptvpostlogo PTVPOSTLOGO
�� 
dImg
�� .coresavenull    ��� obj 
�� .coredoexbool        obj 
�� 
file
�� .coredeloobj        obj 
�� 
insh�  0 finishedfolder FINISHEDFOLDER
�~ 
alrp�} 
�| .coremoveobj        obj �{ 
0 errmsg   �y�x�w
�y 
errn�x 	0 errno  �w  �z 0 	sendemail 	sendEmail��y� �Y hOeE�O*j+ E�O�iU�E�O�j E�O��,E�O��%�%�%E�O��%�%�%E�O��%E�O�� n� �f*�,FO*�a l E�Oa �a ,FO���,FOf�a ,FO�a &E�O�a _ a &l O�a �l O�a _ a &l O�a _ a &l O�a _ a &l O�a �l O*�a l E�UO Ca  9*a �/E�O�j  *a �/j  Y hO���,FO�a !_ "a #ea $ %UW %X & '*a (�%a )%_ "%a *%�%a +%�%k+ ,W X & '*a -�%a .%�%a /%�%k+ ,oY hOfE�O� �v��u�t �s�v 0 getafile getAFile�u  �t   �r�q�p�o�r 	0 afile  �q 0 initialsize  �p 
0 errmsg  �o 	0 errno    ��n�m�l!�k��j�i�h�g�f�e�d"
�n 
cfol�m 0 sourcefolder SOURCEFOLDER
�l 
cobj!  
�k 
pnam
�j 
rslt
�i 
alis
�h .sysonfo4asfe        file
�g 
ptsz�f $0 filesizedelaysec FILESIZEDELAYSEC
�e .sysodelanull��� ��� nmbr�d 
0 errmsg  " �c�b�a
�c 
errn�b 	0 errno  �a  �s N E� *��/�.�[�,\Z�>C1EUO��&E�O�j 	�,E�O�j O�j 	�,� iY �W 	X  i �`��_�^#$�]�` 0 	sendemail 	sendEmail�_ �\%�\ %  �[�[ 0 msgtext msgText�^  # �Z�Y�X�W�Z 0 msgtext msgText�Y 0 thenewmessage theNewMessage�X 
0 errmsg  �W 	0 errno  $ �V�U�T�S��R�Q�P�O�N�M�L�K�J�I�H&�G
�V 
kocl
�U 
bcke
�T 
prdt
�S 
subj
�R 
ctnt
�Q 
pvis�P �O 
�N .corecrel****      � null
�M 
trcp
�L 
insh
�K 
radd�J 0 emailto EMAILTO
�I .emsgsendbool        bcke�H 
0 errmsg  & �F�E�D
�F 
errn�E 	0 errno  �D  
�G .ascrcmnt****      � ****�] O 9� 1*�������e�� 
E�O� *���*�-6���l� 
O*j UUW X  a �%a %�%j ascr  ��ޭ