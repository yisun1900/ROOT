<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
 
<% 
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String wheresql1="";
	String ls_sql2="";

	String fgsbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	
	String jzbz=request.getParameter("jzbz");
	if (jzbz!=null && !(jzbz.equals("0")))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
		wheresql1+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}


//	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
//	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

//	wheresql1+=" and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
//	wheresql1+=" and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (sjs!=null && !(sjs.equals("")))
	{wheresql+=" and crm_zxkhxx.sjs='"+sjs+"' ";}


	ls_sql2=" SELECT distinct cw_khfkjl.khbh khbh ";
	ls_sql2+=" FROM crm_khxx,cw_khfkjl";
	ls_sql2+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.sjs='"+sjs+"'";
	ls_sql2+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql2+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql2+=" and cw_khfkjl.scbz='N'  ";//N��δɾ����Y����ɾ��
	ls_sql2+=" and cw_khfkjl.fklxbm='53'  ";//53����Ʒ�
	ls_sql2+=" and cw_khfkjl.fkje!='0'  ";

//out.println(wheresql);
	ls_sql="SELECT '',crm_zxkhxx.sjs,crm_zxkhxx.hth,'<a href=\"/khxx/ViewHthCrm_khxx.jsp?hth='||crm_zxkhxx.hth||'\" target=\"_back\">'||crm_zxkhxx.khxm||'</a>',DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),DECODE(crm_khxx.zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),crm_khxx.tdsj,crm_khxx.qyrq ";
	ls_sql+=" ,crm_zxkhxx.dzbjze,TO_CHAR(crm_khxx.zkl),TO_CHAR(crm_khxx.zjxzkl)";
	ls_sql+=" ,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0),qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,crm_khxx.wdzgce,crm_khxx.qye,NVL(cdzwjmje,0),NVL(zqguanlif,0),NVL(guanlif,0),NVL(glfjmje,0),NVL(suijin,0),NVL(sjjmje,0) ";
	ls_sql+=" ,TO_CHAR(round(DECODE(crm_khxx.fwmj,0,0,qye/crm_khxx.fwmj))) pmjj,NVL(zhzjxje,0),NVL(zjxguanlif,0),NVL(zjxsuijin,0) ";
	ls_sql+=" ,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,crm_khxx.sjf,cwsfke,DECODE((qye+NVL(guanlif,0)+NVL(suijin,0)),0,'',ROUND(cwsfke*100/(qye+NVL(guanlif,0)+NVL(suijin,0)),1)||'%' ),sgdmc sgd,zjxm ,crm_khxx.cxhdbm ";

	ls_sql+=" FROM crm_khxx,sq_sgd,crm_zxkhxx";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=crm_zxkhxx.khbh";
//    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and crm_khxx.zt in ('2','3')";
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.khbh in ("+ls_sql2+") ";
	ls_sql+=" order by crm_khxx.sjs,crm_khxx.lrsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

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
	coluParmHash.put("fwdz",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ʦǩԼ��ϸ��ע�⣺�������˵���
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
  <td width="4%" rowspan="2">���ӱ����ܶ�</td>
  <td colspan="2">�ۿ�</td>
  <td colspan="2" bgcolor="#99FFFF">ҵ�������̷�+�����+˰��</td>
  <td colspan="3" bgcolor="#FFFF99">���̷�</td>
  <td colspan="3" bgcolor="#99FFFF">�����</td>
  <td colspan="2" bgcolor="#FFFFCC">˰��</td>
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
	<td  width="4%" bgcolor="#99FFFF">��ǰҵ��</td>
	<td  width="4%" bgcolor="#99FFFF">�ۺ�ҵ��</td>

	<td  width="4%" bgcolor="#FFFF99">����ԭ����</td>
	<td  width="4%" bgcolor="#FFFF99">����ǩԼ��</td>
	<td  width="3%" bgcolor="#FFFF99">�����</td>

	<td  width="3%" bgcolor="#99FFFF">��ǰ</td>
	<td  width="3%" bgcolor="#99FFFF">�ۺ�</td>
	<td  width="3%" bgcolor="#99FFFF">�����</td>

	<td  width="3%" bgcolor="#FFFFCC">˰��</td>
	<td  width="3%" bgcolor="#FFFFCC">�����</td>



	<td  width="3%" bgcolor="#FFFFCC">��������</td>
	<td  width="3%" bgcolor="#FFFFCC">���������</td>
	<td  width="3%" bgcolor="#FFFFCC">˰������</td>
  </tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>

</body>
</html>


