<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ƭͳ�Ʊ�</font></B>
</CENTER>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";
	String xz_mpyzsq_sqxh=null;
	String xz_mpyzsq_xm=null;
	String xz_mpyzsq_zw=null;
	String xz_mpyzsq_dwbh=null;
	String xz_mpyzsq_sqrq=null;
	String xz_mpyzsq_wcsj=null;
	String xz_mpyzsq_sfywc=null;
	String mpbb=null;
	String dj=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (xz_mpyzsq.ssfgs='"+ssfgs+"')";
	}

	xz_mpyzsq_sqxh=request.getParameter("xz_mpyzsq_sqxh");
	if (xz_mpyzsq_sqxh!=null)
	{
		xz_mpyzsq_sqxh=cf.GB2Uni(xz_mpyzsq_sqxh);
		if (!(xz_mpyzsq_sqxh.equals("")))	wheresql+=" and  (xz_mpyzsq.sqxh='"+xz_mpyzsq_sqxh+"')";
	}
	xz_mpyzsq_sfywc=request.getParameter("xz_mpyzsq_sfywc");
	if (xz_mpyzsq_sfywc!=null)
	{
		xz_mpyzsq_sfywc=cf.GB2Uni(xz_mpyzsq_sfywc);
		if (!(xz_mpyzsq_sfywc.equals("")))	wheresql+=" and  (xz_mpyzsq.sfywc='"+xz_mpyzsq_sfywc+"')";
	}

	xz_mpyzsq_xm=request.getParameter("xz_mpyzsq_xm");
	if (xz_mpyzsq_xm!=null)
	{
		xz_mpyzsq_xm=cf.GB2Uni(xz_mpyzsq_xm);
		if (!(xz_mpyzsq_xm.equals("")))	wheresql+=" and  (xz_mpyzsq.xm like '%"+xz_mpyzsq_xm+"%')";
	}
	xz_mpyzsq_zw=request.getParameter("xz_mpyzsq_zw");
	if (xz_mpyzsq_zw!=null)
	{
		xz_mpyzsq_zw=cf.GB2Uni(xz_mpyzsq_zw);
		if (!(xz_mpyzsq_zw.equals("")))	wheresql+=" and  (xz_mpyzsq.zw like '%"+xz_mpyzsq_zw+"%')";
	}
	xz_mpyzsq_dwbh=request.getParameter("xz_mpyzsq_dwbh");
	if (xz_mpyzsq_dwbh!=null)
	{
		xz_mpyzsq_dwbh=cf.GB2Uni(xz_mpyzsq_dwbh);
		if (!(xz_mpyzsq_dwbh.equals("")))	wheresql+=" and  (xz_mpyzsq.dwbh='"+xz_mpyzsq_dwbh+"')";
	}
	xz_mpyzsq_sqrq=request.getParameter("xz_mpyzsq_sqrq");
	if (xz_mpyzsq_sqrq!=null)
	{
		xz_mpyzsq_sqrq=xz_mpyzsq_sqrq.trim();
		if (!(xz_mpyzsq_sqrq.equals("")))	wheresql+="  and (xz_mpyzsq.sqrq>=TO_DATE('"+xz_mpyzsq_sqrq+"','YYYY-MM-DD'))";
	}
	xz_mpyzsq_sqrq=request.getParameter("xz_mpyzsq_sqrq2");
	if (xz_mpyzsq_sqrq!=null)
	{
		xz_mpyzsq_sqrq=xz_mpyzsq_sqrq.trim();
		if (!(xz_mpyzsq_sqrq.equals("")))	wheresql+="  and (xz_mpyzsq.sqrq<=TO_DATE('"+xz_mpyzsq_sqrq+"','YYYY-MM-DD'))";
	}
	xz_mpyzsq_wcsj=request.getParameter("xz_mpyzsq_wcsj");
	if (xz_mpyzsq_wcsj!=null)
	{
		xz_mpyzsq_wcsj=xz_mpyzsq_wcsj.trim();
		if (!(xz_mpyzsq_wcsj.equals("")))	wheresql+="  and (xz_mpyzsq.wcsj>=TO_DATE('"+xz_mpyzsq_wcsj+"','YYYY-MM-DD'))";
	}
	xz_mpyzsq_wcsj=request.getParameter("xz_mpyzsq_wcsj2");
	if (xz_mpyzsq_wcsj!=null)
	{
		xz_mpyzsq_wcsj=xz_mpyzsq_wcsj.trim();
		if (!(xz_mpyzsq_wcsj.equals("")))	wheresql+="  and (xz_mpyzsq.wcsj<=TO_DATE('"+xz_mpyzsq_wcsj+"','YYYY-MM-DD'))";
	}
	mpbb=request.getParameter("mpbb");
	if (mpbb!=null)
	{
		mpbb=cf.GB2Uni(mpbb);
		if (!(mpbb.equals("")))	wheresql+=" and  (xz_mpyzsq.mpbb='"+mpbb+"')";
	}
	dj=request.getParameter("dj");
	if (dj!=null)
	{
		dj=cf.GB2Uni(dj);
		if (!(dj.equals("")))	wheresql+=" and  (xz_mpyzsq.dj="+dj+")";
	}


	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));

	String groupsql="";
	String selectgroupsql="";
	int groupsl=0;
	String coluKeyStr="";

	if (tj1!=null && !tj1.equals(""))
	{
		groupsql+=","+tj1;
		selectgroupsql+=","+tj1+" as tj1";
		groupsl++;
		coluKeyStr+="tj1";
	}
	if (tj2!=null && !tj2.equals(""))
	{
		groupsql+=","+tj2;
		selectgroupsql+=","+tj2+" as tj2";
		groupsl++;
		coluKeyStr+="&tj2";
	}
	if (tj3!=null && !tj3.equals(""))
	{
		groupsql+=","+tj3;
		selectgroupsql+=","+tj3+" as tj3";
		groupsl++;
		coluKeyStr+="&tj3";
	}


	if (groupsl==0)
	{
		out.println("��ѡ��ͳ����");
		return;
	}
	else{
		groupsql=" group by "+groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",sum(xz_mpyzsq.dj*xz_mpyzsq.wcsl),sum(xz_mpyzsq.wcsl),'<img src=\"/images/ColuGif.gif\" width=\"'||sum(xz_mpyzsq.dj*xz_mpyzsq.wcsl)||'\" height=\"14\">' zp";
	}

%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj3name+"</td>");
	}

%>
	<td  width="10%">���</td>
	<td  width="10%">����</td>
	<td  width="35%">���</td>
</tr>

<%
	ls_sql=selectgroupsql;
	ls_sql+=" FROM xz_mpyzsq,sq_dwxx  ";
    ls_sql+=" where xz_mpyzsq.dwbh=sq_dwxx.dwbh";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

	pageObj.alignStr[groupsl+2]="align='left'";

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������

	String[] coluKey=cf.StrToArray(coluKeyStr);//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXz_mpyzsq.jsp?wheresql="+wheresql+"&tj1name="+tj1+"&tj2name="+tj2+"&tj3name="+tj3;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zp",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
*/

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	if (tj1!=null && !tj1.equals(""))
	{
		//������ʾ�ϲ���
		spanColHash.put(tj1,"1");//�в����������Hash��
	}
	if (tj2!=null && !tj2.equals(""))
	{
		//������ʾ�ϲ���
		spanColHash.put(tj2,"1");//�в����������Hash��
	}
	if (tj3!=null && !tj3.equals(""))
	{
		//������ʾ�ϲ���
		spanColHash.put(tj3,"1");//�в����������Hash��
	}
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>

