<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";

	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	
	String jzbz=request.getParameter("jzbz");
	if (!jzbz.equals("0"))
	{
		wheresql+=" and  cw_qmjzmx.jzbz='"+jzbz+"'";
	}

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	wheresql+=" and jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�˵���ϸ��<%=dwmc%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
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

	<td  width="5%" bgcolor="#FFFF99">����ԭ����</td>
	<td  width="5%" bgcolor="#FFFF99">����ǩԼ��</td>
	<td  width="3%" bgcolor="#FFFF99">�����</td>

	<td  width="3%" bgcolor="#99FFFF">��ǰ</td>
	<td  width="3%" bgcolor="#99FFFF">�ۺ�</td>
	<td  width="3%" bgcolor="#99FFFF">�����</td>

	<td  width="3%" bgcolor="#FFFFCC">˰��</td>
	<td  width="3%" bgcolor="#FFFFCC">�����</td>


	<td  width="5%" bgcolor="#FFFF99">��ǰҵ��</td>
	<td  width="5%" bgcolor="#FFFF99">�ۺ�ҵ��</td>

	<td  width="3%" bgcolor="#FFFFCC">��������</td>
	<td  width="3%" bgcolor="#FFFFCC">���������</td>
	<td  width="3%" bgcolor="#FFFFCC">˰������</td>
  </tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,DECODE(cw_qmjzmx.jzbz,'1','��װ','2','��װ'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),tdsj,qyrq ";
	ls_sql+=" ,TO_CHAR(zkl),TO_CHAR(zjxzkl),wdzgce,qye,NVL(cdzwjmje,0),NVL(zqguanlif,0),NVL(guanlif,0),NVL(glfjmje,0),NVL(suijin,0),NVL(sjjmje,0) ";
	ls_sql+=" ,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0),qye+NVL(guanlif,0)+NVL(suijin,0)";
	ls_sql+=" ,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,NVL(zhzjxje,0),NVL(zjxguanlif,0),NVL(zjxsuijin,0) ";
	ls_sql+=" ,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,sjf,cwsfke,DECODE((qye+NVL(guanlif,0)+NVL(suijin,0)),0,'',ROUND(cwsfke*100/(qye+NVL(guanlif,0)+NVL(suijin,0)),1)||'%' ),sgdmc sgd,zjxm ,cxhdbm ";

	ls_sql+=" FROM cw_qmjzmx,sq_sgd";
    ls_sql+=" where cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=wheresql;
	ls_sql+=" order by cw_qmjzmx.sjs,qyrq";

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
  <B><font size="3">ǩ����ϸ��<%=dwmc%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
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

	<td  width="5%" bgcolor="#FFFF99">����ԭ����</td>
	<td  width="5%" bgcolor="#FFFF99">����ǩԼ��</td>
	<td  width="3%" bgcolor="#FFFF99">�����</td>

	<td  width="3%" bgcolor="#99FFFF">��ǰ</td>
	<td  width="3%" bgcolor="#99FFFF">�ۺ�</td>
	<td  width="3%" bgcolor="#99FFFF">�����</td>

	<td  width="3%" bgcolor="#FFFFCC">˰��</td>
	<td  width="3%" bgcolor="#FFFFCC">�����</td>


	<td  width="5%" bgcolor="#FFFF99">��ǰҵ��</td>
	<td  width="5%" bgcolor="#FFFF99">�ۺ�ҵ��</td>

	<td  width="3%" bgcolor="#FFFFCC">��������</td>
	<td  width="3%" bgcolor="#FFFFCC">���������</td>
	<td  width="3%" bgcolor="#FFFFCC">˰������</td>
  </tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,DECODE(cw_qmjzmx.jzbz,'1','��װ','2','��װ'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),tdsj,qyrq ";
	ls_sql+=" ,TO_CHAR(zkl),TO_CHAR(zjxzkl),wdzgce,qye,NVL(cdzwjmje,0),NVL(zqguanlif,0),NVL(guanlif,0),NVL(glfjmje,0),NVL(suijin,0),NVL(sjjmje,0) ";
	ls_sql+=" ,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0),qye+NVL(guanlif,0)+NVL(suijin,0)";
	ls_sql+=" ,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,NVL(zhzjxje,0),NVL(zjxguanlif,0),NVL(zjxsuijin,0) ";
	ls_sql+=" ,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,sjf,cwsfke,DECODE((qye+NVL(guanlif,0)+NVL(suijin,0)),0,'',ROUND(cwsfke*100/(qye+NVL(guanlif,0)+NVL(suijin,0)),1)||'%' ),sgdmc sgd,zjxm ,cxhdbm ";

	ls_sql+=" FROM cw_qmjzmx,sq_sgd";
    ls_sql+=" where cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=wheresql;
	ls_sql+=" order by cw_qmjzmx.sjs,qyrq";

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
