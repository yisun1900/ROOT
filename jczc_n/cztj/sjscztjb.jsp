<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String wheresql1="";
	String ordersql=null;

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String px=request.getParameter("px");
	String sx=request.getParameter("sx");
	String jzbz=request.getParameter("jzbz");
	String sjs=cf.GB2Uni(request.getParameter("sjs"));
	if (px!=null && !(px.equals("")))
	{
		if (sx!=null && sx.equals("0"))
		{
		ordersql=" order by "+px+" desc ";
		}
		else
		{ordersql=" order by "+px+" ";}
	}
	else
	{ordersql=" order by 2 ";}
//	out.print(ordersql);




	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";

	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}

//	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+fgsbh+"'");

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	wheresql1+=" and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql1+=" and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

//out.println(wheresql);
	ls_sql="SELECT '','<A HREF=\"ViewSjssjf.jsp?dwbh='||crm_khxx.dwbh||'&sjfw="+sjfw+"&sjfw2="+sjfw2+"&sjs='||crm_zxkhxx.sjs||'&jzbz="+jzbz+"\" target=\"_blank\">'||crm_zxkhxx.sjs||'</a>',dwmc,count(*),sum(crm_zxkhxx.dzbjze),ROUND(sum(crm_khxx.zkl)/count(*),2),ROUND(sum(crm_khxx.zjxzkl)/count(*),2),sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)),sum(qye+NVL(guanlif,0)+NVL(suijin,0)),sum(crm_khxx.wdzgce),sum(crm_khxx.qye),sum(NVL(cdzwjmje,0)),sum(NVL(zqguanlif,0)),sum(NVL(guanlif,0)),sum(NVL(glfjmje,0)),sum(NVL(suijin,0)),sum(NVL(sjjmje,0)),ROUND(sum(round(DECODE(crm_khxx.fwmj,0,0,qye/crm_khxx.fwmj)))/count(*),2),sum(NVL(zhzjxje,0)),sum(NVL(zjxguanlif,0)),sum(NVL(zjxsuijin,0)),sum(NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ),sum(crm_khxx.sjf),sum(cwsfke) ";

	ls_sql+=" FROM crm_khxx,sq_sgd,crm_zxkhxx,sq_dwxx";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
//    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and crm_khxx.zt in ('2')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.dwbh,dwmc,'<A HREF=\"ViewSjssjf.jsp?dwbh='||crm_khxx.dwbh||'&sjfw="+sjfw+"&sjfw2="+sjfw2+"&sjs='||crm_zxkhxx.sjs||'&jzbz="+jzbz+"\" target=\"_blank\">'||crm_zxkhxx.sjs||'</a>'";
	ls_sql+=ordersql;

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
  <B><font size="3">����ǩԼ��ϸ��ע�⣺�������˵���
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="1%" rowspan="2">&nbsp;</td>
  <td width="2%" rowspan="2">���ʦ</td>
  <td width="4%" rowspan="2">����</td>
  <td width="2%" rowspan="2">ǩԼ��</td>
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
  <td width="4%" rowspan="2">�����װʵ�տ��</td>
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

