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
	String nblt_ftgl_tzbh=null;
	String nblt_bkgl_bkmc=null;
	String nblt_ftgl_bkbh=null;
	String nblt_ftgl_ftzt=null;
	String nblt_ftgl_ftr=null;
	String nblt_ftgl_ftsj=null;
	String nblt_ftgl_zhxgsj=null;
	String nblt_ftgl_djcs=null;
	String nblt_ftgl_hfcs=null;
	String nblt_ftgl_sfzd=null;
	String nblt_ftgl_sfjht=null;
	String nblt_ftgl_sfyxhf=null;
	String nblt_ftgl_fjmc=null;
	nblt_ftgl_tzbh=request.getParameter("nblt_ftgl_tzbh");
	if (nblt_ftgl_tzbh!=null)
	{
		nblt_ftgl_tzbh=cf.GB2Uni(nblt_ftgl_tzbh);
		if (!(nblt_ftgl_tzbh.equals("")))	wheresql+=" and  (nblt_ftgl.tzbh='"+nblt_ftgl_tzbh+"')";
	}
	nblt_bkgl_bkmc=request.getParameter("nblt_bkgl_bkmc");
	if (nblt_bkgl_bkmc!=null)
	{
		nblt_bkgl_bkmc=cf.GB2Uni(nblt_bkgl_bkmc);
		if (!(nblt_bkgl_bkmc.equals("")))	wheresql+=" and  (nblt_bkgl.bkmc like '%"+nblt_bkgl_bkmc+"%')";
	}
	nblt_ftgl_bkbh=request.getParameter("nblt_ftgl_bkbh");
	if (nblt_ftgl_bkbh!=null)
	{
		nblt_ftgl_bkbh=cf.GB2Uni(nblt_ftgl_bkbh);
		if (!(nblt_ftgl_bkbh.equals("")))	wheresql+=" and  (nblt_ftgl.bkbh='"+nblt_ftgl_bkbh+"')";
	}
	nblt_ftgl_ftzt=request.getParameter("nblt_ftgl_ftzt");
	if (nblt_ftgl_ftzt!=null)
	{
		nblt_ftgl_ftzt=cf.GB2Uni(nblt_ftgl_ftzt);
		if (!(nblt_ftgl_ftzt.equals("")))	wheresql+=" and  (nblt_ftgl.ftzt like '%"+nblt_ftgl_ftzt+"%')";
	}
	nblt_ftgl_ftr=request.getParameter("nblt_ftgl_ftr");
	if (nblt_ftgl_ftr!=null)
	{
		nblt_ftgl_ftr=cf.GB2Uni(nblt_ftgl_ftr);
		if (!(nblt_ftgl_ftr.equals("")))	wheresql+=" and (nblt_grzl.ltnc='"+nblt_ftgl_ftr+"') ";
	}
	nblt_ftgl_ftsj=request.getParameter("nblt_ftgl_ftsj");
	if (nblt_ftgl_ftsj!=null)
	{
		nblt_ftgl_ftsj=nblt_ftgl_ftsj.trim();
		if (!(nblt_ftgl_ftsj.equals("")))	wheresql+="  and (nblt_ftgl.ftsj>=TO_DATE('"+nblt_ftgl_ftsj+"','YYYY/MM/DD'))";
	}
	nblt_ftgl_ftsj=request.getParameter("nblt_ftgl_ftsj2");
	if (nblt_ftgl_ftsj!=null)
	{
		nblt_ftgl_ftsj=nblt_ftgl_ftsj.trim();
		if (!(nblt_ftgl_ftsj.equals("")))	wheresql+="  and (nblt_ftgl.ftsj<=TO_DATE('"+nblt_ftgl_ftsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	nblt_ftgl_zhxgsj=request.getParameter("nblt_ftgl_zhxgsj");
	if (nblt_ftgl_zhxgsj!=null)
	{
		nblt_ftgl_zhxgsj=nblt_ftgl_zhxgsj.trim();
		if (!(nblt_ftgl_zhxgsj.equals("")))	wheresql+="  and (nblt_ftgl.zhxgsj>=TO_DATE('"+nblt_ftgl_zhxgsj+"','YYYY/MM/DD'))";
	}
	nblt_ftgl_zhxgsj=request.getParameter("nblt_ftgl_zhxgsj2");
	if (nblt_ftgl_zhxgsj!=null)
	{
		nblt_ftgl_zhxgsj=nblt_ftgl_zhxgsj.trim();
		if (!(nblt_ftgl_zhxgsj.equals("")))	wheresql+="  and (nblt_ftgl.zhxgsj<=TO_DATE('"+nblt_ftgl_zhxgsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	nblt_ftgl_djcs=request.getParameter("nblt_ftgl_djcs");
	if (nblt_ftgl_djcs!=null)
	{
		nblt_ftgl_djcs=nblt_ftgl_djcs.trim();
		if (!(nblt_ftgl_djcs.equals("")))	wheresql+=" and (nblt_ftgl.djcs>="+nblt_ftgl_djcs+") ";
	}
	nblt_ftgl_djcs=request.getParameter("nblt_ftgl_djcs2");
	if (nblt_ftgl_djcs!=null)
	{
		nblt_ftgl_djcs=nblt_ftgl_djcs.trim();
		if (!(nblt_ftgl_djcs.equals("")))	wheresql+=" and (nblt_ftgl.djcs<="+nblt_ftgl_djcs+") ";
	}
	nblt_ftgl_hfcs=request.getParameter("nblt_ftgl_hfcs");
	if (nblt_ftgl_hfcs!=null)
	{
		nblt_ftgl_hfcs=nblt_ftgl_hfcs.trim();
		if (!(nblt_ftgl_hfcs.equals("")))	wheresql+=" and (nblt_ftgl.hfcs>="+nblt_ftgl_hfcs+") ";
	}
	nblt_ftgl_hfcs=request.getParameter("nblt_ftgl_hfcs2");
	if (nblt_ftgl_hfcs!=null)
	{
		nblt_ftgl_hfcs=nblt_ftgl_hfcs.trim();
		if (!(nblt_ftgl_hfcs.equals("")))	wheresql+=" and (nblt_ftgl.hfcs<="+nblt_ftgl_hfcs+") ";
	}
	nblt_ftgl_sfzd=request.getParameter("nblt_ftgl_sfzd");
	if (nblt_ftgl_sfzd!=null)
	{
		nblt_ftgl_sfzd=cf.GB2Uni(nblt_ftgl_sfzd);
		if (!(nblt_ftgl_sfzd.equals("")))	wheresql+=" and  (nblt_ftgl.sfzd='"+nblt_ftgl_sfzd+"')";
	}
	nblt_ftgl_sfjht=request.getParameter("nblt_ftgl_sfjht");
	if (nblt_ftgl_sfjht!=null)
	{
		nblt_ftgl_sfjht=cf.GB2Uni(nblt_ftgl_sfjht);
		if (!(nblt_ftgl_sfjht.equals("")))	wheresql+=" and  (nblt_ftgl.sfjht='"+nblt_ftgl_sfjht+"')";
	}
	nblt_ftgl_sfyxhf=request.getParameter("nblt_ftgl_sfyxhf");
	if (nblt_ftgl_sfyxhf!=null)
	{
		nblt_ftgl_sfyxhf=cf.GB2Uni(nblt_ftgl_sfyxhf);
		if (!(nblt_ftgl_sfyxhf.equals("")))	wheresql+=" and  (nblt_ftgl.sfyxhf='"+nblt_ftgl_sfyxhf+"')";
	}
	nblt_ftgl_fjmc=request.getParameter("nblt_ftgl_fjmc");
	if (nblt_ftgl_fjmc!=null)
	{
		nblt_ftgl_fjmc=cf.GB2Uni(nblt_ftgl_fjmc);
		if (!(nblt_ftgl_fjmc.equals("")))	wheresql+=" and  (nblt_ftgl.fjmc='"+nblt_ftgl_fjmc+"')";
	}
	ls_sql="SELECT nblt_ftgl.tzbh, DECODE(nblt_ftgl.sfzd,'Y','�ö�','N','��'), DECODE(nblt_ftgl.sfjht,'Y','<IMG src=\"\\nblt\\fwlt\\image\\jh.jpg\">','N','��'),nblt_ftgl.ftzt,nblt_ftgl.bkbh,nblt_bkgl.bkmc,nblt_grzl.ltnc,nblt_ftgl.ftsj,nblt_ftgl.zhxgsj,nblt_ftgl.djcs,nblt_ftgl.hfcs, DECODE(nblt_ftgl.sfyxhf,'Y','����ظ�','N','��'),nblt_ftgl.fjmc ";
	ls_sql+=" FROM nblt_bkgl,nblt_ftgl,nblt_grzl  ";
    ls_sql+=" where nblt_ftgl.bkbh=nblt_bkgl.bkbh(+)";
    ls_sql+=" and nblt_ftgl.ftr=nblt_grzl.ltid(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by nblt_ftgl.ftsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Nblt_ftglList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"tzbh"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");

//���ð�ť����
	String[] buttonName={"�ö�","ȡ���ö�","���þ�����","ȡ��������","ɾ������"};//��ť����ʾ����
	String[] buttonLink={"setZd.jsp?sfzd=Y","setNotZd.jsp?sfzd=N","setJht.jsp?sfjht=Y","setNotJht.jsp?sfjht=N","Nblt_ftglList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1,1,1,0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] tzbh = request.getParameterValues("tzbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tzbh,"tzbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from nblt_hfgl where "+chooseitem;
		sql[1]="delete from nblt_ftgl where "+chooseitem;
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
  <B><font size="3">����ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">���ӱ��</td>
	<td  width="4%">�Ƿ��ö�</td>
	<td  width="4%">�Ƿ񾫻���</td>
	<td  width="16%">��������</td>
	<td  width="4%">�����</td>
	<td  width="16%">�������</td>
	<td  width="4%">������</td>
	<td  width="10%">����ʱ��</td>
	<td  width="10%">����޸�ʱ��</td>
	<td  width="3%">�������</td>
	<td  width="3%">�ظ�����</td>
	<td  width="5%">�Ƿ�����ظ�</td>
	<td  width="13%">��������</td>
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