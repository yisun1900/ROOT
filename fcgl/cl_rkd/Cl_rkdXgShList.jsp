<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbhs=(String)session.getAttribute("ssfgs");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String rkph=null;
	String dwbh=null;
	String gysmc=null;
	String rkr=null;
	String rksj=null;
	String rkzsl=null;
	String rkzje=null;
	String rkzt=null;
	String lrr=null;
	String lrsj=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cl_rkd.dwbh='"+fgs+"')";
	rkph=request.getParameter("rkph");
	if (rkph!=null)
	{
		rkph=cf.GB2Uni(rkph);
		if (!(rkph.equals("")))	wheresql+=" and  (rkph='"+rkph+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cl_rkd.dwbh='"+dwbh+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc='"+gysmc+"')";
	}
	rkr=request.getParameter("rkr");
	if (rkr!=null)
	{
		rkr=cf.GB2Uni(rkr);
		if (!(rkr.equals("")))	wheresql+=" and  (rkr='"+rkr+"')";
	}
	rksj=request.getParameter("rksj");
	if (rksj!=null)
	{
		rksj=rksj.trim();
		if (!(rksj.equals("")))	wheresql+="  and (rksj>=TO_DATE('"+rksj+"','YYYY/MM/DD'))";
	}
	rksj=request.getParameter("rksj2");
	if (rksj!=null)
	{
		rksj=rksj.trim();
		if (!(rksj.equals("")))	wheresql+="  and (rksj<=TO_DATE('"+rksj+"','YYYY/MM/DD'))";
	}
	rkzsl=request.getParameter("rkzsl");
	if (rkzsl!=null)
	{
		rkzsl=rkzsl.trim();
		if (!(rkzsl.equals("")))	wheresql+=" and  (rkzsl>="+rkzsl+") ";
	}
	rkzsl=request.getParameter("rkzsl2");
	if (rkzsl!=null)
	{
		rkzsl=rkzsl.trim();
		if (!(rkzsl.equals("")))	wheresql+=" and  (rkzsl<="+rkzsl+") ";
	}
	rkzje=request.getParameter("rkzje");
	if (rkzje!=null)
	{
		rkzje=rkzje.trim();
		if (!(rkzje.equals("")))	wheresql+=" and  (rkzje>="+rkzje+") ";
	}
	rkzje=request.getParameter("rkzje2");
	if (rkzje!=null)
	{
		rkzje=rkzje.trim();
		if (!(rkzje.equals("")))	wheresql+=" and  (rkzje<="+rkzje+") ";
	}
	rkzt=request.getParameter("rkzt");
	if (rkzt!=null)
	{
		rkzt=cf.GB2Uni(rkzt);
		if (!(rkzt.equals("")))	wheresql+=" and  (rkzt='"+rkzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT rkph,dwmc,gysmc,rkr,rksj,rkzsl,rkzje,DECODE(rkzt,'1','δ�ύ','2','���ύ','3','�����'),sgph,shr,shsj,shyj,lrr,lrsj,cl_rkd.bz  ";
	ls_sql+=" FROM cl_rkd,sq_dwxx  ";
    ls_sql+=" where cl_rkd.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cl_rkdXgShList.jsp","SelectXgShCl_rkd.jsp","","XgShCl_rkd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"rkph","dwbh","gysmc","rkr","rksj","rkzsl","rkzje","rkzt","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"rkph"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ�����"};//��ť����ʾ����
	String[] buttonLink={"Cl_rkdXgShList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"rkph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="viewrkmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("rkph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] rkph = request.getParameterValues("rkph");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(rkph,"rkph"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update cl_rkd set rkzt='2',shr=null,shsj=null,shyj=null where rkzt='3' and "+chooseitem;
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
  <B><font size="3">�޸����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">�������</td>
	<td  width="6%">��ⵥλ</td>
	<td  width="6%">��Ӧ��</td>
	<td  width="3%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="5%">���������</td>
	<td  width="7%">����ܽ��</td>
	<td  width="4%">���״̬</td>
	<td  width="5%">�깺����</td>
	<td  width="3%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="17%">������</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="17%">��ע</td>
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