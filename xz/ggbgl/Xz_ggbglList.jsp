<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");//��ȡ��¼��
String yhjs=(String)session.getAttribute("yhjs");//��ȡ�û���ɫ

//String yhmc=(String)session.getAttribute("yhmc");
//System.out.println(lrr);
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_ggbgl_ggbh=null;
	String xz_ggbgl_ggmc=null;
	String xz_ggbgl_fbsj=null;
	String xz_ggbgl_fbr=null;
	String xz_ggbgl_fbbm=null;
	String xz_ggbgl_lrr=null;
	String xz_ggbgl_lrsj=null;

	String fbfgs=null;
	fbfgs=request.getParameter("fbfgs");
	if (fbfgs!=null)
	{
		fbfgs=cf.GB2Uni(fbfgs);
		if (!(fbfgs.equals("")))	wheresql+=" and  (xz_ggbgl.fbfgs='"+fbfgs+"')";
	}

	xz_ggbgl_ggbh=request.getParameter("xz_ggbgl_ggbh");
	if (xz_ggbgl_ggbh!=null)
	{
		xz_ggbgl_ggbh=cf.GB2Uni(xz_ggbgl_ggbh);
		if (!(xz_ggbgl_ggbh.equals("")))	wheresql+=" and  (xz_ggbgl.ggbh='"+xz_ggbgl_ggbh+"')";
	}
	xz_ggbgl_ggmc=request.getParameter("xz_ggbgl_ggmc");
	if (xz_ggbgl_ggmc!=null)
	{
		xz_ggbgl_ggmc=cf.GB2Uni(xz_ggbgl_ggmc);
		if (!(xz_ggbgl_ggmc.equals("")))	wheresql+=" and  (xz_ggbgl.ggmc='"+xz_ggbgl_ggmc+"')";
	}
	xz_ggbgl_fbsj=request.getParameter("xz_ggbgl_fbsj");
	if (xz_ggbgl_fbsj!=null)
	{
		xz_ggbgl_fbsj=xz_ggbgl_fbsj.trim();
		if (!(xz_ggbgl_fbsj.equals("")))	wheresql+="  and (xz_ggbgl.fbsj>=TO_DATE('"+xz_ggbgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_fbsj=request.getParameter("xz_ggbgl_fbsj2");
	if (xz_ggbgl_fbsj!=null)
	{
		xz_ggbgl_fbsj=xz_ggbgl_fbsj.trim();
		if (!(xz_ggbgl_fbsj.equals("")))	wheresql+="  and (xz_ggbgl.fbsj<=TO_DATE('"+xz_ggbgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_fbr=request.getParameter("xz_ggbgl_fbr");
	if (xz_ggbgl_fbr!=null)
	{
		xz_ggbgl_fbr=cf.GB2Uni(xz_ggbgl_fbr);
		if (!(xz_ggbgl_fbr.equals("")))	wheresql+=" and  (xz_ggbgl.fbr='"+xz_ggbgl_fbr+"')";
	}
	xz_ggbgl_fbbm=request.getParameter("xz_ggbgl_fbbm");
	if (xz_ggbgl_fbbm!=null)
	{
		xz_ggbgl_fbbm=cf.GB2Uni(xz_ggbgl_fbbm);
		if (!(xz_ggbgl_fbbm.equals("")))	wheresql+=" and  (xz_ggbgl.fbbm='"+xz_ggbgl_fbbm+"')";
	}
	xz_ggbgl_lrr=request.getParameter("xz_ggbgl_lrr");
	if (xz_ggbgl_lrr!=null)
	{
		xz_ggbgl_lrr=cf.GB2Uni(xz_ggbgl_lrr);
		if (!(xz_ggbgl_lrr.equals("")))	wheresql+=" and  (xz_ggbgl.lrr='"+xz_ggbgl_lrr+"')";
	}
	xz_ggbgl_lrsj=request.getParameter("xz_ggbgl_lrsj");
	if (xz_ggbgl_lrsj!=null)
	{
		xz_ggbgl_lrsj=xz_ggbgl_lrsj.trim();
		if (!(xz_ggbgl_lrsj.equals("")))	wheresql+="  and (xz_ggbgl.lrsj>=TO_DATE('"+xz_ggbgl_lrsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_lrsj=request.getParameter("xz_ggbgl_lrsj2");
	if (xz_ggbgl_lrsj!=null)
	{
		xz_ggbgl_lrsj=xz_ggbgl_lrsj.trim();
		if (!(xz_ggbgl_lrsj.equals("")))	wheresql+="  and (xz_ggbgl.lrsj<=TO_DATE('"+xz_ggbgl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xz_ggbgl.ggbh,xz_ggbgl.ggmc,'<A HREF=\"/xz/ggbgl/file/'||xz_ggbgl.fj||'\" target=\"_blank\">'||xz_ggbgl.fj||'</A>',xz_ggbgl.fbsj,xz_ggbgl.fbr,a.dwmc fbbm,b.dwmc fbfgs,xz_ggbgl.lrr,xz_ggbgl.lrsj";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b,xz_ggbgl  ";
	ls_sql+=" where xz_ggbgl.fbbm=a.dwbh and xz_ggbgl.fbfgs=b.dwbh ";
	ls_sql+=wheresql;
	ls_sql+=" order by xz_ggbgl.fbsj desc,xz_ggbgl.ggbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_ggbglList.jsp","","","EditXz_ggbglMain.jsp");

//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ggbh","xz_ggbgl_ggmc","xz_ggbgl_ggnr","xz_ggbgl_fbsj","xz_ggbgl_fbr","xz_ggbgl_fbbm","xz_ggbgl_bz","xz_ggbgl_lrr","xz_ggbgl_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ggbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_ggbglList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ggbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXz_ggbgl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ggbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] ggbh = request.getParameterValues("ggbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ggbh,"ggbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[6];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from xz_ggdx where "+chooseitem;
		sql[1]="delete from xz_ggckjl where "+chooseitem;
		sql[2]="delete from xz_ggbgl where "+chooseitem;
		sql[3]="delete from xz_ggfgs where "+chooseitem;
		sql[4]="delete from xz_ggbm where "+chooseitem;
		sql[5]="delete from xz_ggyhz where "+chooseitem;

		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">������</td>
	<td  width="24%">����</td>
	<td  width="20%">����</td>
	<td  width="7%">����ʱ��</td>
	<td  width="5%">������</td>
	<td  width="10%">��������</td>
	<td  width="9%">������˾</td>
	<td  width="4%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
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