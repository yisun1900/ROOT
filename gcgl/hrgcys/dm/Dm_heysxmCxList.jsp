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
	String gcysbbh=null;
	String gcysxmbm=null;
	String gcysxmmc=null;
	String ysxmflbm=null;
	String dygcjdbm=null;
	String sfsgjdb=null;
	String jdbm=null;
	String sfhf=null;
	String hflxbm=null;
	String ljskbfb=null;
	String yszxsl=null;
	String byxsl=null;
	String fbyxzxsl=null;
	gcysbbh=request.getParameter("gcysbbh");
	if (gcysbbh!=null)
	{
		gcysbbh=cf.GB2Uni(gcysbbh);
		if (!(gcysbbh.equals("")))	wheresql+=" and  (dm_heysxm.gcysbbh='"+gcysbbh+"')";
	}
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (dm_heysxm.gcysxmbm='"+gcysxmbm+"')";
	}
	gcysxmmc=request.getParameter("gcysxmmc");
	if (gcysxmmc!=null)
	{
		gcysxmmc=cf.GB2Uni(gcysxmmc);
		if (!(gcysxmmc.equals("")))	wheresql+=" and  (dm_heysxm.gcysxmmc='"+gcysxmmc+"')";
	}
	ysxmflbm=request.getParameter("ysxmflbm");
	if (ysxmflbm!=null)
	{
		ysxmflbm=cf.GB2Uni(ysxmflbm);
		if (!(ysxmflbm.equals("")))	wheresql+=" and  (dm_heysxm.ysxmflbm='"+ysxmflbm+"')";
	}
	dygcjdbm=request.getParameter("dygcjdbm");
	if (dygcjdbm!=null)
	{
		dygcjdbm=cf.GB2Uni(dygcjdbm);
		if (!(dygcjdbm.equals("")))	wheresql+=" and  (dm_heysxm.dygcjdbm='"+dygcjdbm+"')";
	}
	sfsgjdb=request.getParameter("sfsgjdb");
	if (sfsgjdb!=null)
	{
		sfsgjdb=cf.GB2Uni(sfsgjdb);
		if (!(sfsgjdb.equals("")))	wheresql+=" and  (dm_heysxm.sfsgjdb='"+sfsgjdb+"')";
	}
	jdbm=request.getParameter("jdbm");
	if (jdbm!=null)
	{
		jdbm=cf.GB2Uni(jdbm);
		if (!(jdbm.equals("")))	wheresql+=" and  (dm_heysxm.jdbm='"+jdbm+"')";
	}
	sfhf=request.getParameter("sfhf");
	if (sfhf!=null)
	{
		sfhf=cf.GB2Uni(sfhf);
		if (!(sfhf.equals("")))	wheresql+=" and  (dm_heysxm.sfhf='"+sfhf+"')";
	}
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (dm_heysxm.hflxbm='"+hflxbm+"')";
	}
	ljskbfb=request.getParameter("ljskbfb");
	if (ljskbfb!=null)
	{
		ljskbfb=ljskbfb.trim();
		if (!(ljskbfb.equals("")))	wheresql+=" and  (dm_heysxm.ljskbfb="+ljskbfb+") ";
	}
	yszxsl=request.getParameter("yszxsl");
	if (yszxsl!=null)
	{
		yszxsl=yszxsl.trim();
		if (!(yszxsl.equals("")))	wheresql+=" and (dm_heysxm.yszxsl="+yszxsl+") ";
	}
	byxsl=request.getParameter("byxsl");
	if (byxsl!=null)
	{
		byxsl=byxsl.trim();
		if (!(byxsl.equals("")))	wheresql+=" and (byxsl="+byxsl+") ";
	}
	fbyxzxsl=request.getParameter("fbyxzxsl");
	if (fbyxzxsl!=null)
	{
		fbyxzxsl=fbyxzxsl.trim();
		if (!(fbyxzxsl.equals("")))	wheresql+=" and (dm_heysxm.fbyxzxsl="+fbyxzxsl+") ";
	}

	ls_sql="SELECT dm_heysxm.gcysbbh,dm_hegcysbb.gcysbbmc,dm_heysxm.yssx,dm_heysxm.gcysxmbm,gcysxmmc,ysxmflmc,ysgcjdmc, DECODE(sfsgjdb,'Y','��','N','��'),rwmc, DECODE(sfhf,'Y','����','N','��'),hflxmc,ljskbfb,yszxsl,byxsl,fbyxzxsl,DECODE(xmlx,'1','������','2','״̬��'),ysbzsm,dm_heysxm.bz  ";
	ls_sql+=" FROM dm_heysxm,dm_hegcysbb,dm_ysxmflbm,dm_gcjdbm,dm_hflxbm,gdm_rwbm ";
	ls_sql+=" where dm_heysxm.gcysbbh=dm_hegcysbb.gcysbbh(+) ";
    ls_sql+=" and dm_heysxm.ysxmflbm=dm_ysxmflbm.ysxmflbm(+) and dm_heysxm.dygcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and dm_heysxm.hflxbm=dm_hflxbm.hflxbm(+)";
    ls_sql+=" and dm_heysxm.jdbm=gdm_rwbm.rwbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_heysxm.gcysbbh desc,dm_heysxm.yssx";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_heysxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gcysbbh","gcysxmbm","gcysxmmc","ysxmflbm","dygcjdbm","sfsgjdb","jdbm","sfhf","hflxbm","ljskbfb","yszxsl","byxsl","fbyxzxsl","ysbzsm","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gcysbbh","gcysxmbm"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���հ汾��</td>
	<td  width="7%">���հ汾��</td>
	<td  width="3%">����˳��</td>
	<td  width="3%">������Ŀ����</td>
	<td  width="9%">������Ŀ����</td>
	<td  width="4%">������Ŀ����</td>
	<td  width="4%">��Ӧ���̽���</td>
	<td  width="3%">�Ƿ����ʩ�����ȱ�</td>
	<td  width="5%">ʩ�����Ƚ��Ƚڵ�</td>
	<td  width="3%">�Ƿ�ط�</td>
	<td  width="5%">�ط�����</td>
	<td  width="3%">�ۼƼ�װ�տ�ٷֱ�</td>
	<td  width="3%">������������</td>
	<td  width="3%">����������</td>
	<td  width="3%">�Ǳ�������С����</td>
	<td  width="3%">��Ŀ����</td>
	<td  width="25%">���ձ�׼˵��</td>
	<td  width="235%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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