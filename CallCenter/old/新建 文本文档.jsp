�� ����ΪVB Demo ��������˵��
Public Declare Function InitialUSB_IO Lib "hDTD.dll" () As Long
Public Declare Sub ExistUSB_IO Lib "hDTD.dll" ()
Public Declare Function PickUp Lib "hDTD.dll" () As Long
Public Declare Function PutDown Lib "hDTD.dll" () As Long
Public Declare Function DialNmb Lib "hDTD.dll" (ByVal lpszNote As String) As Long
Public Declare Function Read_Call_Nmb Lib "hDTD.dll" (ByVal lpszNote As String) As Long
Public Declare Sub TelSleep Lib "hDTD.dll" (ByVal iDelay As Integer)
Public Declare Function StartReadSound Lib "hDTD.dll" (ByVal lpszNote As String, ByVal iMode As Integer) As Long
Public Declare Function StopReadSound Lib "hDTD.dll" () As Long
Public Declare Function SetDialPara Lib "hDTD.dll" (ByVal DialDelay As Integer, ByVal betweenDialDelay As Integer, ByVal iDecay As Integer) As Long
Public Declare Function SetNextCallDelay Lib "hDTD.dll" (ByVal betweenDialDelay As Integer) As Long
Public Declare Function ReaddiFlagsValue Lib "hDTD.dll" () As Long
Public Declare Function StartPlaySound Lib "hDTD.dll" (ByVal cReadName As String, ByVal iStartPlayPos As Integer, ByVal iDirct As Integer, ByVal iDecay As Integer, ByVal iMute As Integer) As Long
Public Declare Function StopPlaySound Lib "hDTD.dll" () As Long
Public Declare Function GetWriteSoundRate Lib "hDTD.dll" () As Long

Public Declare Function CheckCallStatus Lib "hDTD.dll" () As Long
Public Declare Function CheckCanNextCallIn Lib "hDTD.dll" () As Long
Public Declare Function CheckPutDown Lib "hDTD.dll" () As Long

Public Declare Function IfNotCompleteInitUSB Lib "hDTD.dll" ()
Public Declare Function IfConnectUSB Lib "hDTD.dll" () As Long
Public Declare Function ClearCallBit Lib "hDTD.dll" ()



' ����ΪVB Demo����ԭ����
' ǿ�ҽ��飺�ڱ����.exe�ļ����ٵ��Խ���������
'           ʹ��Read_Call_Nmb(strCallNmb)������strCallNmb����Ϊchar[]

Dim m_bTelInfoIfExist As Boolean
Dim m_bNextCallCanInto As Boolean
Dim m_bPickUp As Boolean
Dim m_bDialNmbNow As Boolean
Dim m_bIsPlayInPhoneNow As Boolean
Dim m_iPlayMode As Byte

Private Sub Form_Load()
    Dim iTelStatus As Long
    Dim iReturnValue As Long

    m_bTelInfoIfExist = False                           ' ��û������HM�豸

    If (InitialUSB_IO() > 0) Then                       ' InitialUSB_IO()�������������У�ֻ��ִ��һ�Σ����2��ִ�иù��̣�.dll�ڻᱨ��
        IfNotCompleteInitUSB                            ' �ȴ�HM��������
        If IfConnectUSB() = 1 Then                      ' �ٴζ���HM״̬
            m_bTelInfoIfExist = False                   ' ���������ڱ���HM�Ƿ��Ѿ�����״̬��Ϊ���������ṩ�жϣ�һ��Ҫ�С�
            MsgBox "��ý(HM)û�����Ӻã�����������ʹ��HM!"
        Else
            m_bPickUp = False                           ' û��ժ��
            m_bTelInfoIfExist = True
            m_bDialNmbNow = False
            m_iPlayMode = 0                             ' �绰����
            ClearCallBit
            iReturnValue = SetDialPara(5, 5, 6)         ' ������ʱ100mS������ʱ����Ϊ100mS����λ��20mS
            SetNextCallDelay (100)                      ' �����´��������ʱ����Ϊ10S, ��λ��100mS
        End If

        PickUpCall.Enabled = False
        m_bNextCallCanInto = True                       ' �´�������Խ���
        m_bIsPlayInPhoneNow = False                     ' û���ڵ绰������
    End If
End Sub
Private Sub Form_Unload(Cancel As Integer)
    If m_bTelInfoIfExist = True Then
        ExistUSB_IO
    End If
End Sub
Private Sub ButtonDial_Click()
    Dim iFileSize As Long
    Dim iRecStatus As Long
    Dim strFileSize As String

    If ButtonDial.Caption = "����" Then
        ButtonDial.Caption = "�һ�"
        PickUp
        TelSleep (600)      ' ��ʱ600mS���ţ��ȴ�ժ��״̬�ȶ�
        DialNmb (strDialNmb.Text)
        iRecStatus = StartReadSound("Dial.wav", 0)

        m_bDialNmbNow = True
    Else
        iFileSize = StopReadSound()
        TelSleep (200)      ' ��ʱ200mSֹͣ
        PutDown
        m_bDialNmbNow = False
        ButtonDial.Caption = "����"
        strFileSize = iFileSize
        strRecordSize.Caption = "¼���ļ�����: " + strFileSize + "Bytes"
    End If
End Sub

Private Sub PickUpCall_Click()
    Dim iFileSize As Long
    Dim iRecStatus As Long
    Dim strFileSize As String

    If PickUpCall.Caption = "����" Then
        PickUpCall.Caption = "�һ�"
        m_bPickUp = True
        m_bNextCallCanInto = True
        PickUp
        TelSleep (100)      ' ��ʱ100mS���ţ��ȴ�ժ��״̬�ȶ�
        iRecStatus = StartReadSound("Call.wav", 0)
    Else
        iFileSize = StopReadSound()
        TelSleep (100)

        PutDown
        PickUpCall.Caption = "����"
        m_bPickUp = False
        PickUpCall.Enabled = False
        strFileSize = iFileSize
        strCallRecSize.Caption = "¼���ļ�����: " + strFileSize + "Bytes"
    End If
End Sub

Private Sub PhonePlay_Click()
    Dim iStatus As Long
    Dim bStatus As Boolean

    If PhonePlay.Caption = "�绰����" Then
        MsgBox "�绰ժ�������������绰�ķ���+�����������Ĳ������������������󡣵�����ͨһ���绰�󣬸ò������Ͳ������ˣ���ʱ�ڵ绰���������Ż����������ĵ绰������"
        PhonePlay.Caption = "ֹͣ"
        m_bIsPlayInPhoneNow = True
        strPlayName.Caption = "�绰�����ļ�:leaveword.wav"      ' leaveword.wav�ļ��ڵ�ǰ����Ŀ¼��
        PickUp
        TelSleep (250)      ' ��ʱ250mS����
        m_iPlayMode = 1
        iStatus = StartPlaySound("leaveword.wav", 0, 0, 2, 0)
    Else
        m_iPlayMode = 0
        bStatus = StopPlaySound()
        TelSleep (100)      ' ��ʱ100mSֹͣ
        PutDown
        PhonePlay.Caption = "�绰����"
        strPlayName.Caption = ""
        m_bIsPlayInPhoneNow = False
    End If

End Sub

Private Sub EarPlay_Click()
    Dim iStatus As Long
    Dim bStatus As Boolean

    If EarPlay.Caption = "��������" Then
        EarPlay.Caption = "ֹͣ"
        m_bIsPlayInPhoneNow = True
        strPlayName.Caption = "���������ļ�:leaveword.wav"      ' leaveword.wav�ļ��ڵ�ǰ����Ŀ¼��
        m_iPlayMode = 3
        iStatus = StartPlaySound("leaveword.wav", 0, 2, 2, 0)
    Else
        m_iPlayMode = 0
        bStatus = StopPlaySound()
        EarPlay.Caption = "��������"
        strPlayName.Caption = ""
        m_bIsPlayInPhoneNow = False
    End If

End Sub

Private Sub SpeakPlay_Click()
    Dim iStatus As Long
    Dim bStatus As Boolean

    If SpeakPlay.Caption = "���ȷ���" Then
        SpeakPlay.Caption = "ֹͣ"
        m_bIsPlayInPhoneNow = True
        strPlayName.Caption = "���ȷ����ļ�:leaveword.wav"      ' leaveword.wav�ļ��ڵ�ǰ����Ŀ¼��
        m_iPlayMode = 2
        iStatus = StartPlaySound("leaveword.wav", 0, 1, 2, 0)
    Else
        m_iPlayMode = 0
        bStatus = StopPlaySound()
        SpeakPlay.Caption = "���ȷ���"
        strPlayName.Caption = ""
        m_bIsPlayInPhoneNow = False
    End If

End Sub

Private Sub TelTimer_Timer()
    Dim iTelStatus As Long
    Dim strCallNmb As String * 60
    Dim iUSBStatus As Long
    Dim iStartPlayPos As Long
    Dim str450 As String * 3
    Dim str450DelayTime As String

    '����Ƿ������磬�������������
     If CheckCallStatus() = 1 Then
         m_bNextCallCanInto = False
         m_iStatusUSB = Read_Call_Nmb(strCallNmb)
         strCallInfo.Caption = strCallNmb
         PickUpCall.Enabled = True
     End If

    ' �ж��Ƿ�Ϊ�´�����
    If m_bNextCallCanInto = False Then
        If CheckCanNextCallIn() = 1 Then
            PickUpCall.Enabled = False
            m_bNextCallCanInto = True
        End If
    End If

    ' ��⻰ý(HM)�Ƿ��Ѿ�ժ/�һ�
    If m_bNextCallCanInto = False Then
        If m_bPickUp = False Then
            If CheckPutDown() = 1 Then              ' ����������ʱ���ж��Ƿ��н���
                PickUpCall_Click
            End If
        End If
    Else
        If m_bPickUp = True Then                    ' �ж�����ʱ���Ƿ��йһ�
            If CheckPutDown() = 0 Then
                PickUpCall_Click
            End If
        End If

        If m_bDialNmbNow = True Then        ' �жϲ���ʱ���Ƿ�һ�
            If CheckPutDown() = 0 Then
                ButtonDial_Click
            End If
        End If
    End If

    '�жϵ绰�����Ƿ����
    If m_bIsPlayInPhoneNow = True Then
        iStartPlayPos = GetWriteSoundRate()
//���������ȱ���,>0: �����Ѿ����������ļ��ֽ�������ļ��ܳ��ȵı���0��1000
//=0: �÷����ļ��ĳ���Ϊ0Byte
//=-1: ����Phone�һ�������HM����ֹͣ����

        If iStartPlayPos >= 1000 Then
            If m_iPlayMode = 1 Then
                PhonePlay_Click
            End If
            If m_iPlayMode = 2 Then
                SpeakPlay_Click
            End If
            If m_iPlayMode = 3 Then
                EarPlay_Click
            End If
        End If
    End If

End Sub

Private Sub CSetPara_Click()
    Dim iNextCallDelay As Integer
    Dim iDailDelay As Integer
    Dim iBetweenDialDelay As Integer
    Dim iDialDecay As Integer
    Dim iReturnValue As Long

    iNextCallDelay = m_strCallDelay
    iDailDelay = m_strDailDelay
    iBetweenDialDelay = m_strBetweenDelay
    iDialDecay = m_strDialDecay

    ' ��������ʱ������������
    ' ����ʱ����������֮�����ʱ�������ʱ���ȣ���Ҫʵ�ز������������һ��Ҫ����ʵ�ز�����������֮���ʱ�䳤�ȡ�
    ' intCallDelay=1,�൱��ʱ100mS; intCallDelay=100,����ʱ10S; intCallDelay�����ȡֵΪ240
    ' ���intCallDelay��ʱС������ʱ����������֮���ʱ��������ô������������ȡ���������!
    SetNextCallDelay (iNextCallDelay)

    ' ���ڲ���ʱ������������
    ' ����ʱ���������벦��֮�����ʱ��intBetweenDelay=1,�൱��ʱ20mS; intBetweenDelay=4,����ʱ80mS
    ' intBetweenDelay�����ȡֵΪ10
    ' һ���������ʱԤ����Ϊ5���൱��100mS
    iReturnValue = SetDialPara(iDailDelay, iBetweenDialDelay, iDialDecay)

End Sub
