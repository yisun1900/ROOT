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
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="1%" rowspan="2">&nbsp;</td>
  <td width="2%" rowspan="2">���ʦ</td>
  <td width="3%" rowspan="2">��ͬ��</td>
  <td width="3%" rowspan="2">����</td>
  <td width="2%" rowspan="2">��װ��־</td>
  <td width="2%" rowspan="2">�ͻ�����</td>
  <td width="3%" rowspan="2">�˵�ʱ��</td>
  <td width="3%" rowspan="2">ǩԼ����</td>
  <td width="4%" rowspan="2">���ӱ����ܶ�</td>
  <td colspan="2">�ۿ�</td>
  <td colspan="3" bgcolor="#FFFF99">���̷�</td>
  <td colspan="3" bgcolor="#99FFFF">�����</td>
  <td colspan="2" bgcolor="#FFFFCC">˰��</td>
  <td colspan="2" bgcolor="#FFFF99">ҵ�������̷�+�����+˰��</td>
  <td width="2%" rowspan="2">ƽ�׾���</td>
  <td colspan="3" bgcolor="#FFFFCC">������ۺ�</td>
  <td width="5%" rowspan="2" bgcolor="#FFFF99">�������ܶ� </td>
  <td width="4%" rowspan="2">��Ʒ�</td>
  <td width="5%" rowspan="2">�����װʵ�տ��</td>
  <td width="2%" rowspan="2" bgcolor="#FFFF99">ʵ�տ����</td>
  <td width="2%" rowspan="2">ʩ����</td>
  <td width="2%" rowspan="2">�ʼ�Ա</td>
  <td width="8%" rowspan="2">�����</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">��ͬ</td>
	<td  width="2%">������</td>

	<td  width="4%" bgcolor="#FFFF99">����ԭ����</td>
	<td  width="4%" bgcolor="#FFFF99">����ǩԼ��</td>
	<td  width="3%" bgcolor="#FFFF99">�����</td>

	<td  width="3%" bgcolor="#99FFFF">��ǰ</td>
	<td  width="3%" bgcolor="#99FFFF">�ۺ�</td>
	<td  width="3%" bgcolor="#99FFFF">�����</td>

	<td  width="3%" bgcolor="#FFFFCC">˰��</td>
	<td  width="3%" bgcolor="#FFFFCC">�����</td>


	<td  width="4%" bgcolor="#FFFF99">��ǰҵ��</td>
	<td  width="4%" bgcolor="#FFFF99">�ۺ�ҵ��</td>

	<td  width="3%" bgcolor="#FFFFCC">��������</td>
	<td  width="3%" bgcolor="#FFFFCC">���������</td>
	<td  width="3%" bgcolor="#FFFFCC">˰������</td>
  </tr>
<%
	ls_sql="SELECT '',crm_zxkhxx.sjs,crm_zxkhxx.hth,crm_zxkhxx.khxm,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),DECODE(crm_khxx.zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),crm_khxx.tdsj,crm_khxx.qyrq ";
	ls_sql+=" ,crm_zxkhxx.dzbjze,TO_CHAR(crm_khxx.zkl),TO_CHAR(crm_khxx.zjxzkl),crm_khxx.wdzgce,crm_khxx.qye,NVL(cdzwjmje,0),NVL(zqguanlif,0),NVL(guanlif,0),NVL(glfjmje,0),NVL(suijin,0),NVL(sjjmje,0) ";
	ls_sql+=" ,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0),qye+NVL(guanlif,0)+NVL(suijin,0)";
	ls_sql+=" ,TO_CHAR(round(DECODE(crm_khxx.fwmj,0,0,qye/crm_khxx.fwmj))) pmjj,NVL(zhzjxje,0),NVL(zjxguanlif,0),NVL(zjxsuijin,0) ";
	ls_sql+=" ,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,crm_khxx.sjf,cwsfke,DECODE((qye+NVL(guanlif,0)+NVL(suijin,0)),0,'',ROUND(cwsfke*100/(qye+NVL(guanlif,0)+NVL(suijin,0)),1)||'%' ),sgdmc sgd,zjxm ,crm_khxx.cxhdbm ";

	ls_sql+=" FROM crm_khxx,sq_sgd,crm_zxkhxx";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=crm_zxkhxx.khbh";
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
	pageObj.printDateSum(true);
%> 
</table>

<CENTER >
  <B><font size="3">���£�ǩ����ҵ��ͳ�ƣ�<%=dwmc%>��
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="1%" rowspan="2">&nbsp;</td>
  <td width="2%" rowspan="2">���ʦ</td>
  <td width="3%" rowspan="2">��ͬ��</td>
  <td width="3%" rowspan="2">����</td>
  <td width="2%" rowspan="2">��װ��־</td>
  <td width="2%" rowspan="2">�ͻ�����</td>
  <td width="3%" rowspan="2">�˵�ʱ��</td>
  <td width="3%" rowspan="2">ǩԼ����</td>
  <td width="4%" rowspan="2">���ӱ����ܶ�</td>
  <td colspan="2">�ۿ�</td>
  <td colspan="3" bgcolor="#FFFF99">���̷�</td>
  <td colspan="3" bgcolor="#99FFFF">�����</td>
  <td colspan="2" bgcolor="#FFFFCC">˰��</td>
  <td colspan="2" bgcolor="#FFFF99">ҵ�������̷�+�����+˰��</td>
  <td width="2%" rowspan="2">ƽ�׾���</td>
  <td colspan="3" bgcolor="#FFFFCC">������ۺ�</td>
  <td width="5%" rowspan="2" bgcolor="#FFFF99">�������ܶ� </td>
  <td width="4%" rowspan="2">��Ʒ�</td>
  <td width="5%" rowspan="2">�����װʵ�տ��</td>
  <td width="2%" rowspan="2" bgcolor="#FFFF99">ʵ�տ����</td>
  <td width="2%" rowspan="2">ʩ����</td>
  <td width="2%" rowspan="2">�ʼ�Ա</td>
  <td width="8%" rowspan="2">�����</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">��ͬ</td>
	<td  width="2%">������</td>

	<td  width="4%" bgcolor="#FFFF99">����ԭ����</td>
	<td  width="4%" bgcolor="#FFFF99">����ǩԼ��</td>
	<td  width="3%" bgcolor="#FFFF99">�����</td>

	<td  width="3%" bgcolor="#99FFFF">��ǰ</td>
	<td  width="3%" bgcolor="#99FFFF">�ۺ�</td>
	<td  width="3%" bgcolor="#99FFFF">�����</td>

	<td  width="3%" bgcolor="#FFFFCC">˰��</td>
	<td  width="3%" bgcolor="#FFFFCC">�����</td>


	<td  width="4%" bgcolor="#FFFF99">��ǰҵ��</td>
	<td  width="4%" bgcolor="#FFFF99">�ۺ�ҵ��</td>

	<td  width="3%" bgcolor="#FFFFCC">��������</td>
	<td  width="3%" bgcolor="#FFFFCC">���������</td>
	<td  width="3%" bgcolor="#FFFFCC">˰������</td>
  </tr>
<%
	ls_sql="SELECT '',crm_zxkhxx.sjs,crm_zxkhxx.hth,crm_zxkhxx.khxm,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),DECODE(crm_khxx.zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),crm_khxx.tdsj,crm_khxx.qyrq ";
	ls_sql+=" ,crm_zxkhxx.dzbjze,TO_CHAR(crm_khxx.zkl),TO_CHAR(crm_khxx.zjxzkl),crm_khxx.wdzgce,crm_khxx.qye,NVL(cdzwjmje,0),NVL(zqguanlif,0),NVL(guanlif,0),NVL(glfjmje,0),NVL(suijin,0),NVL(sjjmje,0) ";
	ls_sql+=" ,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0),qye+NVL(guanlif,0)+NVL(suijin,0)";
	ls_sql+=" ,TO_CHAR(round(DECODE(crm_khxx.fwmj,0,0,qye/crm_khxx.fwmj))) pmjj,NVL(zhzjxje,0),NVL(zjxguanlif,0),NVL(zjxsuijin,0) ";
	ls_sql+=" ,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,crm_khxx.sjf,cwsfke,DECODE((qye+NVL(guanlif,0)+NVL(suijin,0)),0,'',ROUND(cwsfke*100/(qye+NVL(guanlif,0)+NVL(suijin,0)),1)||'%' ),sgdmc sgd,zjxm ,crm_khxx.cxhdbm ";

	ls_sql+=" FROM crm_khxx,sq_sgd,sq_dwxx,crm_zxkhxx";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=crm_zxkhxx.khbh";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";

	ls_sql+=" and crm_khxx.zt in ('2') and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.yjjzsj is null";//δ��ת�ĵ�������������
	ls_sql+=" and crm_khxx.cwsfke>=(qye+NVL(guanlif,0)+NVL(suijin,0))*((sq_dwxx.jryjbfb-0.5)/100)";

	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.sjs,crm_khxx.qyrq";

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
	pageObj.printDateSum(true);
%> 
</table>

</body>
</html>
