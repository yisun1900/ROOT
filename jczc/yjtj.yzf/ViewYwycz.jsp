<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";

	String dwbh=request.getParameter("fgsbh");
	String ywy=cf.GB2Uni(cf.getParameter(request,"ywy"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	wheresql+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


%>

<html>
<head>
<title>�鿴��ϸ��Ϣ</title>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ҵ��Ա��ת���˵���ҵ����ϸ��<%=ywy%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="1%" rowspan="2">&nbsp;</td>
  <td width="2%" rowspan="2">ҵ��Ա</td>
  <td width="3%" rowspan="2">��ͬ��</td>
  <td width="3%" rowspan="2">����</td>
  <td width="2%" rowspan="2">��װ��־</td>
  <td width="2%" rowspan="2">�ͻ�����</td>
  <td width="4%" rowspan="2" bgcolor="#99FFFF">Ӧ�˽��</td>
  <td width="4%" rowspan="2" bgcolor="#99FFFF">ʵ�˽��</td>
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
	ls_sql="SELECT '',cw_qmjzmx.ywy,cw_qmjzmx.hth,cw_qmjzmx.khxm,DECODE(cw_qmjzmx.jzbz,'1','��װ','2','��װ'),DECODE(cw_qmjzmx.zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),crm_tddj.ytje,crm_tddj.stje,cw_qmjzmx.tdsj,cw_qmjzmx.qyrq ";
	ls_sql+=" ,TO_CHAR(cw_qmjzmx.zkl),TO_CHAR(cw_qmjzmx.zjxzkl),cw_qmjzmx.wdzgce,cw_qmjzmx.qye,NVL(cw_qmjzmx.cdzwjmje,0),NVL(cw_qmjzmx.zqguanlif,0),NVL(cw_qmjzmx.guanlif,0),NVL(cw_qmjzmx.glfjmje,0),NVL(cw_qmjzmx.suijin,0),NVL(cw_qmjzmx.sjjmje,0) ";
	ls_sql+=" ,cw_qmjzmx.wdzgce+NVL(cw_qmjzmx.zqguanlif,0)+NVL(cw_qmjzmx.suijin,0),cw_qmjzmx.qye+NVL(cw_qmjzmx.guanlif,0)+NVL(cw_qmjzmx.suijin,0)";
	ls_sql+=" ,TO_CHAR(round(DECODE(cw_qmjzmx.fwmj,0,0,cw_qmjzmx.qye/cw_qmjzmx.fwmj))) pmjj,NVL(cw_qmjzmx.zhzjxje,0),NVL(cw_qmjzmx.zjxguanlif,0),NVL(cw_qmjzmx.zjxsuijin,0) ";
	ls_sql+=" ,NVL(cw_qmjzmx.zhzjxje,0)+NVL(cw_qmjzmx.zjxguanlif,0)+NVL(cw_qmjzmx.zjxsuijin,0)+cw_qmjzmx.qye+NVL(cw_qmjzmx.guanlif,0)+NVL(cw_qmjzmx.suijin,0) ";
	ls_sql+=" ,cw_qmjzmx.sjf,cw_qmjzmx.cwsfke,DECODE((cw_qmjzmx.qye+NVL(cw_qmjzmx.guanlif,0)+NVL(cw_qmjzmx.suijin,0)),0,'',ROUND(cw_qmjzmx.cwsfke*100/(cw_qmjzmx.qye+NVL(cw_qmjzmx.guanlif,0)+NVL(cw_qmjzmx.suijin,0)),1)||'%' ),sgdmc sgd,cw_qmjzmx.zjxm  ";

	ls_sql+=" FROM cw_qmjzmx,sq_sgd,crm_khxx,crm_tddj";
    ls_sql+=" where cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"' and cw_qmjzmx.ywy='"+ywy+"'";
	ls_sql+=" and cw_qmjzmx.zt in ('3')";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.tdxh=crm_tddj.tdxh";
	ls_sql+=wheresql;
	ls_sql+=" order by cw_qmjzmx.ywy,cw_qmjzmx.qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

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
  <B><font size="3">ҵ��Ա��ת��ǩ����ҵ����ϸ��<%=ywy%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="1%" rowspan="2">&nbsp;</td>
  <td width="2%" rowspan="2">ҵ��Ա</td>
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
	ls_sql="SELECT '',ywy,hth,khxm,DECODE(cw_qmjzmx.jzbz,'1','��װ','2','��װ'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),tdsj,qyrq ";
	ls_sql+=" ,TO_CHAR(zkl),TO_CHAR(zjxzkl),wdzgce,qye,NVL(cdzwjmje,0),NVL(zqguanlif,0),NVL(guanlif,0),NVL(glfjmje,0),NVL(suijin,0),NVL(sjjmje,0) ";
	ls_sql+=" ,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0),qye+NVL(guanlif,0)+NVL(suijin,0)";
	ls_sql+=" ,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,NVL(zhzjxje,0),NVL(zjxguanlif,0),NVL(zjxsuijin,0) ";
	ls_sql+=" ,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,sjf,cwsfke,DECODE((qye+NVL(guanlif,0)+NVL(suijin,0)),0,'',ROUND(cwsfke*100/(qye+NVL(guanlif,0)+NVL(suijin,0)),1)||'%' ),sgdmc sgd,zjxm ,cxhdbm ";

	ls_sql+=" FROM cw_qmjzmx,sq_sgd";
    ls_sql+=" where cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"' and cw_qmjzmx.ywy='"+ywy+"'";
	ls_sql+=" and cw_qmjzmx.zt in ('2')";
	ls_sql+=wheresql;
	ls_sql+=" order by ywy,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
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
 
 