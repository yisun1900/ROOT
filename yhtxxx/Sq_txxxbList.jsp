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
	String sq_txxxb_xh=null;
	String sq_txxxb_ygbh=null;
	String sq_txxxb_yhmc=null;
	String sq_txxxb_txfs=null;
	String sq_txxxb_txlx=null;
	String sq_txxxb_txgjz=null;
	String sq_txxxb_txnr=null;
	String sq_txxxb_kstxsj=null;
	String sq_txxxb_txzt=null;
	String sq_txxxb_txsj=null;
	String sq_txxxb_lrr=null;
	String sq_txxxb_lrsj=null;
	String sq_txxxb_lrbm=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_txxxb.ssfgs='"+ssfgs+"')";
	
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=dwbh.trim();
		if (!(dwbh.equals("")))	wheresql+=" and (sq_txxxb.dwbh='"+dwbh+"') ";
	}
	
	sq_txxxb_xh=request.getParameter("sq_txxxb_xh");
	if (sq_txxxb_xh!=null)
	{
		sq_txxxb_xh=sq_txxxb_xh.trim();
		if (!(sq_txxxb_xh.equals("")))	wheresql+=" and (sq_txxxb.xh="+sq_txxxb_xh+") ";
	}

	sq_txxxb_ygbh=request.getParameter("sq_txxxb_ygbh");
	if (sq_txxxb_ygbh!=null)
	{
		sq_txxxb_ygbh=sq_txxxb_ygbh.trim();
		if (!(sq_txxxb_ygbh.equals("")))	wheresql+=" and (sq_txxxb.ygbh="+sq_txxxb_ygbh+") ";
	}
	sq_txxxb_yhmc=request.getParameter("sq_txxxb_yhmc");
	if (sq_txxxb_yhmc!=null)
	{
		sq_txxxb_yhmc=cf.GB2Uni(sq_txxxb_yhmc);
		if (!(sq_txxxb_yhmc.equals("")))	wheresql+=" and  (sq_txxxb.yhmc like '%"+sq_txxxb_yhmc+"%')";
	}
	sq_txxxb_txfs=request.getParameter("sq_txxxb_txfs");
	if (sq_txxxb_txfs!=null)
	{
		sq_txxxb_txfs=cf.GB2Uni(sq_txxxb_txfs);
		if (!(sq_txxxb_txfs.equals("")))	wheresql+=" and  (sq_txxxb.txfs='"+sq_txxxb_txfs+"')";
	}
	sq_txxxb_txlx=request.getParameter("sq_txxxb_txlx");
	if (sq_txxxb_txlx!=null)
	{
		sq_txxxb_txlx=cf.GB2Uni(sq_txxxb_txlx);
		if (!(sq_txxxb_txlx.equals("")))	wheresql+=" and  (sq_txxxb.txlx='"+sq_txxxb_txlx+"')";
	}
	sq_txxxb_txgjz=request.getParameter("sq_txxxb_txgjz");
	if (sq_txxxb_txgjz!=null)
	{
		sq_txxxb_txgjz=cf.GB2Uni(sq_txxxb_txgjz);
		if (!(sq_txxxb_txgjz.equals("")))	wheresql+=" and  (sq_txxxb.txgjz like '%"+sq_txxxb_txgjz+"%')";
	}
	sq_txxxb_txnr=request.getParameter("sq_txxxb_txnr");
	if (sq_txxxb_txnr!=null)
	{
		sq_txxxb_txnr=cf.GB2Uni(sq_txxxb_txnr);
		if (!(sq_txxxb_txnr.equals("")))	wheresql+=" and  (sq_txxxb.txnr like '%"+sq_txxxb_txnr+"%')";
	}
	sq_txxxb_kstxsj=request.getParameter("sq_txxxb_kstxsj");
	if (sq_txxxb_kstxsj!=null)
	{
		sq_txxxb_kstxsj=sq_txxxb_kstxsj.trim();
		if (!(sq_txxxb_kstxsj.equals("")))	wheresql+="  and (sq_txxxb.kstxsj>=TO_DATE('"+sq_txxxb_kstxsj+"','YYYY/MM/DD'))";
	}
	sq_txxxb_kstxsj=request.getParameter("sq_txxxb_kstxsj2");
	if (sq_txxxb_kstxsj!=null)
	{
		sq_txxxb_kstxsj=sq_txxxb_kstxsj.trim();
		if (!(sq_txxxb_kstxsj.equals("")))	wheresql+="  and (sq_txxxb.kstxsj<=TO_DATE('"+sq_txxxb_kstxsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	sq_txxxb_txzt=request.getParameter("sq_txxxb_txzt");
	if (sq_txxxb_txzt!=null)
	{
		sq_txxxb_txzt=cf.GB2Uni(sq_txxxb_txzt);
		if (!(sq_txxxb_txzt.equals("")))	wheresql+=" and  (sq_txxxb.txzt='"+sq_txxxb_txzt+"')";
	}
	sq_txxxb_txsj=request.getParameter("sq_txxxb_txsj");
	if (sq_txxxb_txsj!=null)
	{
		sq_txxxb_txsj=sq_txxxb_txsj.trim();
		if (!(sq_txxxb_txsj.equals("")))	wheresql+="  and (sq_txxxb.txsj>=TO_DATE('"+sq_txxxb_txsj+"','YYYY/MM/DD'))";
	}
	sq_txxxb_txsj=request.getParameter("sq_txxxb_txsj2");
	if (sq_txxxb_txsj!=null)
	{
		sq_txxxb_txsj=sq_txxxb_txsj.trim();
		if (!(sq_txxxb_txsj.equals("")))	wheresql+="  and (sq_txxxb.txsj<=TO_DATE('"+sq_txxxb_txsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	sq_txxxb_lrr=request.getParameter("sq_txxxb_lrr");
	if (sq_txxxb_lrr!=null)
	{
		sq_txxxb_lrr=cf.GB2Uni(sq_txxxb_lrr);
		if (!(sq_txxxb_lrr.equals("")))	wheresql+=" and  (sq_txxxb.lrr='"+sq_txxxb_lrr+"')";
	}
	sq_txxxb_lrsj=request.getParameter("sq_txxxb_lrsj");
	if (sq_txxxb_lrsj!=null)
	{
		sq_txxxb_lrsj=sq_txxxb_lrsj.trim();
		if (!(sq_txxxb_lrsj.equals("")))	wheresql+="  and (sq_txxxb.lrsj>=TO_DATE('"+sq_txxxb_lrsj+"','YYYY/MM/DD'))";
	}
	sq_txxxb_lrsj=request.getParameter("sq_txxxb_lrsj2");
	if (sq_txxxb_lrsj!=null)
	{
		sq_txxxb_lrsj=sq_txxxb_lrsj.trim();
		if (!(sq_txxxb_lrsj.equals("")))	wheresql+="  and (sq_txxxb.lrsj<=TO_DATE('"+sq_txxxb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	sq_txxxb_lrbm=request.getParameter("sq_txxxb_lrbm");
	if (sq_txxxb_lrbm!=null)
	{
		sq_txxxb_lrbm=cf.GB2Uni(sq_txxxb_lrbm);
		if (!(sq_txxxb_lrbm.equals("")))	wheresql+=" and  (sq_txxxb.lrbm='"+sq_txxxb_lrbm+"')";
	}

	ls_sql="SELECT sq_txxxb.xh,sq_txxxb.ygbh,sq_txxxb.yhmc, DECODE(sq_txxxb.txzt,'1','δ����','2','����','3','����'), DECODE(sq_txxxb.txfs,'1','ϵͳ','2','�绰','3','����','4','����','9','ȫ��'), DECODE(sq_txxxb.txlx,'01','��ѯ�ط�','02','��ʩ���̻ط�','03','Ͷ�߱��޻ط�','04','Ͷ�߱���'),sq_txxxb.kstxsj,sq_txxxb.xctxsj,sq_txxxb.txcs,sq_txxxb.txjg,sq_txxxb.xtxcs,sq_txxxb.txgjz,sq_txxxb.txnr,sq_txxxb.txsj,sq_txxxb.lrr,sq_txxxb.lrsj,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,sq_txxxb  ";
    ls_sql+=" where sq_txxxb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_txxxb.txzt,sq_txxxb.xctxsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_txxxbList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ","��������"};//��ť����ʾ����
	String[] buttonLink={"Sq_txxxbList.jsp?","SaveCxtx.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from sq_txxxb where "+chooseitem;
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
  <B><font size="3">�޸�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">���</td>
	<td  width="2%">Ա�����</td>
	<td  width="4%">Ա������</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">���ѷ�ʽ</td>
	<td  width="5%">��������</td>
	<td  width="8%">��ʼ����ʱ��</td>
	<td  width="8%">�´�����ʱ��</td>
	<td  width="3%">�������Ѵ���</td>
	<td  width="3%">�������Ѽ��</td>
	<td  width="3%">�������Ѵ���</td>
	<td  width="10%">���ѹؼ���</td>
	<td  width="20%">��������</td>
	<td  width="8%">�������ʱ��</td>
	<td  width="3%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
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