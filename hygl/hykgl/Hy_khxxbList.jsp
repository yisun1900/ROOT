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
	String hy_khxxb_hykh=null;
	String hy_khxxb_kdlb=null;
	String hy_khxxb_sfyfk=null;
	String hy_khxxb_dwbh=null;
	String hy_khxxb_fkr=null;
	String hy_khxxb_fkrq=null;
	String hy_khxxb_sfysy=null;
	String hy_khxxb_hybh=null;
	String hy_khxxb_syrq=null;
	hy_khxxb_hykh=request.getParameter("hy_khxxb_hykh");
	if (hy_khxxb_hykh!=null)
	{
		hy_khxxb_hykh=cf.GB2Uni(hy_khxxb_hykh);
		if (!(hy_khxxb_hykh.equals("")))	wheresql+=" and  (hy_khxxb.hykh='"+hy_khxxb_hykh+"')";
	}
	hy_khxxb_kdlb=request.getParameter("hy_khxxb_kdlb");
	if (hy_khxxb_kdlb!=null)
	{
		hy_khxxb_kdlb=cf.GB2Uni(hy_khxxb_kdlb);
		if (!(hy_khxxb_kdlb.equals("")))	wheresql+=" and  (hy_khxxb.kdlb='"+hy_khxxb_kdlb+"')";
	}
	hy_khxxb_sfyfk=request.getParameter("hy_khxxb_sfyfk");
	if (hy_khxxb_sfyfk!=null)
	{
		hy_khxxb_sfyfk=cf.GB2Uni(hy_khxxb_sfyfk);
		if (!(hy_khxxb_sfyfk.equals("")))	wheresql+=" and  (hy_khxxb.sfyfk='"+hy_khxxb_sfyfk+"')";
	}
	hy_khxxb_dwbh=request.getParameter("hy_khxxb_dwbh");
	if (hy_khxxb_dwbh!=null)
	{
		hy_khxxb_dwbh=cf.GB2Uni(hy_khxxb_dwbh);
		if (!(hy_khxxb_dwbh.equals("")))	wheresql+=" and  (hy_khxxb.dwbh='"+hy_khxxb_dwbh+"')";
	}
	hy_khxxb_fkr=request.getParameter("hy_khxxb_fkr");
	if (hy_khxxb_fkr!=null)
	{
		hy_khxxb_fkr=cf.GB2Uni(hy_khxxb_fkr);
		if (!(hy_khxxb_fkr.equals("")))	wheresql+=" and  (hy_khxxb.fkr='"+hy_khxxb_fkr+"')";
	}
	hy_khxxb_fkrq=request.getParameter("hy_khxxb_fkrq");
	if (hy_khxxb_fkrq!=null)
	{
		hy_khxxb_fkrq=hy_khxxb_fkrq.trim();
		if (!(hy_khxxb_fkrq.equals("")))	wheresql+="  and (hy_khxxb.fkrq>=TO_DATE('"+hy_khxxb_fkrq+"','YYYY/MM/DD'))";
	}
	hy_khxxb_fkrq=request.getParameter("hy_khxxb_fkrq2");
	if (hy_khxxb_fkrq!=null)
	{
		hy_khxxb_fkrq=hy_khxxb_fkrq.trim();
		if (!(hy_khxxb_fkrq.equals("")))	wheresql+="  and (hy_khxxb.fkrq<=TO_DATE('"+hy_khxxb_fkrq+"','YYYY/MM/DD'))";
	}
	hy_khxxb_sfysy=request.getParameter("hy_khxxb_sfysy");
	if (hy_khxxb_sfysy!=null)
	{
		hy_khxxb_sfysy=cf.GB2Uni(hy_khxxb_sfysy);
		if (!(hy_khxxb_sfysy.equals("")))	wheresql+=" and  (hy_khxxb.sfysy='"+hy_khxxb_sfysy+"')";
	}
	hy_khxxb_hybh=request.getParameter("hy_khxxb_hybh");
	if (hy_khxxb_hybh!=null)
	{
		hy_khxxb_hybh=cf.GB2Uni(hy_khxxb_hybh);
		if (!(hy_khxxb_hybh.equals("")))	wheresql+=" and  (hy_khxxb.hybh='"+hy_khxxb_hybh+"')";
	}
	hy_khxxb_syrq=request.getParameter("hy_khxxb_syrq");
	if (hy_khxxb_syrq!=null)
	{
		hy_khxxb_syrq=hy_khxxb_syrq.trim();
		if (!(hy_khxxb_syrq.equals("")))	wheresql+="  and (hy_khxxb.syrq>=TO_DATE('"+hy_khxxb_syrq+"','YYYY/MM/DD'))";
	}
	hy_khxxb_syrq=request.getParameter("hy_khxxb_syrq2");
	if (hy_khxxb_syrq!=null)
	{
		hy_khxxb_syrq=hy_khxxb_syrq.trim();
		if (!(hy_khxxb_syrq.equals("")))	wheresql+="  and (hy_khxxb.syrq<=TO_DATE('"+hy_khxxb_syrq+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT hy_khxxb.hykh as hykh,hy_hyjbb.hyjb as hy_hyjbb_hyjb, DECODE(hy_khxxb.sfyfk,'N','δ����','Y','�ѷ���') as hy_khxxb_sfyfk,sq_dwxx.dwmc as sq_dwxx_dwmc,hy_khxxb.fkr as hy_khxxb_fkr,hy_khxxb.fkrq as hy_khxxb_fkrq, DECODE(hy_khxxb.sfysy,'N','δʹ��','Y','��ʹ��') as hy_khxxb_sfysy,hy_khxxb.hybh as hybh,hy_khxxb.syrq as hy_khxxb_syrq  ";
	ls_sql+=" FROM hy_hyjbb,hy_khxxb,sq_dwxx  ";
    ls_sql+=" where hy_khxxb.dwbh=sq_dwxx.dwbh(+) and hy_khxxb.kdlb=hy_hyjbb.hyjbbh(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by hykh  ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hy_khxxbList.jsp","SelectHy_khxxb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hykh","hy_hyjbb_hyjb","hy_khxxb_sfyfk","sq_dwxx_dwmc","hy_khxxb_fkr","hy_khxxb_fkrq","hy_khxxb_sfysy","hy_khxxb_hybh","hy_khxxb_syrq"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hykh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��","ȡ������"};//��ť����ʾ����
	String[] buttonLink={"DeleteKhxx.jsp","Hy_khxxbList.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hybh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/hygl/hyxxgl/ViewHy_hyxxb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hybh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] hykh = request.getParameterValues("hykh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hykh,"hykh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update hy_khxxb set sfyfk='N',dwbh=null,fkr=null,fkrq=null where sfysy='N' and ("+chooseitem+")";
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
	<td  width="6%">&nbsp;</td>
	<td  width="9%">ˮ�ʷ�������</td>
	<td  width="11%">�������</td>
	<td  width="9%">�Ƿ��ѷ���</td>
	<td  width="12%">�տ���λ</td>
	<td  width="9%">������</td>
	<td  width="13%">��������</td>
	<td  width="9%">�Ƿ���ʹ��</td>
	<td  width="9%">��Ա���</td>
	<td  width="13%">����ʹ������</td>
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