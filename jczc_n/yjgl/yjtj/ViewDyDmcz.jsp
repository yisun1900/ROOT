<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";

	String dwbh=request.getParameter("dwbh");
	
	String jzbz=request.getParameter("jzbz");
	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���£��˵���ҵ��ͳ�ƣ�<%=dwmc%>��
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">���ʦ</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">����</td>
	<td  width="4%">��װ��־</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="6%">�˵�ʱ��</td>
	<td  width="6%">ǩԼ����</td>
	<td  width="6%">�����</td>
	<td  width="6%">δ���۽��</td>
	<td  width="4%">�ۿ���</td>
	<td  width="6%">����ǩԼ��</td>
	<td  width="5%">ƽ�׾���</td>
	<td  width="5%">������</td>
	<td  width="7%">�������ܶ� </td>
	<td  width="5%">��Ʒ�</td>
	<td  width="6%">�����װʵ�տ��</td>
	<td  width="4%">ʵ�տ����</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ʼ�Ա</td>
</tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),tdsj,qyrq,cxhdbm,wdzgce,TO_CHAR(zkl),qye,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,zhzjxje,NVL(zhzjxje,0)+qye,sjf,cwsfke,DECODE(qye,0,'',ROUND(cwsfke*100/qye,1)||'%' ),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_sgd";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt in ('3')";
	ls_sql+=" and crm_khxx.yjjzsj is not null";
	ls_sql+=" and crm_khxx.tdyjjzsj is null";//δ��ת�ĵ�������������
	
	ls_sql+=wheresql;
	ls_sql+=" order by sjs,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>

<CENTER >
  <B><font size="3">���£�ǩ����ҵ��ͳ�ƣ�<%=dwmc%>��
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">���ʦ</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">����</td>
	<td  width="4%">��װ��־</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="6%">�˵�ʱ��</td>
	<td  width="6%">ǩԼ����</td>
	<td  width="6%">�����</td>
	<td  width="6%">δ���۽��</td>
	<td  width="4%">�ۿ���</td>
	<td  width="6%">����ǩԼ��</td>
	<td  width="5%">ƽ�׾���</td>
	<td  width="5%">������</td>
	<td  width="7%">�������ܶ� </td>
	<td  width="5%">��Ʒ�</td>
	<td  width="6%">�����װʵ�տ��</td>
	<td  width="4%">ʵ�տ����</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ʼ�Ա</td>
</tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),tdsj,qyrq,cxhdbm,wdzgce,TO_CHAR(zkl),qye,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,zhzjxje,NVL(zhzjxje,0)+qye,sjf,cwsfke,DECODE(qye,0,'',ROUND(cwsfke*100/qye,1)||'%' ),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_sgd,sq_dwxx";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";

	ls_sql+=" and crm_khxx.zt in ('2') and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.yjjzsj is null";//δ��ת�ĵ�������������
	ls_sql+=" and crm_khxx.cwsfke>=qye*((sq_dwxx.jryjbfb-0.5)/100)";

	ls_sql+=wheresql;
	ls_sql+=" order by sjs,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash.put("sjs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>

</body>
</html>
