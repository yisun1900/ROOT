<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String zwbm=(String)session.getAttribute("zwbm");
String sjsbh=(String)session.getAttribute("sjsbh");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	
	if (zwbm.equals("31"))//�������ܣ�ֻ�ܿ���С�鹤��
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}


	
	String xjzpmc=null;
	String xjjlh=null;

	String lx=null;
	String zpgjz=null;
	String zpsm=null;
	String kkzpbz=null;
	String khly=null;
	String khlysj=null;

	xjzpmc=request.getParameter("xjzpmc");
	if (xjzpmc!=null)
	{
		xjzpmc=cf.GB2Uni(xjzpmc);
		if (!(xjzpmc.equals("")))	wheresql+=" and  (kp_xjgdjlzp.xjzpmc='"+xjzpmc+"')";
	}
	xjjlh=request.getParameter("xjjlh");
	if (xjjlh!=null)
	{
		xjjlh=cf.GB2Uni(xjjlh);
		if (!(xjjlh.equals("")))	wheresql+=" and  (kp_xjgdjlzp.xjjlh='"+xjjlh+"')";
	}

	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (kp_xjgdjlzp.lx='"+lx+"')";
	}
	zpgjz=request.getParameter("zpgjz");
	if (zpgjz!=null)
	{
		zpgjz=cf.GB2Uni(zpgjz);
		if (!(zpgjz.equals("")))	wheresql+=" and  (kp_xjgdjlzp.zpgjz='"+zpgjz+"')";
	}
	zpsm=request.getParameter("zpsm");
	if (zpsm!=null)
	{
		zpsm=cf.GB2Uni(zpsm);
		if (!(zpsm.equals("")))	wheresql+=" and  (kp_xjgdjlzp.zpsm='"+zpsm+"')";
	}
	kkzpbz=request.getParameter("kkzpbz");
	if (kkzpbz!=null)
	{
		kkzpbz=kkzpbz.trim();
		if (!(kkzpbz.equals("")))	wheresql+=" and (kp_xjgdjlzp.kkzpbz="+kkzpbz+") ";
	}
	khly=request.getParameter("khly");
	if (khly!=null)
	{
		khly=cf.GB2Uni(khly);
		if (!(khly.equals("")))	wheresql+=" and  (kp_xjgdjlzp.khly='"+khly+"')";
	}
	khlysj=request.getParameter("khlysj");
	if (khlysj!=null)
	{
		khlysj=khlysj.trim();
		if (!(khlysj.equals("")))	wheresql+="  and (kp_xjgdjlzp.khlysj>=TO_DATE('"+khlysj+"','YYYY-MM-DD'))";
	}
	khlysj=request.getParameter("khlysj2");
	if (khlysj!=null)
	{
		khlysj=khlysj.trim();
		if (!(khlysj.equals("")))	wheresql+="  and (kp_xjgdjlzp.khlysj<=TO_DATE('"+khlysj+"','YYYY-MM-DD'))";
	}

	
	String zpshbz=null;
	zpshbz=request.getParameter("zpshbz");
	if (zpshbz!=null)
	{
		zpshbz=cf.GB2Uni(zpshbz);
		if (!(zpshbz.equals("")))	wheresql+=" and  (kp_xjgdjlzp.zpshbz='"+zpshbz+"')";
	}
	String shr=null;
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (kp_xjgdjlzp.shr='"+shr+"')";
	}
	String shsj=null;
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (kp_xjgdjlzp.shsj>=TO_DATE('"+shsj+"','YYYY-MM-DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (kp_xjgdjlzp.shsj<=TO_DATE('"+shsj+"','YYYY-MM-DD'))";
	}
	
	
	ls_sql="SELECT xjzpmc,'<A HREF=\"/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/'||kp_xjgdjlzp.zpml||'/'||xjzpmc||'\" target=\"_blank\"><img src=\"/yblimg/xjgd/'||kp_xjgdjlzp.zpml||'/'||xjzpmc||'\" width=\"100\"></A>', DECODE(kkzpbz,'0','���ɿ�','1','�ɿ�'), DECODE(zpshbz,'Y','�ϸ�','B','���ϸ�','N','δ���','C','���ϸ�����'),kp_xjgdjlzp.xjjlh,kp_xjgdjl.lrsj, DECODE(kp_xjgdjlzp.lx,'1','������Ƭ','2','�����Ŀ��Ƭ','3','������Ŀ��Ƭ','4','���Ĵ�����Ƭ','5','����������Ƭ'),zpgjz,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.zjxm,sgdmc,zpsm,khly,khlysj,crm_khxx.khbh ";
	ls_sql+=" FROM kp_xjgdjlzp,kp_xjgdjl,crm_khxx,sq_sgd  ";
	ls_sql+=" where kp_xjgdjlzp.xjjlh=kp_xjgdjl.xjjlh(+)  ";
	ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh(+)  ";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)  ";
	ls_sql+=" and (kp_xjgdjlzp.zpshbz='N' or kp_xjgdjlzp.zpshbz='C' or kp_xjgdjlzp.zpshbz is null) ";//Y���ϸ�B�����ϸ�C�����ϸ����ģ�N��δ���
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by kp_xjgdjl.lrsj desc,kp_xjgdjlzp.xjjlh,kp_xjgdjlzp.xjzpmc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Kp_xjgdjlzpShList.jsp","","","EditKp_xjgdjlzp.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xjzpmc","xjjlh","yxjzpmc","lx","zpgjz","zpsm","kkzpbz","khly","khlysj","khbh","zpgjzbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xjzpmc"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");

//���ð�ť����
	String[] buttonName={"�ϸ�ͻ��ɿ�","�ϸ�ͻ����ɿ�"};//��ť����ʾ����
	String[] buttonLink={"SaveSetYszp.jsp?kkzpbz=1","SaveSetYszp.jsp?kkzpbz=0"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"xjjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/sgdgl/xjgd/ViewKp_xjgdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xjjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">��Ƭ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="8%">��Ƭ����</td>
	<td  width="8%">��Ƭ</td>
	<td  width="3%">�ͻ��ɿ���Ƭ��־</td>
	<td  width="3%">��˱�־</td>
	<td  width="4%">����¼��</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="4%">��Ƭ����</td>
	<td  width="6%">��Ƭ�ؼ���</td>
	<td  width="3%">����</td>
	<td  width="8%">��ַ</td>
	<td  width="3%">����</td>
	<td  width="3%">ʩ����</td>
	<td  width="10%">��Ƭ˵��</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="3%">�ͻ�����ʱ��</td>
	<td  width="3%">�ͻ����</td>
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