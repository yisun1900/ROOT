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
	String jc_cpjjbj_cpjjbh=null;
	String jc_cpjjbj_cpjjfg=null;
	String jc_cpjjbj_cpjjmc=null;
	String jc_cpjjbj_xh=null;
	String jc_cpjjbj_gg=null;
	String jc_cpjjbj_cpjjxl=null;
	String jc_cpjjbj_cpjjcz=null;
	String jc_cpjjbj_dj=null;
	String jc_cpjjbj_cktp=null;
	String jc_cpjjbj_cptp=null;
	String jc_cpjjbj_dqbm=null;
	jc_cpjjbj_cpjjbh=request.getParameter("jc_cpjjbj_cpjjbh");
	if (jc_cpjjbj_cpjjbh!=null)
	{
		jc_cpjjbj_cpjjbh=cf.GB2Uni(jc_cpjjbj_cpjjbh);
		if (!(jc_cpjjbj_cpjjbh.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjbh='"+jc_cpjjbj_cpjjbh+"')";
	}
	jc_cpjjbj_cpjjfg=request.getParameter("jc_cpjjbj_cpjjfg");
	if (jc_cpjjbj_cpjjfg!=null)
	{
		jc_cpjjbj_cpjjfg=cf.GB2Uni(jc_cpjjbj_cpjjfg);
		if (!(jc_cpjjbj_cpjjfg.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjfg='"+jc_cpjjbj_cpjjfg+"')";
	}
	jc_cpjjbj_cpjjmc=request.getParameter("jc_cpjjbj_cpjjmc");
	if (jc_cpjjbj_cpjjmc!=null)
	{
		jc_cpjjbj_cpjjmc=cf.GB2Uni(jc_cpjjbj_cpjjmc);
		if (!(jc_cpjjbj_cpjjmc.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjmc='"+jc_cpjjbj_cpjjmc+"')";
	}
	jc_cpjjbj_xh=request.getParameter("jc_cpjjbj_xh");
	if (jc_cpjjbj_xh!=null)
	{
		jc_cpjjbj_xh=cf.GB2Uni(jc_cpjjbj_xh);
		if (!(jc_cpjjbj_xh.equals("")))	wheresql+=" and  (jc_cpjjbj.xh='"+jc_cpjjbj_xh+"')";
	}
	jc_cpjjbj_gg=request.getParameter("jc_cpjjbj_gg");
	if (jc_cpjjbj_gg!=null)
	{
		jc_cpjjbj_gg=cf.GB2Uni(jc_cpjjbj_gg);
		if (!(jc_cpjjbj_gg.equals("")))	wheresql+=" and  (jc_cpjjbj.gg='"+jc_cpjjbj_gg+"')";
	}
	jc_cpjjbj_cpjjxl=request.getParameter("jc_cpjjbj_cpjjxl");
	if (jc_cpjjbj_cpjjxl!=null)
	{
		jc_cpjjbj_cpjjxl=cf.GB2Uni(jc_cpjjbj_cpjjxl);
		if (!(jc_cpjjbj_cpjjxl.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjxl='"+jc_cpjjbj_cpjjxl+"')";
	}
	jc_cpjjbj_cpjjcz=request.getParameter("jc_cpjjbj_cpjjcz");
	if (jc_cpjjbj_cpjjcz!=null)
	{
		jc_cpjjbj_cpjjcz=cf.GB2Uni(jc_cpjjbj_cpjjcz);
		if (!(jc_cpjjbj_cpjjcz.equals("")))	wheresql+=" and  (jc_cpjjbj.cpjjcz='"+jc_cpjjbj_cpjjcz+"')";
	}
	jc_cpjjbj_dj=request.getParameter("jc_cpjjbj_dj");
	if (jc_cpjjbj_dj!=null)
	{
		jc_cpjjbj_dj=jc_cpjjbj_dj.trim();
		if (!(jc_cpjjbj_dj.equals("")))	wheresql+=" and  (jc_cpjjbj.dj="+jc_cpjjbj_dj+") ";
	}
	jc_cpjjbj_cktp=request.getParameter("jc_cpjjbj_cktp");
	if (jc_cpjjbj_cktp!=null)
	{
		jc_cpjjbj_cktp=cf.GB2Uni(jc_cpjjbj_cktp);
		if (!(jc_cpjjbj_cktp.equals("")))	wheresql+=" and  (jc_cpjjbj.cktp='"+jc_cpjjbj_cktp+"')";
	}
	jc_cpjjbj_cptp=request.getParameter("jc_cpjjbj_cptp");
	if (jc_cpjjbj_cptp!=null)
	{
		jc_cpjjbj_cptp=cf.GB2Uni(jc_cpjjbj_cptp);
		if (!(jc_cpjjbj_cptp.equals("")))	wheresql+=" and  (jc_cpjjbj.cptp='"+jc_cpjjbj_cptp+"')";
	}
	jc_cpjjbj_dqbm=request.getParameter("jc_cpjjbj_dqbm");
	if (jc_cpjjbj_dqbm!=null)
	{
		jc_cpjjbj_dqbm=cf.GB2Uni(jc_cpjjbj_dqbm);
		if (!(jc_cpjjbj_dqbm.equals("")))	wheresql+=" and  (jc_cpjjbj.dqbm='"+jc_cpjjbj_dqbm+"')";
	}

	String myxssl=request.getParameter("myxssl");
	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String ordersql=null;
	if (jgpx1.equals(""))
	{
		ordersql=" order by jc_cpjjbj.cpjjfg,jc_cpjjbj.xh,jc_cpjjbj.gg,jc_cpjjbj.cpjjcz,jc_cpjjbj.cpjjbh";
	}
	else{
		ordersql=" order by "+jgpx1;
	}

	ls_sql="SELECT jc_cpjjbj.cpjjfg,jc_cpjjbj.cpjjxl,jc_cpjjbj.cpjjmc,jc_cpjjbj.xh,jc_cpjjbj.gg,jc_cpjjbj.cpjjcz,jc_cpjjbj.dj,jc_cpjjbj.cpjjbh,jc_cpjjbj.cpsm,jc_cpjjbj.bz,dm_dqbm.dqmc,'<IMG SRC=\"/jcjj/jjbj/cpjjbj/images/'||UPPER(jc_cpjjbj.cktp)||'\" >'  cktp,'<IMG SRC=\"/jcjj/jjbj/cpjjbj/images/'||UPPER(jc_cpjjbj.cptp)||'\" >' cptp,jc_cpjjbj.lrr,jc_cpjjbj.lrsj  ";
	ls_sql+=" FROM jc_cpjjbj,dm_dqbm  ";
    ls_sql+=" where jc_cpjjbj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cpjjbjCxList.jsp","SelectCxJc_cpjjbj.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"cpjjbh","jc_cpjjbj_cpjjfg","jc_cpjjbj_cpjjmc","jc_cpjjbj_xh","jc_cpjjbj_gg","jc_cpjjbj_cpjjxl","jc_cpjjbj_cpjjcz","jc_cpjjbj_dj","jc_cpjjbj_cktp","jc_cpjjbj_cptp","jc_cpjjbj_cpsm","dm_dqbm_dwmc","jc_cpjjbj_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cpjjbh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[8]="align='left'";
	pageObj.alignStr[9]="align='left'";

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cpjjfg","1");//�в����������Hash��
	spanColHash.put("cpjjxl","1");//�в����������Hash��
	spanColHash.put("cpjjmc","1");//�в����������Hash��
	spanColHash.put("xh","2");//�в����������Hash��
	spanColHash.put("gg","1");//�в����������Hash��
	spanColHash.put("cpsm","2");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("cktp","2");//�в����������Hash��
	spanColHash.put("cptp","2");//�в����������Hash��
	spanColHash.put("lrr","1");//�в����������Hash��
	spanColHash.put("lrsj","1");//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���</td>
	<td  width="5%">ϵ������</td>
	<td  width="5%">����</td>
	<td  width="4%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="7%">����</td>
	<td  width="3%">����</td>
	<td  width="2%">��Ʒ�Ҿ߱��</td>
	<td  width="20%">��Ʒ˵��</td>
	<td  width="7%">��ע</td>
	<td  width="4%">����</td>
	<td  width="13%">�ο�ͼƬ</td>
	<td  width="9%">��ƷͼƬ</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
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