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
	String dm_bzrwbm_rwbm=null;
	String dm_bzrwbm_rwmc=null;
	String dm_bzrwbm_rwflbm=null;
	String dm_bzrwbm_zdjkrw=null;
	String dm_bzrwbm_bjlb=null;
	String dm_bzrwbm_sqtxts=null;
	String dm_bzrwbm_shtxts=null;
	String dm_bzrwbm_sfyxhxgq=null;
	String dm_bzrwbm_sfyxfc=null;
	String dm_bzrwbm_sfxys=null;

	String sjcpxx=null;
	sjcpxx=request.getParameter("sjcpxx");
	if (sjcpxx!=null)
	{
		sjcpxx=cf.GB2Uni(sjcpxx);
		if (!(sjcpxx.equals("")))	wheresql+=" and  (dm_bzrwbm.sjcpxx='"+sjcpxx+"')";
	}

	String zyrwbm=null;
	zyrwbm=request.getParameter("zyrwbm");
	if (zyrwbm!=null)
	{
		zyrwbm=cf.GB2Uni(zyrwbm);
		if (!(zyrwbm.equals("")))	wheresql+=" and  (dm_bzrwbm.zyrwbm='"+zyrwbm+"')";
	}
	String sfwlcb=null;
	sfwlcb=request.getParameter("sfwlcb");
	if (sfwlcb!=null)
	{
		sfwlcb=cf.GB2Uni(sfwlcb);
		if (!(sfwlcb.equals("")))	wheresql+=" and  (dm_bzrwbm.sfwlcb='"+sfwlcb+"')";
	}
	String rwxh=null;
	rwxh=request.getParameter("rwxh");
	if (rwxh!=null)
	{
		rwxh=cf.GB2Uni(rwxh);
		if (!(rwxh.equals("")))	wheresql+=" and  (dm_bzrwbm.rwxh="+rwxh+")";
	}
	
	dm_bzrwbm_rwbm=request.getParameter("dm_bzrwbm_rwbm");
	if (dm_bzrwbm_rwbm!=null)
	{
		dm_bzrwbm_rwbm=cf.GB2Uni(dm_bzrwbm_rwbm);
		if (!(dm_bzrwbm_rwbm.equals("")))	wheresql+=" and  (dm_bzrwbm.rwbm='"+dm_bzrwbm_rwbm+"')";
	}
	dm_bzrwbm_rwmc=request.getParameter("dm_bzrwbm_rwmc");
	if (dm_bzrwbm_rwmc!=null)
	{
		dm_bzrwbm_rwmc=cf.GB2Uni(dm_bzrwbm_rwmc);
		if (!(dm_bzrwbm_rwmc.equals("")))	wheresql+=" and  (dm_bzrwbm.rwmc='"+dm_bzrwbm_rwmc+"')";
	}
	dm_bzrwbm_rwflbm=request.getParameter("dm_bzrwbm_rwflbm");
	if (dm_bzrwbm_rwflbm!=null)
	{
		dm_bzrwbm_rwflbm=cf.GB2Uni(dm_bzrwbm_rwflbm);
		if (!(dm_bzrwbm_rwflbm.equals("")))	wheresql+=" and  (dm_bzrwbm.rwflbm='"+dm_bzrwbm_rwflbm+"')";
	}
	dm_bzrwbm_zdjkrw=request.getParameter("dm_bzrwbm_zdjkrw");
	if (dm_bzrwbm_zdjkrw!=null)
	{
		dm_bzrwbm_zdjkrw=cf.GB2Uni(dm_bzrwbm_zdjkrw);
		if (!(dm_bzrwbm_zdjkrw.equals("")))	wheresql+=" and  (dm_bzrwbm.zdjkrw='"+dm_bzrwbm_zdjkrw+"')";
	}
	dm_bzrwbm_bjlb=request.getParameter("dm_bzrwbm_bjlb");
	if (dm_bzrwbm_bjlb!=null)
	{
		dm_bzrwbm_bjlb=cf.GB2Uni(dm_bzrwbm_bjlb);
		if (!(dm_bzrwbm_bjlb.equals("")))	wheresql+=" and  (dm_bzrwbm.bjlb='"+dm_bzrwbm_bjlb+"')";
	}
	dm_bzrwbm_sqtxts=request.getParameter("dm_bzrwbm_sqtxts");
	if (dm_bzrwbm_sqtxts!=null)
	{
		dm_bzrwbm_sqtxts=dm_bzrwbm_sqtxts.trim();
		if (!(dm_bzrwbm_sqtxts.equals("")))	wheresql+=" and (dm_bzrwbm.sqtxts>="+dm_bzrwbm_sqtxts+") ";
	}
	dm_bzrwbm_sqtxts=request.getParameter("dm_bzrwbm_sqtxts2");
	if (dm_bzrwbm_sqtxts!=null)
	{
		dm_bzrwbm_sqtxts=dm_bzrwbm_sqtxts.trim();
		if (!(dm_bzrwbm_sqtxts.equals("")))	wheresql+=" and (dm_bzrwbm.sqtxts<="+dm_bzrwbm_sqtxts+") ";
	}
	dm_bzrwbm_shtxts=request.getParameter("dm_bzrwbm_shtxts");
	if (dm_bzrwbm_shtxts!=null)
	{
		dm_bzrwbm_shtxts=dm_bzrwbm_shtxts.trim();
		if (!(dm_bzrwbm_shtxts.equals("")))	wheresql+=" and (dm_bzrwbm.shtxts>="+dm_bzrwbm_shtxts+") ";
	}
	dm_bzrwbm_shtxts=request.getParameter("dm_bzrwbm_shtxts2");
	if (dm_bzrwbm_shtxts!=null)
	{
		dm_bzrwbm_shtxts=dm_bzrwbm_shtxts.trim();
		if (!(dm_bzrwbm_shtxts.equals("")))	wheresql+=" and (dm_bzrwbm.shtxts<="+dm_bzrwbm_shtxts+") ";
	}
	dm_bzrwbm_sfyxhxgq=request.getParameter("dm_bzrwbm_sfyxhxgq");
	if (dm_bzrwbm_sfyxhxgq!=null)
	{
		dm_bzrwbm_sfyxhxgq=cf.GB2Uni(dm_bzrwbm_sfyxhxgq);
		if (!(dm_bzrwbm_sfyxhxgq.equals("")))	wheresql+=" and  (dm_bzrwbm.sfyxhxgq='"+dm_bzrwbm_sfyxhxgq+"')";
	}
	dm_bzrwbm_sfyxfc=request.getParameter("dm_bzrwbm_sfyxfc");
	if (dm_bzrwbm_sfyxfc!=null)
	{
		dm_bzrwbm_sfyxfc=cf.GB2Uni(dm_bzrwbm_sfyxfc);
		if (!(dm_bzrwbm_sfyxfc.equals("")))	wheresql+=" and  (dm_bzrwbm.sfyxfc='"+dm_bzrwbm_sfyxfc+"')";
	}
	dm_bzrwbm_sfxys=request.getParameter("dm_bzrwbm_sfxys");
	if (dm_bzrwbm_sfxys!=null)
	{
		dm_bzrwbm_sfxys=cf.GB2Uni(dm_bzrwbm_sfxys);
		if (!(dm_bzrwbm_sfxys.equals("")))	wheresql+=" and  (dm_bzrwbm.sfxys='"+dm_bzrwbm_sfxys+"')";
	}
	ls_sql="SELECT dm_bzrwbm.rwxh,dm_bzrwbm.rwbm,dm_bzrwbm.rwmc,dm_zyrwbm.zyrwmc,DECODE(dm_bzrwbm.sfwlcb,'Y','��','N','��'),dm_rwflbm.rwflmc, DECODE(dm_bzrwbm.zdjkrw,'1','�ص�','2','���ص�'), DECODE(xgytg,'Y','��','N','��'),gytgts, DECODE(sjcpxx,'Y','��','N','��'),sjcpfl,bjjbmc, DECODE(dm_bzrwbm.bjlb,'1','��ǰ����','2','�º�����','3','��ǰ�º�����','9','һ���¼'),dm_bzrwbm.sqtxnr,dm_bzrwbm.sqtxts,dm_bzrwbm.shtxnr,dm_bzrwbm.shtxts, DECODE(dm_bzrwbm.sfyxhxgq,'Y','��','N','��'), DECODE(dm_bzrwbm.sfyxfc,'Y','��','N','��'), DECODE(dm_bzrwbm.sfxys,'Y','��','N','��'),dm_bzrwbm.ysxm,dm_bzrwbm.gznr,dm_bzrwbm.bz  ";
	ls_sql+=" FROM dm_rwflbm,dm_bzrwbm,dm_zyrwbm,dm_bjjbbm  ";
    ls_sql+=" where dm_bzrwbm.rwflbm=dm_rwflbm.rwflbm(+) and dm_bzrwbm.zyrwbm=dm_zyrwbm.zyrwbm(+)";
    ls_sql+=" and dm_bzrwbm.bjjbbm=dm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_bzrwbm.rwxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_bzrwbmList.jsp","","","EditDm_bzrwbm.jsp");
	pageObj.setPageRow(20);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"rwbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_bzrwbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"rwbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewDm_bzrwbm.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("rwbm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] rwbm = request.getParameterValues("rwbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(rwbm,"rwbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[4];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from dm_bzrwljgx where "+chooseitem;
		sql[1]="delete from dm_bzrwcpfl where "+chooseitem;
		sql[2]="delete from dm_bzrwysxm where "+chooseitem;
		sql[3]="delete from dm_bzrwbm where "+chooseitem;
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
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="2%">�������</td>
	<td  width="8%">��������</td>
	<td  width="4%">ժҪ����</td>
	<td  width="2%">�Ƿ�Ϊ��̱�</td>
	<td  width="3%">�������</td>
	<td  width="2%">�ص�������</td>
	<td  width="2%">�蹤��ͣ��</td>
	<td  width="2%">����ͣ������</td>
	<td  width="2%">�漰��Ʒ��Ϣ</td>
	<td  width="5%">�漰��Ʒ����</td>
	<td  width="2%">��������</td>
	<td  width="3%">�������</td>
	<td  width="11%">��ǰ��������</td>
	<td  width="2%">��ǰ��������</td>
	<td  width="11%">�º���������</td>
	<td  width="2%">�º���������</td>
	<td  width="2%">Ӱ���������</td>
	<td  width="2%">�Ƿ�Ӱ�츴��</td>
	<td  width="2%">�Ƿ�������</td>
	<td  width="6%">������Ŀ</td>
	<td  width="12%">��ע����</td>
	<td  width="8%">����ע</td>
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