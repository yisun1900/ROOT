<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String tsjlh=request.getParameter("tsjlh");

	ls_sql="SELECT crm_tsbm.tsjlh,crm_tsbm.tsyybm,dm_tsyybm.tsyymc,dm_tslxbm.tslxmc,dm_tsxlbm.tsxlmc,dwmc,zrr,DECODE(crm_tsbm.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') clzt,tspp,ppmc,gys,DECODE(rglrbz,'1','ϵͳȡ��','2','�˹�¼��') rglrbz ";
	ls_sql+=" FROM crm_tsbm,dm_tslxbm,dm_tsxlbm,dm_tsyybm,sq_dwxx  ";
    ls_sql+=" where crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.tslxbm=dm_tslxbm.tslxbm(+)";
    ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh(+) and crm_tsbm.tsjlh='"+tsjlh+"'";
    ls_sql+=" order by crm_tsbm.tslxbm,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditCrm_tsbm.jsp?tsjlh="+tsjlh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//	pageObj.alignStr[3]="align='left'";

//������ʾ��
	String[] disColName={"tslxmc","tsxlmc","tsyymc","clzt","dwmc","zrr","tspp","gys","rglrbz"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"tsyybm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_tsbm.jsp?tsjlh="+tsjlh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tslxmc","1");//�в����������Hash��
	spanColHash.put("tsxlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ�Ͷ��ԭ��Ͷ�߼�¼�ţ�<%=tsjlh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="10%">Ͷ�߱��޴���</td>
	<td  width="11%">Ͷ�߱���С��</td>
	<td  width="15%">Ͷ�߱���ԭ��</td>
	<td  width="6%">����״̬</td>
	<td  width="11%">���β���</td>
	<td  width="7%">������</td>
	<td  width="8%">��Ʒ��</td>
	<td  width="17%">�漰��Ӧ��</td>
	<td  width="7%">�˹�¼��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>