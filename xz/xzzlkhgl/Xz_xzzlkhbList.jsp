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
	String xz_xzzlkhb_dwbh=null;
	String xz_xzzlkhb_khsj=null;
	String xz_xzzlkhb_khbm=null;
	xz_xzzlkhb_dwbh=request.getParameter("xz_xzzlkhb_dwbh");
	if (xz_xzzlkhb_dwbh!=null)
	{
		xz_xzzlkhb_dwbh=cf.GB2Uni(xz_xzzlkhb_dwbh);
		if (!(xz_xzzlkhb_dwbh.equals("")))	wheresql+=" and  (xz_xzzlkhb.dwbh='"+xz_xzzlkhb_dwbh+"')";
	}
	xz_xzzlkhb_khsj=request.getParameter("xz_xzzlkhb_khsj");
	if (xz_xzzlkhb_khsj!=null)
	{
		xz_xzzlkhb_khsj=xz_xzzlkhb_khsj.trim();
		if (!(xz_xzzlkhb_khsj.equals("")))	wheresql+="  and (xz_xzzlkhb.khsj>=TO_DATE('"+xz_xzzlkhb_khsj+"','YYYY/MM/DD'))";
	}
	xz_xzzlkhb_khsj=request.getParameter("xz_xzzlkhb_khsj2");
	if (xz_xzzlkhb_khsj!=null)
	{
		xz_xzzlkhb_khsj=xz_xzzlkhb_khsj.trim();
		if (!(xz_xzzlkhb_khsj.equals("")))	wheresql+="  and (xz_xzzlkhb.khsj<=TO_DATE('"+xz_xzzlkhb_khsj+"','YYYY/MM/DD'))";
	}
	xz_xzzlkhb_khbm=request.getParameter("xz_xzzlkhb_khbm");
	if (xz_xzzlkhb_khbm!=null)
	{
		xz_xzzlkhb_khbm=cf.GB2Uni(xz_xzzlkhb_khbm);
		if (!(xz_xzzlkhb_khbm.equals("")))	wheresql+=" and  (xz_xzzlkhb.khbm='"+xz_xzzlkhb_khbm+"')";
	}
	ls_sql="SELECT xz_xzzlkhb.xh as xh,a.dwmc as xz_xzzlkhb_dwbh,xz_xzzlkhb.khsj as xz_xzzlkhb_khsj,xz_xzzlkhb.khr as xz_xzzlkhb_khr,xz_xzzlkhb.cw as xz_xzzlkhb_cw,xz_xzzlkhb.ht as xz_xzzlkhb_ht,xz_xzzlkhb.dmgl as xz_xzzlkhb_dmgl,xz_xzzlkhb.wj as xz_xzzlkhb_wj,xz_xzzlkhb.wpsb as xz_xzzlkhb_wpsb,xz_xzzlkhb.bgyp as xz_xzzlkhb_bgyp,xz_xzzlkhb.xcyp as xz_xzzlkhb_xcyp,xz_xzzlkhb.gxbb as xz_xzzlkhb_gxbb,xz_xzzlkhb.jk as xz_xzzlkhb_jk,xz_xzzlkhb.kq as xz_xzzlkhb_kq,xz_xzzlkhb.gzap as xz_xzzlkhb_gzap,xz_xzzlkhb.ts as xz_xzzlkhb_ts,b.dwmc as xz_xzzlkhb_khbm  ";
	ls_sql+=" FROM xz_xzzlkhb,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where xz_xzzlkhb.dwbh=a.dwbh  and  xz_xzzlkhb.khbm=b.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_xzzlkhbList.jsp","SelectXz_xzzlkhb.jsp","ViewXz_xzzlkhb.jsp","EditXz_xzzlkhb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","xz_xzzlkhb_dwbh","xz_xzzlkhb_khsj","xz_xzzlkhb_khr","xz_xzzlkhb_cw","xz_xzzlkhb_ht","xz_xzzlkhb_dmgl","xz_xzzlkhb_wj","xz_xzzlkhb_wpsb","xz_xzzlkhb_bgyp","xz_xzzlkhb_xcyp","xz_xzzlkhb_gxbb","xz_xzzlkhb_jk","xz_xzzlkhb_kq","xz_xzzlkhb_gzap","xz_xzzlkhb_ts","xz_xzzlkhb_khbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_xzzlkhbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from xz_xzzlkhb where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="5%">�������</td>
	<td  width="5%">�����˲���</td>
	<td  width="5%">����ʱ��</td>
	<td  width="5%">������</td>
	<td  width="5%">����15��</td>
	<td  width="5%">��ͬ10��</td>
	<td  width="5%">�������10��</td>
	<td  width="5%">�ļ�5��</td>
	<td  width="5%">��Ʒ�豸10</td>
	<td  width="5%">�칫��Ʒ5��</td>
	<td  width="5%">������Ʒ5��</td>
	<td  width="5%">�����15��</td>
	<td  width="5%">���5��</td>
	<td  width="5%">����7��</td>
	<td  width="5%">��������8��</td>
	<td  width="5%">�������ż���ԱͶ��5��</td>
	<td  width="5%">���˲���</td>
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