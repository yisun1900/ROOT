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
	String qh_gwgl_gwbh=null;
	String qh_gwgl_gwmc=null;
	String qh_gwgl_gwfj=null;
	String qh_gwgl_fbsj=null;
	String qh_gwgl_fbbm=null;
	String qh_gwgl_lrsj=null;
	String qh_gwgl_lrr=null;
	String fbr=null;
	fbr=request.getParameter("fbr");
	if (fbr!=null)
	{
		fbr=cf.GB2Uni(fbr);
		if (!(fbr.equals("")))	wheresql+=" and  (qh_gwgl.fbr='"+fbr+"')";
	}
	
	String bt=null;
	bt=request.getParameter("bt");
	if (bt!=null)
	{
		bt=cf.GB2Uni(bt);
		if (!(bt.equals("")))	wheresql+=" and  (qh_gwgl.bt like '%"+bt+"%')";
	}
	String fl=null;
	fl=request.getParameter("fl");
	if (fl!=null)
	{
		fl=cf.GB2Uni(fl);
		if (!(fl.equals("")))	wheresql+=" and  (qh_gwgl.fl like '%"+fl+"%')";
	}

	String fbfgs=null;
	fbfgs=request.getParameter("fbfgs");
	if (fbfgs!=null)
	{
		fbfgs=cf.GB2Uni(fbfgs);
		if (!(fbfgs.equals("")))	wheresql+=" and  (qh_gwgl.fbfgs='"+fbfgs+"')";
	}
	String fbfw=null;
	fbfw=request.getParameter("fbfw");
	if (fbfw!=null)
	{
		fbfw=cf.GB2Uni(fbfw);
		if (!(fbfw.equals("")))	wheresql+=" and  (qh_gwgl.fbfw='"+fbfw+"')";
	}
	
	
	qh_gwgl_gwbh=request.getParameter("qh_gwgl_gwbh");
	if (qh_gwgl_gwbh!=null)
	{
		qh_gwgl_gwbh=cf.GB2Uni(qh_gwgl_gwbh);
		if (!(qh_gwgl_gwbh.equals("")))	wheresql+=" and  (qh_gwgl.gwbh='"+qh_gwgl_gwbh+"')";
	}
	qh_gwgl_gwmc=request.getParameter("qh_gwgl_gwmc");
	if (qh_gwgl_gwmc!=null)
	{
		qh_gwgl_gwmc=cf.GB2Uni(qh_gwgl_gwmc);
		if (!(qh_gwgl_gwmc.equals("")))	wheresql+=" and  (qh_gwgl.gwmc like '%"+qh_gwgl_gwmc+"%')";
	}
	qh_gwgl_gwfj=request.getParameter("qh_gwgl_gwfj");
	if (qh_gwgl_gwfj!=null)
	{
		qh_gwgl_gwfj=cf.GB2Uni(qh_gwgl_gwfj);
		if (!(qh_gwgl_gwfj.equals("")))	wheresql+=" and  (qh_gwgl.gwfj like '%"+qh_gwgl_gwfj+"%')";
	}
	qh_gwgl_fbsj=request.getParameter("qh_gwgl_fbsj");
	if (qh_gwgl_fbsj!=null)
	{
		qh_gwgl_fbsj=qh_gwgl_fbsj.trim();
		if (!(qh_gwgl_fbsj.equals("")))	wheresql+="  and (qh_gwgl.fbsj>=TO_DATE('"+qh_gwgl_fbsj+"','YYYY/MM/DD'))";
	}
	qh_gwgl_fbsj=request.getParameter("qh_gwgl_fbsj2");
	if (qh_gwgl_fbsj!=null)
	{
		qh_gwgl_fbsj=qh_gwgl_fbsj.trim();
		if (!(qh_gwgl_fbsj.equals("")))	wheresql+="  and (qh_gwgl.fbsj<=TO_DATE('"+qh_gwgl_fbsj+"','YYYY/MM/DD'))";
	}
	qh_gwgl_fbbm=request.getParameter("fbbm");
	if (qh_gwgl_fbbm!=null)
	{
		qh_gwgl_fbbm=cf.GB2Uni(qh_gwgl_fbbm);
		if (!(qh_gwgl_fbbm.equals("")))	wheresql+=" and  (qh_gwgl.fbbm='"+qh_gwgl_fbbm+"')";
	}
	qh_gwgl_lrsj=request.getParameter("qh_gwgl_lrsj");
	if (qh_gwgl_lrsj!=null)
	{
		qh_gwgl_lrsj=qh_gwgl_lrsj.trim();
		if (!(qh_gwgl_lrsj.equals("")))	wheresql+="  and (qh_gwgl.lrsj>=TO_DATE('"+qh_gwgl_lrsj+"','YYYY/MM/DD'))";
	}
	qh_gwgl_lrsj=request.getParameter("qh_gwgl_lrsj2");
	if (qh_gwgl_lrsj!=null)
	{
		qh_gwgl_lrsj=qh_gwgl_lrsj.trim();
		if (!(qh_gwgl_lrsj.equals("")))	wheresql+="  and (qh_gwgl.lrsj<=TO_DATE('"+qh_gwgl_lrsj+"','YYYY/MM/DD'))";
	}
	qh_gwgl_lrr=request.getParameter("qh_gwgl_lrr");
	if (qh_gwgl_lrr!=null)
	{
		qh_gwgl_lrr=cf.GB2Uni(qh_gwgl_lrr);
		if (!(qh_gwgl_lrr.equals("")))	wheresql+=" and  (qh_gwgl.lrr='"+qh_gwgl_lrr+"')";
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


	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT qh_gwgl.gwbh,DECODE(fbfw,'1','����˾','2','����'),qh_gwgl.gwmc,qh_gwgl.bt,qh_gwgl.fl,'<A HREF=\"/qh/wjgl/file/'||qh_gwgl.gwfj||'\" target=\"_blank\">'||qh_gwgl.gwfj||'</A>',qh_gwgl.fbsj,qh_gwgl.fbr,a.dwmc fbbm,b.dwmc fbfgs,qh_gwgl.lrsj,qh_gwgl.lrr  ";
	ls_sql+=" FROM qh_gwgl,sq_dwxx a,sq_dwxx b ";
    ls_sql+="  where qh_gwgl.fbbm=a.dwbh and qh_gwgl.fbfgs=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Qh_gwglList.jsp","SelectQh_gwgl.jsp","","EditQh_gwgl.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"gwbh","qh_gwgl_gwmc","qh_gwgl_gwfj","qh_gwgl_fbsj","qh_gwgl_fbr","qh_gwgl_fbbm","qh_gwgl_lrsj","qh_gwgl_lrr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gwbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Qh_gwglList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gwbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewQh_gwgl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gwbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] gwbh = request.getParameterValues("gwbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gwbh,"gwbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from qh_gwgl where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%">���ı��</td>
	<td  width="4%">������Χ</td>
	<td  width="13%">��������</td>
	<td  width="12%">����</td>
	<td  width="9%">����</td>
	<td  width="16%">���ĸ���</td>
	<td  width="5%">����ʱ��</td>
	<td  width="4%">������</td>
	<td  width="9%">��������</td>
	<td  width="8%">�����ֹ�˾</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="4%">¼����</td>
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