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
	String kp_zjcfgl_cfjlh=null;
	String kp_zjcfgl_zjxm=null;
	String kp_zjcfgl_fgsbh=null;
	String kp_zjcfgl_cfr=null;
	String kp_zjcfgl_cfsj=null;
	String kp_zjcfgl_cflxbm=null;
	String kp_zjcfgl_cfyybm=null;
	String kp_zjcfgl_lrr=null;
	String kp_zjcfgl_lrsj=null;
	String kp_zjcfgl_lrdw=null;
	String kp_zjcfgl_cfspbz=null;
	String kp_zjcfgl_spr=null;
	String kp_zjcfgl_spsj=null;
	kp_zjcfgl_cfjlh=request.getParameter("kp_zjcfgl_cfjlh");
	if (kp_zjcfgl_cfjlh!=null)
	{
		kp_zjcfgl_cfjlh=kp_zjcfgl_cfjlh.trim();
		if (!(kp_zjcfgl_cfjlh.equals("")))	wheresql+=" and (kp_zjcfgl.cfjlh="+kp_zjcfgl_cfjlh+") ";
	}
	kp_zjcfgl_zjxm=request.getParameter("kp_zjcfgl_zjxm");
	if (kp_zjcfgl_zjxm!=null)
	{
		kp_zjcfgl_zjxm=cf.GB2Uni(kp_zjcfgl_zjxm);
		if (!(kp_zjcfgl_zjxm.equals("")))	wheresql+=" and  (kp_zjcfgl.zjxm='"+kp_zjcfgl_zjxm+"')";
	}
	kp_zjcfgl_fgsbh=request.getParameter("kp_zjcfgl_fgsbh");
	if (kp_zjcfgl_fgsbh!=null)
	{
		kp_zjcfgl_fgsbh=cf.GB2Uni(kp_zjcfgl_fgsbh);
		if (!(kp_zjcfgl_fgsbh.equals("")))	wheresql+=" and  (kp_zjcfgl.fgsbh='"+kp_zjcfgl_fgsbh+"')";
	}
	kp_zjcfgl_cfr=request.getParameter("kp_zjcfgl_cfr");
	if (kp_zjcfgl_cfr!=null)
	{
		kp_zjcfgl_cfr=cf.GB2Uni(kp_zjcfgl_cfr);
		if (!(kp_zjcfgl_cfr.equals("")))	wheresql+=" and  (kp_zjcfgl.cfr='"+kp_zjcfgl_cfr+"')";
	}
	kp_zjcfgl_cfsj=request.getParameter("kp_zjcfgl_cfsj");
	if (kp_zjcfgl_cfsj!=null)
	{
		kp_zjcfgl_cfsj=kp_zjcfgl_cfsj.trim();
		if (!(kp_zjcfgl_cfsj.equals("")))	wheresql+="  and (kp_zjcfgl.cfsj>=TO_DATE('"+kp_zjcfgl_cfsj+"','YYYY/MM/DD'))";
	}
	kp_zjcfgl_cfsj=request.getParameter("kp_zjcfgl_cfsj2");
	if (kp_zjcfgl_cfsj!=null)
	{
		kp_zjcfgl_cfsj=kp_zjcfgl_cfsj.trim();
		if (!(kp_zjcfgl_cfsj.equals("")))	wheresql+="  and (kp_zjcfgl.cfsj<=TO_DATE('"+kp_zjcfgl_cfsj+"','YYYY/MM/DD'))";
	}
	kp_zjcfgl_cflxbm=request.getParameter("kp_zjcfgl_cflxbm");
	if (kp_zjcfgl_cflxbm!=null)
	{
		kp_zjcfgl_cflxbm=cf.GB2Uni(kp_zjcfgl_cflxbm);
		if (!(kp_zjcfgl_cflxbm.equals("")))	wheresql+=" and  (kp_zjcfgl.cflxbm='"+kp_zjcfgl_cflxbm+"')";
	}
	kp_zjcfgl_cfyybm=request.getParameter("kp_zjcfgl_cfyybm");
	if (kp_zjcfgl_cfyybm!=null)
	{
		kp_zjcfgl_cfyybm=cf.GB2Uni(kp_zjcfgl_cfyybm);
		if (!(kp_zjcfgl_cfyybm.equals("")))	wheresql+=" and  (kp_zjcfgl.cfyybm='"+kp_zjcfgl_cfyybm+"')";
	}
	kp_zjcfgl_lrr=request.getParameter("kp_zjcfgl_lrr");
	if (kp_zjcfgl_lrr!=null)
	{
		kp_zjcfgl_lrr=cf.GB2Uni(kp_zjcfgl_lrr);
		if (!(kp_zjcfgl_lrr.equals("")))	wheresql+=" and  (kp_zjcfgl.lrr='"+kp_zjcfgl_lrr+"')";
	}
	kp_zjcfgl_lrsj=request.getParameter("kp_zjcfgl_lrsj");
	if (kp_zjcfgl_lrsj!=null)
	{
		kp_zjcfgl_lrsj=kp_zjcfgl_lrsj.trim();
		if (!(kp_zjcfgl_lrsj.equals("")))	wheresql+="  and (kp_zjcfgl.lrsj=TO_DATE('"+kp_zjcfgl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_zjcfgl_lrdw=request.getParameter("kp_zjcfgl_lrdw");
	if (kp_zjcfgl_lrdw!=null)
	{
		kp_zjcfgl_lrdw=cf.GB2Uni(kp_zjcfgl_lrdw);
		if (!(kp_zjcfgl_lrdw.equals("")))	wheresql+=" and  (kp_zjcfgl.lrdw='"+kp_zjcfgl_lrdw+"')";
	}
	kp_zjcfgl_cfspbz=request.getParameter("kp_zjcfgl_cfspbz");
	if (kp_zjcfgl_cfspbz!=null)
	{
		kp_zjcfgl_cfspbz=cf.GB2Uni(kp_zjcfgl_cfspbz);
		if (!(kp_zjcfgl_cfspbz.equals("")))	wheresql+=" and  (kp_zjcfgl.cfspbz='"+kp_zjcfgl_cfspbz+"')";
	}
	kp_zjcfgl_spr=request.getParameter("kp_zjcfgl_spr");
	if (kp_zjcfgl_spr!=null)
	{
		kp_zjcfgl_spr=cf.GB2Uni(kp_zjcfgl_spr);
		if (!(kp_zjcfgl_spr.equals("")))	wheresql+=" and  (kp_zjcfgl.spr='"+kp_zjcfgl_spr+"')";
	}
	kp_zjcfgl_spsj=request.getParameter("kp_zjcfgl_spsj");
	if (kp_zjcfgl_spsj!=null)
	{
		kp_zjcfgl_spsj=kp_zjcfgl_spsj.trim();
		if (!(kp_zjcfgl_spsj.equals("")))	wheresql+="  and (kp_zjcfgl.spsj=TO_DATE('"+kp_zjcfgl_spsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT kp_zjcfgl.cfjlh,kp_zjcfgl.zjxm,kp_zjcfgl.fgsbh,kp_zjcfgl.cfr,kp_zjcfgl.cfsj,kp_cflxbm.cflxmc,kp_cfyybm.cfyymc,kp_zjcfgl.fkze,kp_zjcfgl.kf,kp_zjcfgl.lrr,kp_zjcfgl.lrsj,kp_zjcfgl.lrdw, DECODE(kp_zjcfgl.cfspbz,'2','δ����','3','����ͨ��','4','����δͨ��'),kp_zjcfgl.spyj,kp_zjcfgl.spr,kp_zjcfgl.spsj,kp_zjcfgl.bz  ";
	ls_sql+=" FROM kp_cflxbm,kp_cfyybm,kp_zjcfgl  ";
    ls_sql+=" where kp_zjcfgl.cflxbm=kp_cflxbm.cflxbm(+) and kp_zjcfgl.cfyybm=kp_cfyybm.cfyybm(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_zjcfglList.jsp","SelectKp_zjcfgl.jsp","","EditKp_zjcfgl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cfjlh","kp_zjcfgl_zjxm","kp_zjcfgl_fgsbh","kp_zjcfgl_cfr","kp_zjcfgl_cfsj","kp_cflxbm_cflxmc","kp_cfyybm_cfyymc","kp_zjcfgl_fkze","kp_zjcfgl_kf","kp_zjcfgl_lrr","kp_zjcfgl_lrsj","kp_zjcfgl_lrdw","kp_zjcfgl_cfspbz","kp_zjcfgl_spyj","kp_zjcfgl_spr","kp_zjcfgl_spsj","kp_zjcfgl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cfjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Kp_zjcfglList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] cfjlh = request.getParameterValues("cfjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cfjlh,"cfjlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from kp_zjcfgl where "+chooseitem;
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
	<td  width="5%">������¼��</td>
	<td  width="5%">���̵���</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="5%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="5%">��������</td>
	<td  width="5%">����ԭ��</td>
	<td  width="5%">�����ܶ�</td>
	<td  width="5%">�۷�</td>
	<td  width="5%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="5%">¼�뵥λ</td>
	<td  width="5%">������־</td>
	<td  width="5%">�������</td>
	<td  width="5%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="5%">��ע</td>
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