<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String oa_xcplqsq_sqxh=null;
	String oa_xcplqsq_dwbh=null;
	String oa_xcplqsq_fgsbh=null;
	String oa_xcplqsq_slr=null;
	String oa_xcplqsq_jhlqrq=null;
	String oa_xcplqsq_lrr=null;
	String oa_xcplqsq_lrrq=null;
	String oa_xcplqsq_sfxsp=null;
	String oa_xcplqsq_lqzt=null;
	String oa_xcplqsq_yjspr=null;
	String oa_xcplqsq_yjspsj=null;
	String oa_xcplqsq_yjspjl=null;
	String oa_xcplqsq_ejspr=null;
	String oa_xcplqsq_ejspsj=null;
	String oa_xcplqsq_ejspjl=null;
	String oa_xcplqsq_sjspr=null;
	String oa_xcplqsq_sjspsj=null;
	String oa_xcplqsq_sjspjl=null;
	String oa_xcplqsq_blr=null;
	String oa_xcplqsq_lqsj=null;

	String xcpbm=null;
	xcpbm=request.getParameter("xcpbm");
	if (xcpbm!=null)
	{
		xcpbm=cf.GB2Uni(xcpbm);
		if (!(xcpbm.equals("")))	wheresql+=" and  (oa_xcplqmx.xcpbm='"+xcpbm+"')";
	}
	String xcpmc=null;
	xcpmc=request.getParameter("xcpmc");
	if (xcpmc!=null)
	{
		xcpmc=cf.GB2Uni(xcpmc);
		if (!(xcpmc.equals("")))	wheresql+=" and  (oa_xcplqmx.xcpmc='"+xcpmc+"')";
	}
	String xcpflbm=null;
	xcpflbm=request.getParameter("xcpflbm");
	if (xcpflbm!=null)
	{
		xcpflbm=cf.GB2Uni(xcpflbm);
		if (!(xcpflbm.equals("")))	wheresql+=" and  (oa_xcplqmx.xcpflbm='"+xcpflbm+"')";
	}
	
	
	oa_xcplqsq_sqxh=request.getParameter("oa_xcplqsq_sqxh");
	if (oa_xcplqsq_sqxh!=null)
	{
		oa_xcplqsq_sqxh=oa_xcplqsq_sqxh.trim();
		if (!(oa_xcplqsq_sqxh.equals("")))	wheresql+=" and (oa_xcplqsq.sqxh="+oa_xcplqsq_sqxh+") ";
	}
	oa_xcplqsq_dwbh=request.getParameter("oa_xcplqsq_dwbh");
	if (oa_xcplqsq_dwbh!=null)
	{
		oa_xcplqsq_dwbh=cf.GB2Uni(oa_xcplqsq_dwbh);
		if (!(oa_xcplqsq_dwbh.equals("")))	wheresql+=" and  (oa_xcplqsq.dwbh='"+oa_xcplqsq_dwbh+"')";
	}
	oa_xcplqsq_fgsbh=request.getParameter("oa_xcplqsq_fgsbh");
	if (oa_xcplqsq_fgsbh!=null)
	{
		oa_xcplqsq_fgsbh=cf.GB2Uni(oa_xcplqsq_fgsbh);
		if (!(oa_xcplqsq_fgsbh.equals("")))	wheresql+=" and  (oa_xcplqsq.fgsbh='"+oa_xcplqsq_fgsbh+"')";
	}
	oa_xcplqsq_slr=request.getParameter("oa_xcplqsq_slr");
	if (oa_xcplqsq_slr!=null)
	{
		oa_xcplqsq_slr=cf.GB2Uni(oa_xcplqsq_slr);
		if (!(oa_xcplqsq_slr.equals("")))	wheresql+=" and  (oa_xcplqsq.slr='"+oa_xcplqsq_slr+"')";
	}
	oa_xcplqsq_jhlqrq=request.getParameter("oa_xcplqsq_jhlqrq");
	if (oa_xcplqsq_jhlqrq!=null)
	{
		oa_xcplqsq_jhlqrq=oa_xcplqsq_jhlqrq.trim();
		if (!(oa_xcplqsq_jhlqrq.equals("")))	wheresql+="  and (oa_xcplqsq.jhlqrq>=TO_DATE('"+oa_xcplqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_jhlqrq=request.getParameter("oa_xcplqsq_jhlqrq2");
	if (oa_xcplqsq_jhlqrq!=null)
	{
		oa_xcplqsq_jhlqrq=oa_xcplqsq_jhlqrq.trim();
		if (!(oa_xcplqsq_jhlqrq.equals("")))	wheresql+="  and (oa_xcplqsq.jhlqrq<=TO_DATE('"+oa_xcplqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_lrr=request.getParameter("oa_xcplqsq_lrr");
	if (oa_xcplqsq_lrr!=null)
	{
		oa_xcplqsq_lrr=cf.GB2Uni(oa_xcplqsq_lrr);
		if (!(oa_xcplqsq_lrr.equals("")))	wheresql+=" and  (oa_xcplqsq.lrr='"+oa_xcplqsq_lrr+"')";
	}
	oa_xcplqsq_lrrq=request.getParameter("oa_xcplqsq_lrrq");
	if (oa_xcplqsq_lrrq!=null)
	{
		oa_xcplqsq_lrrq=oa_xcplqsq_lrrq.trim();
		if (!(oa_xcplqsq_lrrq.equals("")))	wheresql+="  and (oa_xcplqsq.lrrq>=TO_DATE('"+oa_xcplqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_lrrq=request.getParameter("oa_xcplqsq_lrrq2");
	if (oa_xcplqsq_lrrq!=null)
	{
		oa_xcplqsq_lrrq=oa_xcplqsq_lrrq.trim();
		if (!(oa_xcplqsq_lrrq.equals("")))	wheresql+="  and (oa_xcplqsq.lrrq<=TO_DATE('"+oa_xcplqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_sfxsp=request.getParameter("oa_xcplqsq_sfxsp");
	if (oa_xcplqsq_sfxsp!=null)
	{
		oa_xcplqsq_sfxsp=cf.GB2Uni(oa_xcplqsq_sfxsp);
		if (!(oa_xcplqsq_sfxsp.equals("")))	wheresql+=" and  (oa_xcplqsq.sfxsp='"+oa_xcplqsq_sfxsp+"')";
	}
	oa_xcplqsq_lqzt=request.getParameter("oa_xcplqsq_lqzt");
	if (oa_xcplqsq_lqzt!=null)
	{
		oa_xcplqsq_lqzt=cf.GB2Uni(oa_xcplqsq_lqzt);
		if (!(oa_xcplqsq_lqzt.equals("")))	wheresql+=" and  (oa_xcplqsq.lqzt='"+oa_xcplqsq_lqzt+"')";
	}
	oa_xcplqsq_yjspr=request.getParameter("oa_xcplqsq_yjspr");
	if (oa_xcplqsq_yjspr!=null)
	{
		oa_xcplqsq_yjspr=cf.GB2Uni(oa_xcplqsq_yjspr);
		if (!(oa_xcplqsq_yjspr.equals("")))	wheresql+=" and  (oa_xcplqsq.yjspr='"+oa_xcplqsq_yjspr+"')";
	}
	oa_xcplqsq_yjspsj=request.getParameter("oa_xcplqsq_yjspsj");
	if (oa_xcplqsq_yjspsj!=null)
	{
		oa_xcplqsq_yjspsj=oa_xcplqsq_yjspsj.trim();
		if (!(oa_xcplqsq_yjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.yjspsj>=TO_DATE('"+oa_xcplqsq_yjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_yjspsj=request.getParameter("oa_xcplqsq_yjspsj2");
	if (oa_xcplqsq_yjspsj!=null)
	{
		oa_xcplqsq_yjspsj=oa_xcplqsq_yjspsj.trim();
		if (!(oa_xcplqsq_yjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.yjspsj<=TO_DATE('"+oa_xcplqsq_yjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_yjspjl=request.getParameter("oa_xcplqsq_yjspjl");
	if (oa_xcplqsq_yjspjl!=null)
	{
		oa_xcplqsq_yjspjl=cf.GB2Uni(oa_xcplqsq_yjspjl);
		if (!(oa_xcplqsq_yjspjl.equals("")))	wheresql+=" and  (oa_xcplqsq.yjspjl='"+oa_xcplqsq_yjspjl+"')";
	}
	oa_xcplqsq_ejspr=request.getParameter("oa_xcplqsq_ejspr");
	if (oa_xcplqsq_ejspr!=null)
	{
		oa_xcplqsq_ejspr=cf.GB2Uni(oa_xcplqsq_ejspr);
		if (!(oa_xcplqsq_ejspr.equals("")))	wheresql+=" and  (oa_xcplqsq.ejspr='"+oa_xcplqsq_ejspr+"')";
	}
	oa_xcplqsq_ejspsj=request.getParameter("oa_xcplqsq_ejspsj");
	if (oa_xcplqsq_ejspsj!=null)
	{
		oa_xcplqsq_ejspsj=oa_xcplqsq_ejspsj.trim();
		if (!(oa_xcplqsq_ejspsj.equals("")))	wheresql+="  and (oa_xcplqsq.ejspsj>=TO_DATE('"+oa_xcplqsq_ejspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_ejspsj=request.getParameter("oa_xcplqsq_ejspsj2");
	if (oa_xcplqsq_ejspsj!=null)
	{
		oa_xcplqsq_ejspsj=oa_xcplqsq_ejspsj.trim();
		if (!(oa_xcplqsq_ejspsj.equals("")))	wheresql+="  and (oa_xcplqsq.ejspsj<=TO_DATE('"+oa_xcplqsq_ejspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_ejspjl=request.getParameter("oa_xcplqsq_ejspjl");
	if (oa_xcplqsq_ejspjl!=null)
	{
		oa_xcplqsq_ejspjl=cf.GB2Uni(oa_xcplqsq_ejspjl);
		if (!(oa_xcplqsq_ejspjl.equals("")))	wheresql+=" and  (oa_xcplqsq.ejspjl='"+oa_xcplqsq_ejspjl+"')";
	}
	oa_xcplqsq_sjspr=request.getParameter("oa_xcplqsq_sjspr");
	if (oa_xcplqsq_sjspr!=null)
	{
		oa_xcplqsq_sjspr=cf.GB2Uni(oa_xcplqsq_sjspr);
		if (!(oa_xcplqsq_sjspr.equals("")))	wheresql+=" and  (oa_xcplqsq.sjspr='"+oa_xcplqsq_sjspr+"')";
	}
	oa_xcplqsq_sjspsj=request.getParameter("oa_xcplqsq_sjspsj");
	if (oa_xcplqsq_sjspsj!=null)
	{
		oa_xcplqsq_sjspsj=oa_xcplqsq_sjspsj.trim();
		if (!(oa_xcplqsq_sjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.sjspsj>=TO_DATE('"+oa_xcplqsq_sjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_sjspsj=request.getParameter("oa_xcplqsq_sjspsj2");
	if (oa_xcplqsq_sjspsj!=null)
	{
		oa_xcplqsq_sjspsj=oa_xcplqsq_sjspsj.trim();
		if (!(oa_xcplqsq_sjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.sjspsj<=TO_DATE('"+oa_xcplqsq_sjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_sjspjl=request.getParameter("oa_xcplqsq_sjspjl");
	if (oa_xcplqsq_sjspjl!=null)
	{
		oa_xcplqsq_sjspjl=cf.GB2Uni(oa_xcplqsq_sjspjl);
		if (!(oa_xcplqsq_sjspjl.equals("")))	wheresql+=" and  (oa_xcplqsq.sjspjl='"+oa_xcplqsq_sjspjl+"')";
	}
	oa_xcplqsq_blr=request.getParameter("oa_xcplqsq_blr");
	if (oa_xcplqsq_blr!=null)
	{
		oa_xcplqsq_blr=cf.GB2Uni(oa_xcplqsq_blr);
		if (!(oa_xcplqsq_blr.equals("")))	wheresql+=" and  (oa_xcplqsq.blr='"+oa_xcplqsq_blr+"')";
	}
	oa_xcplqsq_lqsj=request.getParameter("oa_xcplqsq_lqsj");
	if (oa_xcplqsq_lqsj!=null)
	{
		oa_xcplqsq_lqsj=oa_xcplqsq_lqsj.trim();
		if (!(oa_xcplqsq_lqsj.equals("")))	wheresql+="  and (oa_xcplqsq.lqsj>=TO_DATE('"+oa_xcplqsq_lqsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_lqsj=request.getParameter("oa_xcplqsq_lqsj2");
	if (oa_xcplqsq_lqsj!=null)
	{
		oa_xcplqsq_lqsj=oa_xcplqsq_lqsj.trim();
		if (!(oa_xcplqsq_lqsj.equals("")))	wheresql+="  and (oa_xcplqsq.lqsj<=TO_DATE('"+oa_xcplqsq_lqsj+"','YYYY/MM/DD'))";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");
	
	
	ls_sql="SELECT oa_xcplqsq.sqxh, DECODE(oa_xcplqsq.lqzt,'1','δ���','2','�������','3','һ������','4','��������','5','��������','6','����ȡ') lqzt,a.dwmc dw,oa_xcplqsq.slr,oa_xcplqsq.jhlqrq,oa_xcplqsq.blr,oa_xcplqsq.lqsj,oa_xcplqmx.xcpmc,oa_xcplqmx.jhlqsl,oa_xcplqmx.slqsl,oa_xcplqmx.jldw,TO_CHAR(oa_xcplqmx.dj),oa_xcplqmx.jhlqsl*oa_xcplqmx.dj,oa_xcplqmx.slqsl*oa_xcplqmx.dj, DECODE(oa_xcplqmx.sfxsp,'N','����Ҫ','Y','��Ҫ'),oa_xcplqmx.xcpbm,xcpflmc";
	ls_sql+=" FROM oa_xcplqsq,sq_dwxx a,oa_xcplqmx,oa_xcpflbm  ";
    ls_sql+=" where oa_xcplqsq.dwbh=a.dwbh(+) ";
    ls_sql+=" and oa_xcplqsq.sqxh=oa_xcplqmx.sqxh and oa_xcplqmx.xcpflbm=oa_xcpflbm.xcpflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Oa_xcplqmxCxList.jsp","SelectCxOa_xcplqmx.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","oa_xcplqsq_fgsbh","oa_xcplqsq_slr","oa_xcplqsq_jhlqrq","oa_xcplqsq_lrr","oa_xcplqsq_lrrq","oa_xcplqsq_sfxsp","oa_xcplqsq_lqzt","oa_xcplqsq_yjspr","oa_xcplqsq_yjspsj","oa_xcplqsq_yjspjl","oa_xcplqsq_yjspsm","oa_xcplqsq_ejspr","oa_xcplqsq_ejspsj","oa_xcplqsq_ejspjl","oa_xcplqsq_ejspsm","oa_xcplqsq_sjspr","oa_xcplqsq_sjspsj","oa_xcplqsq_sjspjl","oa_xcplqsq_sjspsm","oa_xcplqsq_blr","oa_xcplqsq_lqsj","oa_xcplqsq_jhlqsl","oa_xcplqsq_jhlqje","oa_xcplqsq_slqsl","oa_xcplqsq_slqje","oa_xcplqsq_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sqxh","1");//�в����������Hash��
	spanColHash.put("lqzt","1");//�в����������Hash��
	spanColHash.put("dw","1");//�в����������Hash��
	spanColHash.put("slr","1");//�в����������Hash��
	spanColHash.put("jhlqrq","1");//�в����������Hash��
	spanColHash.put("blr","1");//�в����������Hash��
	spanColHash.put("lqsj","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ��ȡ��ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�������</td>
	<td  width="6%">��ȡ״̬</td>
	<td  width="9%">���쵥λ</td>
	<td  width="4%">������</td>
	<td  width="6%">�ƻ���ȡ����</td>
	<td  width="4%">������</td>
	<td  width="6%">��ȡʱ��</td>
	<td  width="12%">ӡˢƷ����</td>
	<td  width="5%">�ƻ���ȡ����</td>
	<td  width="5%">ʵ��ȡ����</td>
	<td  width="4%">������λ</td>
	<td  width="5%">����</td>
	<td  width="7%">�ƻ���ȡ���</td>
	<td  width="7%">ʵ��ȡ���</td>
	<td  width="4%">�Ƿ�������</td>
	<td  width="4%">ӡˢƷ����</td>
	<td  width="8%">ӡˢƷ����</td>
</tr>
<%
	pageObj.displayDateSum();
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