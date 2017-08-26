<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dwbh=request.getParameter("dwbh");

	String ls_sql=null;

	ls_sql="SELECT b.dwmc ssfgs,a.dwmc as ssdw,sq_yhxx.yhmc as sq_yhxx_yhmc,DECODE(sq_yhxx.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','����','F3','����С��','S0','ʩ����','G0','��Ӧ��','J0','������') as sq_yhxx_yhjs,xzzwbm,zwmc,DECODE(sq_yhxx.kfgssq,'0','����Ȩ','1','��Ȩ�����ֹ�˾','2','<font color=\"#FF0000\">�ڶ����˾</font>','3','��Ȩ��������','4','��Ȩĳһ�ֹ�˾�������','5','��Ȩ����ֹ�˾�������') as kfgssq,sq_yhxx.ygbh,sq_yhxx.yhdlm,DECODE(kdlxtbz,'Y','����','N','���ɵ�½') kdlxtbz";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b,dm_zwbm";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh(+) and sq_yhxx.ssfgs=b.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and sq_yhxx.sfzszg in('Y','N')";
	ls_sql+=" and (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000') OR sq_yhxx.yhdlm is null)";

	ls_sql+=" and sq_yhxx.dwbh='"+dwbh+"'";
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,sq_yhxx.yhmc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"������Ȩ"};//��ť����ʾ����
	String[] buttonLink={"SavePlOneBmSq.jsp?dwbh="+dwbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/xtsq/yhxx/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sq_yhxx_yhmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">������������Ȩ(ת���������ڡ���½����Ϊ��Ա��������ʾ)��ֻ����������Ա����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��Ȩ</td>
	<td  width="10%">�ֹ�˾</td>
	<td  width="14%">��������</td>
	<td  width="8%">Ա������</td>
	<td  width="10%">��ɫ</td>
	<td  width="10%">ְ��</td>
	<td  width="9%">����</td>
	<td  width="12%">�ͻ�������Ȩ��Χ</td>
	<td  width="6%">Ա�����</td>
	<td  width="10%">�û���½��</td>
	<td  width="7%">�ɵ�½ϵͳ</td>
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